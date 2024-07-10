//
//  MockInformation.swift
//
//
//  Created by Danilo Hernandez.
//

import Foundation
import SwiftUI

public struct MockInformation {

    static let initialMainView: RemoteConfigModelMainView = RemoteConfigModelMainView(colorbackgroundImage: "#0064FF", mainTitle: TextViewModelInfoApi(text: "Bienvenido", fontSize: "24", foregroundColor: "#000000"), searchBar: SearchBarModel(backgroundColor: "#FFFFFF", placeHolder: TextViewModelInfoApi(text: "Buscar articulo", fontSize: "15", foregroundColor: "#6feddc")))
    
    static let metaDataCheckBox: DVMetaData = DVMetaData(id: "checkBox", label: "Selecciona una opcion", saveField: true, options: [OptionItemModelV2(value: "cedula", label: "Cedula", foregroundColor: "#003865"),OptionItemModelV2(value: "tarjetaIdentidad", label: "Tarjeta de identidad", foregroundColor: "#000000")], textColor: "#003865", fontSize: 15.0, isRequired: true, name: "NoseNombre", additionalInfo: AdditionalInfo(bold: true, color: "#000000", fontSize: "15", textAlign: "Center"))
    static let metaDataCheckBox2: DVMetaData = DVMetaData(id: "checkBox", label: "Selecciona una opcion", saveField: true, options: [OptionItemModelV2(value: "cedula1", label: "Cedula", foregroundColor: "#003865"),OptionItemModelV2(value: "tarjetaIdentidad2", label: "Tarjeta de identidad", foregroundColor: "#000000")], textColor: "#003865", fontSize: 15.0, isRequired: true, name: "NoseNombre", additionalInfo: AdditionalInfo(bold: true, color: "#000000", fontSize: "15", textAlign: "Center"))
    
    static let cardModelChatHistory: CardModel = CardModel( id: "chatHistory", image: ImageModel(image: "https://solucionesbpo.com/wp-content/uploads/2021/08/young-woman-with-microphone-working-on-record-studio-scaled-e1632251040963.jpeg", backgroundColor: nil), titleFormat: textViewModel,dateFormat: TextViewModel(text: "12:03 PM (25-OCT-2024)", foregroundColor: .gray, font: .system(size: 12)), designCard: ComponentDesign(backgroundColor: .gray.opacity(0.1), cornerRaiuds: 15), action: "chat", type: "text")
    static let cardModelList: CardModel = CardModel(id: "link_token",  link: "https://www.bancolombia.com/personas/creditos/consumo/credito-libre-inversion", titleFormat: textViewModel, type: "text")
    
    static let cardModel: CardModel = CardModel(id: "modelCard", image: ImageModel(image: "https://solucionesbpo.com/wp-content/uploads/2021/08/young-woman-with-microphone-working-on-record-studio-scaled-e1632251040963.jpeg"), link: "https://www.bancolombia.com/personas", titleFormat: TextViewModel(text: "Thank you", foregroundColor: .black, font: .bold(Font.system(size: 15))()), dateFormat: TextViewModel(text: "12:03 PM (25-OCT-2024)", foregroundColor: .black, font: .system(size: 12)), nameFormat: TextViewModel(text: "Danilo", foregroundColor: .black, font: .bold(Font.system(size: 15))()), type: "text")
    
    static let textViewModel: TextViewModel = TextViewModel(text: "Help with my token Help with my token Help with my token Help with m p with my token Help with my token Help with my token sss ", foregroundColor: .black, font: .system(size: 14), expandable: false)
    static let cardListArray : [CardModel] = [
        CardModel(id: "1", link: "https://www.bancolombia.com/personas", titleFormat: TextViewModel(text: "Ayuda con Token",foregroundColor: .black, font: .system(size: 14)), type: "text"),
        CardModel(id: "2", link: "https://www.apple.com/co/", titleFormat: TextViewModel(text:"Ayuda con mi clave",foregroundColor: .black, font: .system(size: 14)), type: "text"),
        CardModel(id: "3", link: "https://www.bancolombia.com/personas", titleFormat: TextViewModel(text: "Atencion al cliente",foregroundColor: .black, font: .system(size: 14)), type: "text"),
        CardModel(id: "4", link: "https://www.apple.com/co/", titleFormat: TextViewModel(text: "Ayuda con transferencia",foregroundColor: .black, font: .system(size: 14)), type: "text")]
    
    static let cardListZonas : [CardModel] = [
        CardModel(id: "1",image: ImageModel(image: "https://d2yoo3qu6vrk5d.cloudfront.net/pulzo-lite/images-resized/PP3368702A-h-o.jpg"), link: "https://maps.app.goo.gl/QD9z6MCQgEJb1Ffg7", titleFormat: TextViewModel(text: "Bancolombia Fusagasuga",foregroundColor: .black, font: .system(size: 14)), type: "text"),
        CardModel(id: "2", image: ImageModel(image: "https://d2yoo3qu6vrk5d.cloudfront.net/pulzo-lite/images-resized/PP3368702A-h-o.jpg", backgroundColor: .yellow),link: "https://maps.app.goo.gl/QD9z6MCQgEJb1Ffg7", titleFormat: TextViewModel(text:" Banco Bogota",foregroundColor: .black, font: .system(size: 14)), type: "text"),
        CardModel(id: "3",image: ImageModel(image: "https://d2yoo3qu6vrk5d.cloudfront.net/pulzo-lite/images-resized/PP3368702A-h-o.jpg", backgroundColor: .pink),link: "https://maps.app.goo.gl/QD9z6MCQgEJb1Ffg7", titleFormat: TextViewModel(text: "Banco Ibagué",foregroundColor: .black, font: .system(size: 14)), type: "text"),
        CardModel(id: "4", image: ImageModel(image: "https://d2yoo3qu6vrk5d.cloudfront.net/pulzo-lite/images-resized/PP3368702A-h-o.jpg", backgroundColor: .blue), link: "https://maps.app.goo.gl/QD9z6MCQgEJb1Ffg7", titleFormat: TextViewModel(text:" Banco Cartagena",foregroundColor: .black, font: .system(size: 14)), type: "text")]
    
