//
//  transtalkView.swift
//  ADA_MC1_UKINapp
//
//  Created by 정혜정 on 4/2/24.
//
import SwiftUI

struct transtalkView: View{
    
    
    @Environment(\.presentationMode) var presentation
    
    
    var body: some View{
        Text("영어 : Where are you going?")
            .font(.title2)
        Text("웨어 아아 유 고우잉?")
            .foregroundStyle(.secondary)
        Divider()
        
        Text("일본어 : どこへ行くんですか？")
            .font(.title2)
        Text("도코에 이쿠데스카?")
            .foregroundStyle(.secondary)
        Divider()
        
        Text("중국어 : 去 哪里")
            .font(.title2)
        Text("qù nalǐ?")
            .foregroundStyle(.secondary)
        Divider()
        
        Text("스페인어 : ¿Adónde vas?")
            .font(.title2)
        Text("")
            .foregroundStyle(.secondary)
        Divider()
        
        Text("프랑스어 : Où allez-vous ?")
            .font(.title2)
        Text("")
            .foregroundStyle(.secondary)
        Divider()
        
        
        Button(action: {
            presentation.wrappedValue.dismiss()
        }) {
            Text(" 닫기").bold()
        }

        
    }
    
}
