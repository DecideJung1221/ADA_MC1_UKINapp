//
//  MainListView.swift
//  ADA_MC1_UKINapp
//
//  Created by 정혜정 on 4/2/24.
//

import SwiftUI

struct MainListView: View{
    // obserbanleObject를 통해 구현된 타입의 인스턴스를 전역적으로 공유
    //공유데이터를 여러부에서 사용
    //앱 전역에서 공통으로 사용할 데이터를 주입 및 사용
    @EnvironmentObject var store: MemoStore
//    @ObservedObject var store = MemoStore()
    
    //뷰에서 ObservableObject타입의 인스턴스 선언시 사용
//    @ObservedObject var memo: Memo
//    @EnvironmentObject var memo: Memo
//    @StateObject var memo: Memo
    
    
//    @State var progress : Double = 0.3
    
    @State var progress : Double = 0.1
     
    //compose뷰를 사용할 때 이용
    @State private var showComposer: Bool = false
    @State private var showMission: Bool = false
    
//    @Binding var openMainList: Bool
//    @Binding var showHomeView: Bool
    
    
    
    var body: some View{
        NavigationView{
            VStack{
//                Text(memo.content.count)
//                print(memo.content ?? "")
//                Button{
//                    print(store.list.count)
//                }label: {
//                    Text("확인")
//                }
                
                Spacer()
                    .frame(height: 20)
                ZStack{
                    
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.customBackgroundsky)
                        .frame(width: 400,height: 50)
                    
                    VStack{
                        if (progress * Double(self.$store.list.count)) < 1 {
                            Text("지금까지 만난 사람")
                                .foregroundStyle(.black)
                                .font(.caption)
                                .frame(alignment: .leading)
                            
                            ProgressView(value: (progress * Double(self.$store.list.count) ))
                                .progressViewStyle(LinearProgressViewStyle(tint: .blue))
                            //                            .padding()
                        }else{
                            
                            Button{
                                showMission = true
                            }label: {
                                Text("오늘의 미션을 확인하세요.")
                            }
                            
                            .sheet(isPresented: $showMission, content: {
                                MissionView()
                            })
                            
                            
                        }
                        
                        
                    }
                    .frame(width: 400,height: 50)
  
                }
                
                VStack{
                    
                    Text("나의 기록")
                        .font(.title2)
                        .foregroundStyle(Color(.black))
                        .bold()
                        .padding()
                    
                    NavigationLink {
                        ComposeView()
                    } label: {
                        Text("추가하기")
                            .foregroundStyle(.secondary)
                    }
                    
                }
                List{
                    ForEach(store.list){
                        memo in
                        NavigationLink{
                            DetailView(memo: memo)
                        }label: {
                            MemoCell(memo: memo)
                        }
                    }
                    .listRowBackground(Color.customBackgroundsky)
                    .foregroundColor(.black)
                }
                }
                
                
            
            }
            
        
    }
    
    
}
