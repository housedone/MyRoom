//
//  AddRoom.swift
//  MyRoom
//
//  Created by 김우성 on 2021/11/04.
//

import SwiftUI

struct AddRoom: View {
    
    @Binding var showComposer: Bool
    
    var room: Room? = nil
    
    @State private var roomType: RoomType = .원룸
    enum RoomType: String, CaseIterable { case 원룸, 투룸, 오피스텔 }
    
    @State private var rentType: RentType = .월세
    enum RentType: String, CaseIterable { case 월세, 전세, 매매 }
    
    var body: some View {
        NavigationView {
            Form {
                Text("사진 추가하는 부분")
                
                Text("집의 종류")
                Picker("집의 종류", selection: $roomType) {
                    ForEach(RoomType.allCases, id: \.self) {
                        Text($0.rawValue).tag($0)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .onAppear {
                    UISegmentedControl.appearance().selectedSegmentTintColor = .systemCyan
                }
                
                Text("거래 유형")
                Picker("거래 유형", selection: $rentType) {
                    ForEach(RentType.allCases, id: \.self) {
                        Text($0.rawValue).tag($0)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .onAppear {
                    UISegmentedControl.appearance().selectedSegmentTintColor = .systemCyan
                }
                
//                HStack {
//                    Text("월세")
//                    TextField("금액 입력", text: $rentFee)
//                }
                
                
                
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
