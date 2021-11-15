//
//  AddRoom.swift
//  MyRoom
//
//  Created by 김우성 on 2021/11/04.
//

import SwiftUI
import PhotosUI

struct AddRoom: View {
    
    @Binding var showComposer: Bool
    
    @State private var showImagePicker = false
    @State var image: Image? = nil
    
    @State var room: Room? = nil
    
    /* 입력내용 */
    @State private var roomType: RoomType = .원룸
    enum RoomType: String, CaseIterable { case 원룸, 투룸, 오피스텔 }
    @State private var rentType: RentType = .월세
    enum RentType: String, CaseIterable { case 월세, 전세, 매매 }
    @State private var rentFee = ""
    @State private var deposit = ""
    @State private var manageFee = ""
    @State private var parkingFee = ""
    @State private var isShortTerm: Bool = false
    
    
    var body: some View {
        NavigationView {
            Form {
                HStack {
                    Text("사진 추가")
                    Spacer()
                    Button(action: {
                        self.showImagePicker.toggle()
                    }, label: {
                        Image(systemName: "camera.fill")
                    })
                        .sheet(isPresented: $showImagePicker) {
                            let configuration = PHPickerConfiguration(photoLibrary: PHPhotoLibrary.shared())
                            PhotoPicker(configuration: configuration, isPresented: $showImagePicker)
                        }
                }
                
                Group {
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
                }
                
                Group {
                    HStack {
                        Text("월세")
                        TextField("금액 입력", value: $rentFee, formatter: NumberFormatter())
                            .keyboardType(.phonePad)
                            .multilineTextAlignment(.trailing)
                    }
                    
                    HStack {
                        Text("보증금 또는 전세금")
                        TextField("금액 입력", text: $deposit)
                            .keyboardType(.phonePad)
                            .multilineTextAlignment(.trailing)
                    }
                    
                    HStack {
                        Text("관리비")
                        TextField("금액 입력", text: $manageFee)
                            .keyboardType(.phonePad)
                            .multilineTextAlignment(.trailing)
                    }
                    
                    HStack {
                        Text("주차비")
                        TextField("금액 입력", text: $parkingFee)
                            .keyboardType(.phonePad)
                            .multilineTextAlignment(.trailing)
                    }
                    
                    Toggle(isOn: $isShortTerm) {
                        Text("단기임대 가능여부")
                    }
                }
                //Text("AR 촬영 넣을 부분")
            }
            .navigationBarTitle( room != nil ? "집 편집" : "집 추가", displayMode: .inline)
            .navigationBarItems(
                leading: DismissButton(show: $showComposer),
                trailing: SaveButton(show: $showComposer, room: room)
            )
        }
    }
}

// 취소 버튼 뷰
fileprivate struct DismissButton: View {
    @Binding var show: Bool
    
    var body: some View {
        Button(action: {
            self.show = false
        }, label: {
            Text("취소")
        })
    }
}

// 저장 버튼 뷰
fileprivate struct SaveButton: View {
    @Binding var show: Bool
    
    //    @EnvironmentObject var store: MemoStore
    
    
    var room: Room? = nil
    
    var body: some View {
        Button(action: { // 저장 버튼을 누르면 현재 항목이 json에 추가되도록
            
            
            //            if let memo = self.memo {
            //                self.store.update(memo: memo, content: self.content)
            //            } else {
            //                self.store.insert(memo: self.content)
            //            }
            self.show = false
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
