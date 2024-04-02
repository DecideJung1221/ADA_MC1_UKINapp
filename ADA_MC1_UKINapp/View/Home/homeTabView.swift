//
//  homeTabView.swift
//  ADA_MC1_UKINapp
//
//  Created by 정혜정 on 4/2/24.
//

import SwiftUI

struct homeTabView: View{
    @Binding var showHomeView: Bool
    //메모 저장소를 속성으로 먼저 저장
    @StateObject var store = MemoStore()
    @StateObject var talkstore = TalkStore()
    
    //tabview
    @State private var selection = 0
    
    
    var body: some View{
        TabView(selection: $selection){
            writeStartView()
                .environmentObject(store)
                .environmentObject(talkstore)
                .tabItem {
                    Label("기록하기", systemImage: "tray.and.arrow.down.fill")
                }
                .tag(0)
            
            
//            memoryStartView()
             MainListView()
                .environmentObject(store)
                .tabItem {
                    Label("추억하기", systemImage: "clock.arrow.2.circlepath")
                        .foregroundColor(.black)
                }
                .tag(1)
        }
    }
    
}


