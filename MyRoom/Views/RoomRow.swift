//
//  RoomRow.swift
//  MyRoom
//
//  Created by 김우성 on 2021/11/03.
//

import SwiftUI

struct RoomRow: View {
    var room: Room
    
    var body: some View {
        HStack {
            room.image
                .resizable()
                .frame(width: 100, height: 100)
            Spacer()
            if room.rentFee == 0 { // 전세인 경우 월세 미출력
                Text(room.rentType + " \(room.deposit)")
            } else { // 월세인 경우
                Text(room.rentType + " \(room.deposit)" + "/\(room.rentFee)")
            }
            
            Spacer()
            Text(room.address)
                .foregroundColor(.secondary)
        }
    }
}

struct RoomRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RoomRow(room: rooms[0])
            RoomRow(room: rooms[1])
        }
        .previewLayout(.fixed(width: 400, height: 100))
    }
}
