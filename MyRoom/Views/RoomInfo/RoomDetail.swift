//
//  RoomDetail.swift
//  MyRoom
//
//  Created by 김우성 on 2021/11/04.
//

import SwiftUI

struct RoomDetail: View {
    var room: Room
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                room.image
                    .resizable()
                    .frame(height: 300)
                
                if room.rentFee == 0 { // 전세인 경우 월세 미출력
                    Text(room.rentType + " \(room.deposit)")
                        .font(.title)
                        .fontWeight(.bold)
                } else { // 월세인 경우
                    Text(room.rentType + " \(room.deposit)" + "/\(room.rentFee)")
                        .font(.title)
                        .fontWeight(.bold)
                }
                
                HStack {
                    Text(room.memo) // 메모
                        .font(.subheadline)
                        .lineLimit(2) // 최대 2줄
                    Spacer()
                    VStack {
                        Spacer()
                        Text("단기임대") // 단기임대 가능여부
                            .font(.subheadline)
                        Spacer()
                        Image(systemName: room.isShortTerm ? "checkmark" : "xmark")
                            .foregroundColor(room.isShortTerm ? Color.blue : Color.gray)
                        Spacer()
                    }
                }
                
                Divider()
                
                RoomSimpleInfo(room: self.room)
                
                Divider()
                
                MapView(coordinate: room.locationCoordinate)
                    .frame(height: 250)
                
                Divider()
                
                
                RoomDetailInfo(room: self.room)
                
                
                
                // 관리비 포함 항목 : 전기, 가스, 수도, 인터넷, TV, 주차료 중 복수선택 가능
                
                
                // 주차 가능여부 : 1대, 2대, 불가능
                // 엘리베이터 여부
                // 창문 방향 : 8개 방향, 창문X
                // 준공 년도
                // 빌트인 : 에어컨, 냉장고, 세탁기, 인덕션/가스레인지, 책상, 침대, 옷장, 신발장, 싱크대, 전자레인지, 욕조
                // 집 주변 정보 : 코인세탁소, 편의점, 대형마트, 백화점, PC방, 카페, 패스트푸드, 쏘카존/그린카존
                // 입주가능일
                // 주소
                // 부동산 번호
                // 어플에서 찾은 매물정보 URL
                // AR 촬영 평면도
                
            }
            .padding()
        }
        .navigationBarTitle("집 정보")
    }
}

struct RoomDetail_Previews: PreviewProvider {
    static var previews: some View {
        RoomDetail(room: rooms[0])
    }
}
