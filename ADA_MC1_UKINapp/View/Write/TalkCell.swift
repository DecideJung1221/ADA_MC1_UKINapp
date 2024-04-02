//
//  TalkCell.swift
//  ADA_MC1_UKINapp
//
//  Created by 정혜정 on 4/2/24.
//

import SwiftUI

struct TalkCell: View{
    
    //뷰에서 ObservableObject타입의 인스턴스 선언시 사용
    @ObservedObject var talk: Talk
    
    var body: some View{
        VStack(alignment: .leading, content: {
            
            Text(talk.talking)
                .font(.body)
            

        }
        )
        
    }
}



//
//struct MemoCell: View{
//
//    //뷰에서 ObservableObject타입의 인스턴스 선언시 사용
//    @ObservedObject var memo: Memo
//
//    var body: some View{
//        VStack(alignment: .leading, content: {
//
//            Text(memo.content)
//                .font(.body)
//                .lineLimit(1)
//
//            Text(memo.insertDate, style: .date)
//                .font(.caption)
//                .foregroundStyle(.secondary)
//        }
//        )
//
//    }
//}
