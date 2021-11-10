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
        ZStack {
            roomList
        }
    }
    
    var emptyList: some View {
        VStack(spacing: 25) {
            Image(systemName: "archivebox")
                .renderingMode(.template)
                //.foregroundColor(.gray.opacity(0.4))
            Text("기록한 집이 없습니다.")
                .font(.headline).fontWeight(.medium)
        }
        //.frame(maxWidth: .infinity, maxHeight: .infinity)
        //.background(Color.background)
    }
    
    var roomList: some View {
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
