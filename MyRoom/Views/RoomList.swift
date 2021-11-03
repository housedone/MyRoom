//
//  RoomList.swift
//  MyRoom
//
//  Created by 김우성 on 2021/11/04.
//

import SwiftUI

struct RoomList: View {
    var body: some View {
        NavigationView {
            List(rooms) { room in
                NavigationLink {
                    RoomDetail(room: room)
                } label: {
                    RoomRow(room: room)
                }
            }
            .navigationTitle("방문한 집")
        }
    }
}

struct RoomList_Previews: PreviewProvider {
    static var previews: some View {
        RoomList()
    }
}
