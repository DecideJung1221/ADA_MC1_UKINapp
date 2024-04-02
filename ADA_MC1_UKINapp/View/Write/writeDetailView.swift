//
//  writeDetailView.swift
//  ADA_MC1_UKINapp
//
//  Created by 정혜정 on 4/2/24.
//

import SwiftUI


struct writeDetailView: View {
    @EnvironmentObject var store: MemoStore
    
    //    @ObservedObject var store = MemoStore()
    
    @State private var openPhoto = false
    @State private var image = UIImage()
    @State private var content: String = ""
    
    var talk: Talk
    var memo: Memo? = nil
    
//    @State var content: String = ""
    
    //dismiss는 environment에 있음
        @Environment(\.dismiss) var dismiss
        
        
    
//
    var body: some View {
        Text("writeDetailView")
        ScrollView{
            VStack(alignment: .leading,
                   spacing: 20
            ) {
            
                
                
                
                VStack{
                    
                    /////////////////////////
                    
                    NavigationStack{
                        VStack{
                            //                Text("ComposeView")
                            //                Spacer()
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
                            
                            Text(talk.talking)
                            
                            //Mark: image 자리
                            Image(uiImage: self.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 200)
                            
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
                        .toolbar{
                            ToolbarItemGroup(placement: .navigationBarLeading) {
                                Button{
                                    dismiss()
                                }label: {
                                    Text("취소")
                                }
                            }
                        }
                        
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
            }
        }
        
//
//
    }
}

//import SwiftUI
//
//struct ComposeView: View{
//    @EnvironmentObject var store: MemoStore
//
//    //    @ObservedObject var store = MemoStore()
//
//    @State private var openPhoto = false
//    @State private var image = UIImage()
//
//
//    @State private var openMainList = false
//    //    @State var openMainList: Bool = true
//
//    var memo: Memo? = nil
//
//    //기록 창은 모달로 띄움 -> 창 닫기 방법은 dismiss로 이용
//    //dismiss는 environment에 있음
//    @Environment(\.dismiss) var dismiss
//
//    @State private var content: String = ""
//
//    var body: some View{
//
//        //        if openMainList {
//        ////            Text("mainlist")
//        //            MainListView(openMainList: self.$openMainList)
//        //        } else {
//        VStack{
//
//            /////////////////////////
//
//            NavigationStack{
//                VStack{
//                    //                Text("ComposeView")
//                    //                Spacer()
//                    NavigationStack{
//                        Button(action: {
//                            self.openPhoto = true
//                        }, label: {
//                            Text("사진추가")
//                        })
//                    }
//                    .sheet(isPresented: $openPhoto, content: {
//                        ImagePicker(sourceType: .photoLibrary, selectedImage: self.$image)
//                    })
//
//                    //Mark: image 자리
//                    Image(uiImage: self.image)
//                        .resizable()
//                        .scaledToFit()
//                        .frame(height: 200)
//
//                    TextEditor(text: $content)
//                        .padding()
//                        .onAppear{
//                            if let memo = memo{
//                                content = memo.content
//                            }else{
//                            }
//                        }
//                }
//                .navigationTitle(memo != nil ? "편집" : "새기록")
//                .navigationBarTitleDisplayMode(.inline)
//
//
//                // 취소 dismiss 이용
//                .toolbar{
//                    ToolbarItemGroup(placement: .navigationBarLeading) {
//                        Button{
//                            dismiss()
//                        }label: {
//                            Text("취소")
//                        }
//                    }
//                }
//
//                // Memostore의 insert를 사용하여 저장
//                .toolbar{
//                    ToolbarItemGroup(placement: .navigationBarTrailing) {
//
//
//                        Button{
//                            if let memo = memo{
//                                store.update(memo: memo, content: content)
//                            }else{
//
//                                //위의 texteditor의 text를 content로 받음
//                                store.insert(memo: content)
//                            }
//
//                            dismiss()
//                            print(store.list.count)
//                            //                                            self.openMainList = true
//
//                            //                                            MainListView(openMainList: self.$openMainList)
//
//                            //                        self.showHomeView = true
//                        }label: {
//                            Text("저장")
//                        }
//                        //                                    }
//                    }
//
//
//                }
//
//
//
//
//
//
//
//
//                ///////////////////////////////////
//                //                Button(action: {
//                //                    self.openMainList = true
//                //                }) {
//                //                    Text("저장")
//                //                        .font(.title)
//                //                        .foregroundStyle(Color(.black))
//                //                }
//                //                .offset(y:80)
//            }
//
//        }
//        //
//
//    }
//}
//
