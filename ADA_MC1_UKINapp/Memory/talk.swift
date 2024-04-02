//
//  talk.swift
//  ADA_MC1_UKINapp
//
//  Created by 정혜정 on 4/2/24.
//
import SwiftUI
import Foundation

class Talk: Identifiable, ObservableObject{
    let id: UUID
    
    //새로운 값을 저장할 때 바인딩 되어 있는 uI가 자동으로 업데이트
    @Published var talking: String
    
    init(talking: String) {
        id = UUID()
        self.talking = talking
    }
    
}

