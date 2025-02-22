//
//  FormTypeMessageView.swift
//
//
//  Created by Danilo Hernandez.
//

import SwiftUI

public struct FormTypeMessageView: View {
    
    @Environment(\.dismiss) var dismiss
    @State var selectionType: OptionsMessageModel = OptionsMessageModel(text: "Seleccion unica", id: "1")
    var arrayOptionsType = [OptionsMessageModel(text: "Seleccion unica", id: "1"), OptionsMessageModel(text: "Multiple seleccion", id: "2"), OptionsMessageModel(text: "Otra opcion", id: "3")]
    @State public var saveOptions: [OptionsMessage] = []
    @State var arrayOptions: [TextFieldViewPersonalizedForm] = []
    @State var count: Int = 0
    @StateObject var viewModel: FormTypeMessageViewModel
    @State var text: String = ""
    var messageModel: MessageModel?
    public init (toUUID: String, messageModel: MessageModel?) {
        self.messageModel = messageModel
        self._viewModel = StateObject(wrappedValue: FormTypeMessageViewModel(toUUID: toUUID, messageModel: messageModel))
        
    }
    public var body: some View {
        Form {
            Section {
                Picker("Tipo de mensaje", selection: $selectionType) {
                    ForEach(arrayOptionsType, id: \.self) {
                        Text($0.text)
                    }
                }.pickerStyle(.menu)
                
                VStack{
                    TextField("Mensaje", text: $text)
                        .padding()
                        .background(.gray.opacity(0.2))
                        .clipShape(RoundedRectangle(cornerRadius: 18))
                        .shadow(radius: 15)
                    if selectionType.text == TypeMessage.multipleChoice.rawValue || selectionType.text == TypeMessage.onChoice.rawValue {
                        
                        ForEach(arrayOptions, id: \.self) { textField in
                            HStack {
                                Text("Opción \(showOption(textField: textField)):")
                                textField
                            }
                        }
                        Button(action: {
                            arrayOptions.append(TextFieldViewPersonalizedForm(saveOption: $saveOptions))
                        }, label: {
                            Text("Añadir opción").padding()
                        })
                    }
                }
            } header: {
                Text("Mensaje personalizado")
            }
            Section {
                Button(action: {
                    Task {
                        await viewModel.sendMessage(message: text, type: TypeMessage.onChoice.rawValue, options: saveOptions, completion: {
                            status in
                            switch status {
                                case .success(_):
                                    dismiss()
                                case .failure(_):
                                    break
                            }
                        })
                    }
                }, label: {
                    Text("Enviar mensaje").foregroundColor(.white)
                }).padding()
                .background(.blue)
                .clipShape(RoundedRectangle(cornerRadius: 18))
                Button(action: {
                    
                    Task {
                        await viewModel.sendMessage(message: text, type: TypeMessage.signature.rawValue, options: saveOptions, completion: {
                            status in
                            switch status {
                                case .success(_):
                                    dismiss()
                                case .failure(_):
                                    break
                            }
                        })
                    }
                }, label: {
                    Text("Enviar firma").foregroundColor(.white)
                }).padding()
                .background(.blue)
                .clipShape(RoundedRectangle(cornerRadius: 18))
            }
        }
    }
    
  
    func showOption(textField: TextFieldViewPersonalizedForm) -> Int {
        if let position = saveOptions.firstIndex(where: {$0.id == "\(textField.id)"}){
            saveOptions[position].position ?? 1
        } else {
            arrayOptions.count
        }
    }
}
