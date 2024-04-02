//
//  memoryStartView.swift
//  ADA_MC1_UKINapp
//
//  Created by 정혜정 on 4/2/24.
//
import SwiftUI

struct memoryStartView: View{
    //메모 저장소를 속성으로 먼저 저장
    @StateObject var store = MemoStore()
    
    @State private var openMainList: Bool = false
    
//Todo: playground에서 저장 기능?
//    let persistenceController =
    
    var body: some View{
//        MainListView(openMainList: self.$openMainList)
//            .environmentObject(store)
        Text("test")
    }
    
}

