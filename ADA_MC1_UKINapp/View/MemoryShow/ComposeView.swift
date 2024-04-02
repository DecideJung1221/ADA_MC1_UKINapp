//
//  ComposeView.swift
//  ADA_MC1_UKINapp
//
//  Created by 정혜정 on 4/2/24.
//
import SwiftUI

struct ComposeView: View{
    //showAlert의 bool 타입을 false로 설정
    @State private var showingAlert = false
    
    @EnvironmentObject var store: MemoStore
    @EnvironmentObject var talkStore: TalkStore
    
//    @ObservedObject var store = MemoStore()
    
    @State private var openPhoto = false
    @State private var transView = false
    @State private var image = UIImage()
    
    
    @State private var openMainList = false
//    @State var openMainList: Bool = true
    
    var memo: Memo? = nil
    var talk: Talk? = nil
    
    //기록 창은 모달로 띄움 -> 창 닫기 방법은 dismiss로 이용
    //dismiss는 environment에 있음
    @Environment(\.dismiss) var dismiss
    
    @State private var content: String = ""
    
    var body: some View{
        
//        if openMainList {
////            Text("mainlist")
//            MainListView(openMainList: self.$openMainList)
//        } else {
            VStack{
                
                /////////////////////////
                
                NavigationStack{
                                VStack{
                    //                Text("ComposeView")
                    //                Spacer()
                                    
                                    //Todo: 연결 하기.
//                                    Text(talk != nil ? "있다" : "\(talk)")
                                    if talk != nil {
                                        Text("오늘의 대화는")
                                            .font(.title2)
                                            .multilineTextAlignment(.center)
                                        
                                        Button(action: {
                                            self.transView = true
                                        }){
                                            Text(" \" \(talk?.talking ?? "") \" ")
                                                .font(.title3)
                                                .foregroundStyle(.secondary)
                                                .multilineTextAlignment(.center)
                                        }
                                        .sheet(isPresented: self.$transView) {
                                            transtalkView()
                                        } //Button 끝
                                        
                                        
                                        Text("입니다")
                                            .font(.title2)
                                            .multilineTextAlignment(.center)
                                    } else {
                                        Text("")
                                    }
                                    
                                    NavigationStack{
                                        Button(action: {
                                            self.openPhoto = true
                                        }, label: {
                                            Text("사진추가")
                                        })
                                    }
                                    .sheet(isPresented: $openPhoto, content: {
                                        ImagePicker(sourceType: .photoLibrary, selectedImage: self.$image)
                                    })
                                    
                                   
                                    
                                    
                                    //Mark: image 자리
                                    Image(uiImage: self.image)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 200)
                                    
                                    Button("어떻게 작성할까요?") {
                                        self.showingAlert.toggle()
                                    }
                                    
                                    .alert(isPresented: $showingAlert) {
                                        Alert(title: Text("4L로 작성해 보세요. "), message: Text("4L?(Liked, Learned, Lacked, Longed for) \n 좋았던 것, 배웠던 것, 부족했던 것, 바라는 것")
                                              
                                              ,
                                              dismissButton: .default(Text("취소")))
                                    }
                                    TextEditor(text: $content)
                                        .padding()
                                        .onAppear{
                                            if let memo = memo{
                                                content = memo.content
                                            }else{
                                            }
                                        }
                                    
                                    
                                }
                                .navigationTitle(memo != nil ? "편집" : "새기록")
                                .navigationBarTitleDisplayMode(.inline)
                                
                                
                                // 취소 dismiss 이용
//                                .toolbar{
//                                    ToolbarItemGroup(placement: .navigationBarLeading) {
//                                        Button{
//                                            dismiss()
//                                        }label: {
//                                            Text("취소")
//                                        }
//                                    }
//                                }
                                
                                // Memostore의 insert를 사용하여 저장
                                .toolbar{
                                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                                        
                                        
                                        Button{
                                            if let memo = memo{
                                                store.update(memo: memo, content: content)
                                            }else{
                    
                                                //위의 texteditor의 text를 content로 받음
                                                store.insert(memo: content)
                                            }
                                            
                                            dismiss()
                                            print(store.list.count)
//                                            self.openMainList = true
                                            
//                                            MainListView(openMainList: self.$openMainList)
                                            
                    //                        self.showHomeView = true
                                        }label: {
                                            Text("저장")
                                        }
//                                    }
                                }
                                
                                
                            }
                
                
                
                
                
                
                
                
                ///////////////////////////////////
//                Button(action: {
//                    self.openMainList = true
//                }) {
//                    Text("저장")
//                        .font(.title)
//                        .foregroundStyle(Color(.black))
//                }
//                .offset(y:80)
            }
            
        }
//
        
    }
}
