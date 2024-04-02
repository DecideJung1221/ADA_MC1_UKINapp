//
//  MemoStore.swift
//  ADA_MC1_UKINapp
//
//  Created by 정혜정 on 4/2/24.
//
import SwiftUI
import Foundation

class MemoStore: ObservableObject{
    //값이 추가되거나, 삭제되는 것을 view가 감지할 수 있게 함
    @Published var list: [Memo]
    
    init() {
        list = [
            Memo(content: "너무~~ 즐거워~~~ 행복해~~~", insertDate: Date.now),
            Memo(content: "새로운 사람을 만나 성장했다", insertDate: Date.now.addingTimeInterval(3600 * -24)),
            Memo(content: "wowwowowowowowow", insertDate: Date.now.addingTimeInterval(3600 * -48)),
            Memo(content: "대단한 사람을 만났다", insertDate: Date.now),
            Memo(content: "오늘은 좋은 사람을 만났다.", insertDate: Date.now),
            Memo(content: "포항은 좋은 사람이 많군요", insertDate: Date.now),
            Memo(content: "껄껄 즐겁다.", insertDate: Date.now)
        ]
//        self.list = list
    }
    
    func insert(memo: String){
        
        //새로운 메모는 0번 인덱스에 추가
        list.insert(Memo(content: memo), at: 0)
    }
    
    func update(memo: Memo?,content: String){
        guard let memo = memo else {
            return
        }
        memo.content = content
    }
    
    
    //2가지 방법의 delete
    func delete(memo: Memo){
        list.removeAll{$0.id == memo.id}
    }
    
    func delete(set: IndexSet){
        for index in set{
            list.remove(at: index)
        }
    }
    
    
}
