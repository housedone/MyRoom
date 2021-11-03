//
//  ContentView.swift
//  MyRoom
//
//  Created by 김우성 on 2021/10/29.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                // 사진 슬라이드 들어갈 곳
                
                Text("월세 200/27") // 거래 유형 : 전세, 월세, 매매 / 월세금, 전세금 / 보증금
                    .font(.title)
                HStack {
                    Text("메모 들어갈 부분") // 메모
                        .font(.subheadline)
                    Spacer()
                    Text("단기임대가능여부") // 단기임대 가능여부
                        .font(.subheadline)
                }
                Divider()
                HStack {
                    Text("집의 종류") // 집의 종류 : 빌라/투룸, 원룸, 오피스텔
                    Spacer()
                    Text("전용 면적") // 전용 면적 : m^2 -> 평수로도 계산해서 보여주기
                    Spacer()
                    Text("집 층수") // 집 층수/건물 층수 : 몇층, 옥탑, 반지하, 지하
                    Spacer()
                    Text("관리비") // 관리비
                }
                Divider()
                HStack {
                    Text("한달\n예상 주거비용")
                    Text("월세 + 관리비 + 주차비\n33만원")
                }
                Divider()
                MapView()
                    .frame(height: 250)
                Divider()
                DetailView()
                
                
                
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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
