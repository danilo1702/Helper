//
//  FormTypeMessageViewModel.swift
//
//
//  Created by Danilo Hernandez.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import SwiftUI
import Drawing


public class FormTypeMessageViewModel: ObservableObject {
    public var toUUID: String
    public var messageModel: MessageModel?
    public init (toUUID: String, messageModel: MessageModel?) {
        self.toUUID = toUUID
        self.messageModel = messageModel
    }
    
    func sendMessage(message: String, type: String, options: [OptionsMessage], completion: @escaping (Result<Bool, Never>) async -> ()) async {
    
        var optionsToSend : [[String: Any]] = []
        var messageToSend: [String : Any]
        guard let fromUUID = FirebaseManagerData.initialization.dbAuth.currentUser?.uid else { return }
        
        let referenceSender = FirebaseManagerData.initialization.dbFirestore.collection(FirebaseConstants.messages)
            .document(fromUUID)
            .collection(toUUID)
            .document()
        
            optionsToSend = options.map { option  in
                guard let text = option.text, let position = option.position else { return [:]}
                return ["id": option.id, "text": text, "position": position]

        }
        
        if type == TypeMessage.image.rawValue {
            messageToSend = [FirebaseConstants.message: message, FirebaseConstants.fromUUID: fromUUID, FirebaseConstants.toUUID: toUUID, FirebaseConstants.timestamp: Timestamp(), FirebaseConstants.fromName: UIDevice.modelName, "type": type] as [String: Any]
        } else {
            messageToSend = [FirebaseConstants.message: message, FirebaseConstants.fromUUID: fromUUID, FirebaseConstants.toUUID: toUUID, FirebaseConstants.timestamp: Timestamp(), FirebaseConstants.fromName: UIDevice.modelName, "type": type, "options": optionsToSend] as [String: Any]
        }
         referenceSender.setData(messageToSend) { error in
                if error != nil {
                    print("Errro sending de message ")
                    return
                }
            }
        
        let referenceReceiver = FirebaseManagerData.initialization.dbFirestore.collection(FirebaseConstants.messages)
            .document(toUUID)
            .collection(fromUUID)
            .document(referenceSender.documentID)
        
        referenceReceiver.setData(messageToSend) { error in
            if error != nil {
                print("Error saving the message receiver")
                return
            }
            print(messageToSend)
        }
        DispatchQueue.main.async {
            self.saveLastMessage(fromUUID: fromUUID, message: &messageToSend)
        }
        await completion(.success(true))
    }
    
    func updateMessage(message: String, type: String, options: [OptionsMessage], completion: @escaping (Result<Bool, Never>) -> ()) async {
        guard let fromUUID = FirebaseManagerData.initialization.dbAuth.currentUser?.uid, let documentId = messageModel?.id else { return }
        var optionsToSend : [[String: Any]] = []
        let referenceSender = FirebaseManagerData.initialization.dbFirestore.collection(FirebaseConstants.messages)
            .document(fromUUID)
            .collection(toUUID)
            .document(documentId)
        
        let referenceReceiver = FirebaseManagerData.initialization.dbFirestore.collection(FirebaseConstants.messages)
            .document(toUUID)
            .collection(fromUUID)
            .document(documentId)
        if options.count > 0, let firstOption = options.first, let lines = firstOption.lines, type == TypeMessage.signature.rawValue {
//                let points = lines.map({$0.points.map({PointsLineApi(x: $0.x, y: $0.y)})})
//                let lines = lines.map{linesModelApi(points: points[0], color: "black", lineWidth: $0.lineWidth)}
                
            var arrayLineModel: [String: Any] = [:]
            lines.forEach { line in
                arrayLineModel["color"] = "black"
                arrayLineModel["lineWidth"] = line.lineWidth
                var arrayPoints: [[String: Any]] = []
                line.points.forEach { point in
                    arrayPoints.append(["x": "\(point.x)", "y": "\(point.y)"])
                }
                arrayLineModel["points"] = arrayPoints
            }
            
            optionsToSend = [["id": firstOption.id, "text": "Signature", "lines": arrayLineModel]]
        }
        do {
          try await referenceSender.updateData([
            "options": optionsToSend
          ])
            try await referenceReceiver.updateData([
                "options": optionsToSend
              ])
          print("Document  updated")
        } catch {
          print("Error updating document: \(error)")
        }
    }
    
    
    func saveLastMessage(fromUUID: String, message: inout [String: Any]) {
        
        
        var messageReceiver = message
        messageReceiver [FirebaseConstants.messageRead] = true
        let senderReference = FirebaseManagerData.initialization.dbFirestore.collection(FirebaseConstants.lastMessages)
            .document(fromUUID)
            .collection(FirebaseConstants.messages)
            .document(toUUID)
        
        let receiverReference = FirebaseManagerData.initialization.dbFirestore.collection(FirebaseConstants.lastMessages)
            .document(toUUID)
            .collection(FirebaseConstants.messages)
            .document(fromUUID)
        
        let batch = FirebaseManagerData.initialization.dbFirestore.batch()
        
        batch.setData(message, forDocument: senderReference)
        batch.setData(messageReceiver, forDocument: receiverReference)
        
        batch.commit { error in
            if let error = error {
                print("Error saving last message: \(error.localizedDescription)")
            } else {
                print("Last message saved successfully")
            }
        }
    }
}
