//
//  AddRoom.swift
//  MyRoom
//
//  Created by 김우성 on 2021/11/04.
//

import SwiftUI

struct AddRoom: View {
    
    @Binding var showComposer: Bool
    @State private var choose = 0
    
    var room: Room? = nil
    
    var body: some View {
        NavigationView {
            VStack {
                Text("사진 추가하는 부분")
                Text("집의 종류")
                Picker(selection: $choose, label: Text("집의 종류")) {
                    ForEach(["월세","전세","매매"], id: \.self) {
                        Text("\($0)")
                    }
                    .pickerStyle(WheelPickerStyle())
                }
                
                
                Text("거래 유형")
            }
            //            .navigationBarItems(leading: DismissButton(show: $showComposer), trailing: SaveButton(show: $showComposer, content: $content, room: room))
        }
        
        
        
    }
}

fileprivate struct DismissButton: View { // 취소버튼
    @Binding var show: Bool
    
    var body: some View {
        Button(action: {
            self.show = false
        }, label: {
            Text("취소")
        })
    }
}

fileprivate struct SaveButton: View { // 저장버튼
    @Binding var show: Bool
    
    //    @EnvironmentObject var store: MemoStore
    @Binding var content: String
    
    //    var memo: Memo? = nil
    
    var body: some View {
        Button(action: {
            //            if let memo = self.memo {
            //                self.store.update(memo: memo, content: self.content)
            //            } else {
            //                self.store.insert(memo: self.content)
            //            }
            //            self.show = false
        }, label: {
            Text("저장")
        })
    }
}


struct AddRoom_Previews: PreviewProvider {
    static var previews: some View {
        AddRoom(showComposer: .constant(false))
    }
}
