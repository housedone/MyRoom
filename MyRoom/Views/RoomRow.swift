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
            // 대표 사진 들어갈 곳
            if room.rentFee == 0 {
                Text(room.rentType + " \(room.deposit)")
            } else {
                Text(room.rentType + " \(room.deposit)" + "/\(room.rentFee)")
            }
            
            Spacer()
            Text(room.address)
                .foregroundColor(.secondary)
        }
        .padding()
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
