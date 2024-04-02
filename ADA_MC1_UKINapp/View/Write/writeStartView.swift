//
//  writeStartView.swift
//  ADA_MC1_UKINapp
//
//  Created by 정혜정 on 4/2/24.
//
import SwiftUI

struct writeStartView: View {
    
    var contentList: [Contents] = [Content0,Content1,Content2,Content3,Content4,Content5,Content6]
    @State var contentnum: Int = .random(in: 0...6)
    @State var showwriteThemeView = false
    
//    @StateObject var store = MemoStore()
//    @ObservedObject var store = MemoStore()
//    @EnvironmentObject var store: MemoStore
//    @StateObject var store = MemoStore()
    
    //앱 전역에서 공통으로 사용할 데이터를 주입 및 사용
    @EnvironmentObject var store: MemoStore
    
    //앱 전역에서 공통으로 사용할 데이터를 주입 및 사용
    @EnvironmentObject var talkstore: TalkStore
//    @EnvironmentObject var
    
    
    
    var body: some View {
        
        if showwriteThemeView {
//            Text("showTheme")
            writeThemeView(showwriteThemeView: self.$showwriteThemeView, contentnum: self.$contentnum)
                .environmentObject(store)
                .environmentObject(talkstore)
        }else{
            VStack{
                Spacer()
                    .frame(height: 30)
                Text("오늘의 낯선사람")
                    .font(.title2)
                    .foregroundStyle(Color(.black))
                    .bold()
                    .padding()
                ZStack{
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.customBackgroundsky)
                        .frame(width: 350,height: 300)
                    Text("\(contentList[contentnum].content)")
                        .font(.system(size: 28))
                        .foregroundStyle(.black)
                        .monospaced()
                        .frame(width: 300,height: 300)
                        .multilineTextAlignment(.center)
                    
                }
                HStack{
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image(systemName: "eye.slash.circle")
                            .imageScale(.medium)
                            .font(.largeTitle)
                            .foregroundColor(.black)
                    }).padding()
                    Button(action: {self.showwriteThemeView = true}, label: {
                        Image(systemName: "checkmark.circle")
                            .imageScale(.medium)
                            .font(.largeTitle)
                            .foregroundColor(.black)
                    }).padding()
                    Button(action: {
                        contentnum = .random(in: 0...6)
                    },
                           label: {
                        Image(systemName: "arrow.clockwise.circle")
                            .imageScale(.medium)
                            .font(.largeTitle)
                            .foregroundColor(.black)
                    }).padding()
                }
                //                모아 캐릭터
                VStack{
                    Image("newView_human")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 180,height: 150)
                    Image("MOA_mini")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50)
                }
                .padding()
            }
        }
    }
}
