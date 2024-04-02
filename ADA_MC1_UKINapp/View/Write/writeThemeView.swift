//
//  writeThemeView.swift
//  ADA_MC1_UKINapp
//
//  Created by 정혜정 on 4/2/24.
//

import SwiftUI

struct writeThemeView: View {
    
    
    //앱 전역에서 공통으로 사용할 데이터를 주입 및 사용
    @EnvironmentObject var store: MemoStore
    @EnvironmentObject var talk: TalkStore
    
    //    @ObservedObject var store = MemoStore()
    
    //뷰에서 ObservableObject타입의 인스턴스 선언시 사용
    //    @ObservedObject var talk: Talk
    
    
    @Binding var showwriteThemeView: Bool
    @Binding var contentnum: Int
    
    //compose뷰를 사용할 때 이용
    @State private var showWriteDetail: Bool = false
    //compose뷰를 사용할 때 이용
    @State private var showComposer: Bool = false
    
    var memo: Memo? = nil
    
    
    //    var talkLists: [Talk] = [Talks0,Talks1,Talks2,Talks3,Talks4,Talks5,Talks6]
    var contentList: [Contents] = [Content0,Content1,Content2,Content3,Content4,Content5,Content6]
    
    //    var contentList: Contents
    
    
    //dismiss
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        //        NavigationStack{
        //
        //            VStack{
        //                Spacer()
        //                    .frame(height: 30)
        //                ZStack{
        //                    Button(action: {
        //                        self.showwriteThemeView = false
        //                    }) {
        //                        Text("back")
        //                            .frame(width: 300, alignment: .leading)
        //                    }
        //                    Text("오늘의 대화")
        //                        .font(.title2)
        //                        .foregroundStyle(Color(.black))
        //                        .bold()
        //                        .padding()
        //                }
        //                Text("test")
        //////////////////////////////////
        
        NavigationStack{
            VStack{
                Spacer()
                    .frame(height: 30)
                VStack{
                    ZStack{
                        Button(action: {
                            self.showwriteThemeView = false
                        }) {
                            Text("back")
                                .frame(width: 300, alignment: .leading)
                        }
                        Text("오늘의 대화")
                            .font(.title2)
                            .foregroundStyle(Color(.black))
                            .bold()
                            .padding()
                    }
                    
                    Text("사람 선택?  \(contentList[contentnum].content)")
                        .foregroundStyle(.secondary)
                        .font(.caption)
                        .frame(width: 250,alignment: .center)
                    
                }
                
                ZStack{
//                    RoundedRectangle(cornerRadius: 20)
//                        .fill(Color.customBackgroundsky)
//                        .frame(width: 350,height: 300,alignment: .bottom)
//
//
//                    environmentObject
                    
                    List{
                        ForEach(talk.list){
                            talk in
                            NavigationLink{
                                ComposeView(talk: talk)
        
                            }label: {
                                TalkCell(talk: talk)
                            }
                        }
                        .listRowBackground(Color.customBackgroundsky)
                        .foregroundColor(.black)
                    }
                    
                    
                    //
                    //                    List{
                    //                        ForEach(talk[0...4], id: \.id) {
                    //                            talklist in
                    //                            NavigationLink(@Environment.talking,
                    //                                           destination:
                    //                                            writeDetailView(talk: talklist)
                    //                                .environmentObject(store))
                    //                            .listRowBackground(Color.customBackgroundsky)
                    //                            .foregroundColor(.black)
                    //
                    //
                    //                        }
                    //                    }
                        .frame(width: 350,height: 300)
                        .font(.system(size: 18))
                }
                .frame(width: 350,height: 300)
                
                
                
                NavigationLink {
                    ComposeView()
                } label: {
                    Image(systemName: "eye.slash.circle")
                        .imageScale(.medium)
                        .font(.largeTitle)
                        .foregroundColor(.black)
                }
                
                //                Button{showComposer = true
                //                }label: {
                //                    Image(systemName: "eye.slash.circle")
                //                        .imageScale(.medium)
                //                        .font(.largeTitle)
                //                        .foregroundColor(.black)
                //                }.sheet(isPresented: $showComposer, content: {
                //                    ComposeView()
                //                })
                
                
                
                
                
                
                
                
                //
                //
                //                //                모아 캐릭터
                        
                
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
