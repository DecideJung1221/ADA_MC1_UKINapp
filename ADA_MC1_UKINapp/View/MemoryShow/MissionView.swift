//
//  MissionView.swift
//  ADA_MC1_UKINapp
//
//  Created by 정혜정 on 4/2/24.
//

import SwiftUI

struct MissionView: View{
        
    @Environment(\.presentationMode) var presentation
    
    
    var body: some View{
        Text("오늘의 미션입니다.\n 우연한 기록을 3개이상 기록하세요.")
        
        Button(action: {
            presentation.wrappedValue.dismiss()
        }) {
            Text(" 닫기").bold()
        }
    }
    
}

