//
//  RoomSimpleInfo.swift
//  MyRoom
//
//  Created by 김우성 on 2021/11/04.
//

import SwiftUI

struct RoomSimpleInfo: View {
    var room: Room
    
    var body: some View {
        VStack {
            HStack {
                Text(room.roomType) // 집의 종류 : 빌라/투룸, 원룸, 오피스텔
                Spacer()
                Text("\(String(format: "%.2f", room.excluSpace))㎡") // 전용 면적 : m^2 -> 평수로도 계산해서 보여주기
                Spacer()
                Text("\(room.floorNum)층") // 집 층수/건물 층수 : 몇층, 옥탑, 반지하, 지하
                Spacer()
                Text("\(room.manageFee)만 원") // 관리비
            }
            .padding()
            
            Divider()
            HStack {
                Text("한달\n예상 주거비용")
                Spacer()
                Text("월세 + 관리비 + 주차비\n\(room.rentFee + room.manageFee + room.parkingFee)")
                    .multilineTextAlignment(.center)
            }
            .padding()
        }
    }
}

struct RoomSimpleInfo_Previews: PreviewProvider {
    static var previews: some View {
        RoomSimpleInfo(room: rooms[0])
    }
}
