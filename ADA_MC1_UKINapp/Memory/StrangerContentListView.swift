//
//  StrangerContentListView.swift
//  ADA_MC1_UKINapp
//
//  Created by 정혜정 on 4/2/24.
//
import SwiftUI

struct strangerContentListView: View {
    @State var contentList: [Contents] = [Content0,Content1,Content2,Content3,Content4,Content5,Content6]
    //    @State var contentnum: Int = 0
    
    
    var body: some View {
        
        Text("오늘의 \n\(contentList[0].content)")
        
        //        Button(action: {
        //            contentnum = .random(in: 0...6)
        //          },
        //          label: {
        //            Text("Change Number")
        //          }).padding()
        
    }
}

// Mark: content struct
struct Contents{
    var id: Int
    var content: String
}

// Todo: 다양한 contents문구 넣을 수 있는 방법 찾기
// Mark: contents 문구
var Content0 = Contents(id: 0, content: "빨간 옷을 입은 사람을 찾으시오.")
var Content1 = Contents(id: 1, content: "내 오른쪽에 있는 사람을 찾으시오.")
var Content2 = Contents(id: 2, content: "정혜정혜정혜정혜정혜정혜정헤정 사람을 찾으시오.")
var Content3 = Contents(id: 3, content: "춥고 배고프고 졸려 보이는 사람을 찾으시오.")
var Content4 = Contents(id: 4, content: "커피를 들고 있는 사람을 찾으시오.")
var Content5 = Contents(id: 5, content: "구두를 신은 사람을 찾으시오.")
var Content6 = Contents(id: 6, content: "머리가 나보다 긴 사람을 찾으시오.")
