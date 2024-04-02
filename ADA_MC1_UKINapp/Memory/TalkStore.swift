//
//  TalkStore.swift
//  ADA_MC1_UKINapp
//
//  Created by 정혜정 on 4/2/24.
//
import SwiftUI
import Foundation

class TalkStore: ObservableObject{
    //값이 추가되거나, 삭제되는 것을 view가 감지할 수 있게 함
    @Published var list: [Talk]
    
    init() {
        list = [
            Talk(talking: "안녕하세요 날씨가 너무 좋군요"),
            Talk(talking: "어디로 가세요?"),
            Talk(talking: "무엇을 타고 오셨나요?"),
            Talk(talking: "어떤 음식이 가장 맛있었나요?"),
            Talk(talking: "배고프네요,,")
        ]
        //        self.list = list
    }
    
    
}
