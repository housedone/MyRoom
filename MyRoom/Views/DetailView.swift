//
//  DetailView.swift
//  MyRoom
//
//  Created by 김우성 on 2021/11/03.
//

import SwiftUI

struct DetailView: View {
    var body: some View {
        VStack {
            Text("상세정보")
                .font(.title3)
                
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text("방종류")// 집의 구조 : 원룸 : 오픈형(방1), 분리형(방1, 거실1), 복층형
                    // 집의 구조 : 빌라/투룸, 오피스텔 : 오픈형, 분리형, 복층형, 투룸, 쓰리룸+
                    Text("해당층/건물층")
                    Text("전용/공급면적")
                    Text("방 수/욕실 수")
                    Text("방향")
                    Text("난방종류")
                    Text("빌트인")
                    Text("건물 주차수")
                    Text("세대당 주차수")
                }
                .foregroundColor(.secondary)
                VStack(alignment: .leading, spacing: 5) {
                    Text("원룸")
                    Text("5층 / 8층")
                    Text("19.82 / 19.82")
                    Text("1개 / 1개")
                    Text("서")
                    Text("개별난방")
                    Text("아님")
                    Text("총 4대")
                    Text("0.2대")
                }
                .padding()
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
