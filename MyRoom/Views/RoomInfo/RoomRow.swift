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
                .frame(width: 50)
            
            VStack(alignment: .leading, spacing: 10) {
                // 월세인 경우에만 월세 출력
                room.rentFee == 0 ?
                Text(room.rentType + " \(room.deposit)")
                    .font(.headline).fontWeight(.medium)
                :
                Text(room.rentType + " \(room.deposit)" + "/\(room.rentFee)")
                    .font(.headline).fontWeight(.medium)
                
                Text(room.address)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
        }
        .frame(height: 100)
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