    static let generalConfiguration: GeneralConfiguration = GeneralConfiguration(buttonInformationStartChat: buttonModel, placeHolderSearchBar: "Buscar articulo", titleModule: TextViewModel(text: "Bienvenido a soporte", foregroundColor: .black, font: .bold(Font.system(size: 20))()), titleLastChat: TextViewModel(text: "Ultima conversación", foregroundColor: .black, font: .bold(Font.system(size: 16))()), titleChatButton: "Iniciar chat")
    
    static let buttonModel: ButtonModel = ButtonModel(image: Image(systemName: "person"), designButton: ComponentDesign(backgroundColor: .gray.opacity(0.1), cornerRaiuds: 15), title: TextViewModel(text: "Iniciar conversación", foregroundColor: .black))
    
    static let queryTypesModelArray: [QueryTypesModel] = [QueryTypesModel(id: "1", title: TextViewModel(text: "Ayuda con mi clave")), QueryTypesModel(id: "2", title: TextViewModel(text: "Consulta en general"))]
    
    static  var messages: [MessagesStruct] = [
        MessagesStruct(id: "1", message: TextViewModel(text: "Hola, necesito ayuda"), date: TextViewModel(text: "8/11/2024"), receive: false),
        MessagesStruct(id: "4", linkImage: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8CisSiBujLxDxz7h8hWHp6tW5FoGRHjImwzGO-93sz79TXfJxDHdCAH59tfYhyiiG1_A&usqp=CAU", date: TextViewModel(text: "8/11/2024"), receive: true, specialMessage: SpecialMessage(metaData: MockInformation.metaDataCheckBox2)),
        MessagesStruct(id: "2", linkImage: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8CisSiBujLxDxz7h8hWHp6tW5FoGRHjImwzGO-93sz79TXfJxDHdCAH59tfYhyiiG1_A&usqp=CAU", message: TextViewModel(text: "Hola, Juaquin, un gusto en saludarte"), date: TextViewModel(text: "8/11/2024"), receive: true),
        MessagesStruct(id: "4", linkImage: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8CisSiBujLxDxz7h8hWHp6tW5FoGRHjImwzGO-93sz79TXfJxDHdCAH59tfYhyiiG1_A&usqp=CAU", date: TextViewModel(text: "8/11/2024"), receive: true, specialMessage: SpecialMessage(metaData: MockInformation.metaDataCheckBox)),
        MessagesStruct(id: "2", linkImage: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8CisSiBujLxDxz7h8hWHp6tW5FoGRHjImwzGO-93sz79TXfJxDHdCAH59tfYhyiiG1_A&usqp=CAU", message: TextViewModel(text: "Cuentame, en que te puedo colaborar"), date: TextViewModel(text: "8/11/2024"), receive: true),
        MessagesStruct(id: "1", message: TextViewModel(text: "No puedo hacer una transferencia, me sale error de conexion"), date: TextViewModel(text: "8/11/2024"), receive: false), MessagesStruct(id: "1", message: TextViewModel(text: "Hola, necesito ayuda"), date: TextViewModel(text: "8/11/2024"), receive: false),
        MessagesStruct(id: "2", linkImage: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8CisSiBujLxDxz7h8hWHp6tW5FoGRHjImwzGO-93sz79TXfJxDHdCAH59tfYhyiiG1_A&usqp=CAU", message: TextViewModel(text: "Hola, Juaquin, un gusto en saludarte"), date: TextViewModel(text: "8/11/2024"), receive: true),
        MessagesStruct(id: "2", linkImage: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8CisSiBujLxDxz7h8hWHp6tW5FoGRHjImwzGO-93sz79TXfJxDHdCAH59tfYhyiiG1_A&usqp=CAU", message: TextViewModel(text: "Hola, en qué te puedo colaborar? Hola, en qué te puedo colaborar? Hola, en Hola, en qué te puedo colaborar? Hola, en qué te puedo colaborar? Hola, en Hola, en qué te puedo colaborar? Hola, en qué te puedo colaborar? Hola, en Hola, en qué te puedo colaborar? Hola, en qué te puedo colaborar? Hola, en Hola, en qué te puedo colaborar? Hola, en qué te puedo colaborar? Hola, en Hola, en qué te puedo colaborar? Hola, en qué te puedo colaborar? Hola, en Hola, en qué te puedo colaborar? Hola, en qué te puedo colaborar? Hola, en Hola, en qué te puedo colaborar? Hola, en qué te puedo colaborar? Hola, en hola", expandable: true), date: TextViewModel(text: "8/11/2024"), receive: true),
        MessagesStruct(id: "1", message: TextViewModel(text: "No puedo hacer una transferencia, me sale error de conexion"), date: TextViewModel(text: "8/11/2024"), receive: false)]
}

