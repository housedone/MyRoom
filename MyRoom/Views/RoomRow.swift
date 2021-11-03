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
            room.
            Text(room.id)
        }
    }
}

struct RoomRow_Previews: PreviewProvider {
    static var previews: some View {
        RoomRow(room: rooms[0])
    }
}
