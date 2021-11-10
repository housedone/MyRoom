//
//  RoomDetailInfoView.swift
//  MyRoom
//
//  Created by 김우성 on 2021/11/03.
//

import SwiftUI

struct RoomDetailInfo: View {
    var room: Room
    
    var body: some View {
        VStack {
            Text("상세정보")
                .font(.title3)
            
            // 집의 구조 : 원룸 : 오픈형(방1), 분리형(방1, 거실1), 복층형
            // 집의 구조 : 빌라/투룸, 오피스텔 : 오픈형, 분리형, 복층형, 투룸, 쓰리룸+
            
            VStack {
                HStack {
                    Text("방종류")
                    Spacer()
                    Text(room.roomType)
                }
                HStack {
                    Text("해당층/건물층")
                    Spacer()
                    Text("\(room.floorNum)층 / \(room.buildNum)층")
                }
                HStack {
                    Text("전용/공급면적")
                    Spacer()
                    Text("\(String(format: "%.2f", room.excluSpace)) / \(String(format: "%.2f", room.supplySpace))")
                }
                HStack {
                    Text("방 수/욕실 수")
                    Spacer()
                    Text("1개 / 1개")
                }
                HStack {
                    Text("방향")
                    Spacer()
                    Text(room.windowDir)
                }
                HStack {
                    Text("난방종류")
                    Spacer()
                    Text(room.isHeatingIndiv ? "개별난방" : "중앙난방")
                }
                HStack {
                    Text("옵션")
                    Spacer()
                    Text("없음")
                }
                HStack {
                    Text("주차 가능")
                    Spacer()
                    Text("\(room.isParking)대")
                }
            }
            .padding()
            
        }
    }
}

struct RoomDetailInfo_Previews: PreviewProvider {
    static var previews: some View {
        RoomDetailInfo(room: rooms[0])
    }
}
