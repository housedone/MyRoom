//
//  RoomList.swift
//  MyRoom
//
//  Created by 김우성 on 2021/11/04.
//

import SwiftUI

struct RoomList: View {
    @State var showComposer: Bool = false
    
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
            .navigationBarItems(trailing: ModalButton(show: $showComposer))
            .sheet(isPresented: $showComposer, content: {
                AddRoom(showComposer: self.$showComposer)
            })
        }
    }
}


fileprivate struct ModalButton: View {
    @Binding var show: Bool
    
    var body: some View {
        Button(action: {
            self.show = true
        }, label: {
            Image(systemName: "plus")
        })
    }
}

struct RoomList_Previews: PreviewProvider {
    static var previews: some View {
        RoomList()
    }
}
