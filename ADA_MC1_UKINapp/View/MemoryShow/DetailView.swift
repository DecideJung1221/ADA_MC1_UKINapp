//
//  DetailView.swift
//  ADA_MC1_UKINapp
//
//  Created by 정혜정 on 4/2/24.
//
import SwiftUI

struct DetailView: View{
    @ObservedObject var memo: Memo
//    @ObservedObject var store = MemoStore()
    
    @EnvironmentObject var store: MemoStore
    
    @State private var showCompose = false
    @State private var showDeleteAlert = false
    
    //dismissㅋ
    @Environment(\.dismiss) var dismiss
    
    var body: some View{
        VStack{
            ScrollView{
                VStack{
                    HStack{
                        Text(memo.content)
                            .padding()
                        
                        Spacer(minLength: 0)
                    }
                    Text(memo.insertDate,style: .date)
                        .padding()
                        .font(.footnote)
                        .foregroundColor(.secondary)
                    
                }
            }
        }
        .navigationTitle("기록보기")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar{
            ToolbarItemGroup(placement: .topBarTrailing) {
                
                Button{
                    showCompose = true
                }label: {
                    Image(systemName: "square.and.pencil")
                }
            }
        }
        .sheet(isPresented: $showCompose, content: {
            ComposeView(memo: memo)
        })
        
        
        
        Button{
            showDeleteAlert = true
        }label: {
            Image(systemName: "trash")
        }
        .foregroundColor(.red)
        .alert("삭제확인", isPresented: $showDeleteAlert)
        {
            Button(role: .destructive){
                store.delete(memo: memo)
                dismiss()
            }label: {
                Text("삭제")
            }
        }message: {
            Text("삭제할까요?")
        }
        
        
        
//        Text("this is detail")
    }
}
