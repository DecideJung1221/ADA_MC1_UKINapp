//
//  Memo.swift
//  ADA_MC1_UKINapp
//
//  Created by 정혜정 on 4/2/24.
//
import SwiftUI
import Foundation

class Memo: Identifiable, ObservableObject{
    let id: UUID
    
    //새로운 값을 저장할 때 바인딩 되어 있는 uI가 자동으로 업데이트
    @Published var content: String
    let insertDate: Date
    
    init(content: String, insertDate: Date = Date.now) {
        id = UUID()
        self.content = content
        self.insertDate = insertDate
    }
    
}
