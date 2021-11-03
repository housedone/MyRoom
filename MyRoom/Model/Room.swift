//
//  Room.swift
//  MyRoom
//
//  Created by 김우성 on 2021/11/03.
//

import Foundation
import SwiftUI
import CoreLocation

struct Room: Hashable, Codable, Identifiable {
    var id: Int
    var roomType: String    // 집의 종류
    var rentType: String    // 거래 유형
    var rentFee: Int        // 월세 또는 전세금
    var deposit: Int        // 보증금
    var manageFee: Int      // 관리비
    var parkingFee: Int     // 주차비
    var isShortTerm: Bool     // 단기임대 가능여부 (true, false)
    var excluSpace: Double      // 전용면적
    var supplySpace: Double     // 공급면적
    var floorNum: Int       // 집 층수 (-1: 지하1층, 0: 반지하, 99: 옥탑
    var buildNum: Int       // 건물 층수
    var memo: String        // 메모
    
    // 상세정보
    var isParking: Int          // 주차 가능여부 (1, 2, 0)
    var isElevator: Bool        // 엘리베이터 여부
    var isHeatingIndiv: Bool    // 개별난방 여부
    var windowDir: String       // 창문 방향 (동, 서, 남, 북, 북동, 북서, 남동, 남서)
    var completionDate: Int     // 준공 년도
    var ableDate: String        // 입주가능일
    var address: String         // 집 주소
    var estateNum: String       // 부동산 전화번호
    var url: String             // 어플에서 찾은 매물정보 URL
    
    struct ManageFee: Hashable, Codable {
        var electric: Bool
        var gas: Bool
        var water: Bool
        var internet: Bool
        var tv: Bool
        var parkFee: Bool
    } // 관리비 포함항목 (전기, 가스, 수도, 인터넷, TV, 주차료 / 복수선택 가능)
    
    struct BuiltIn: Hashable, Codable {
        var airCon: Bool
        var refrigerator: Bool
        var washer: Bool
        var gasRange: Bool
        var desk: Bool
        var bed: Bool
        var closet: Bool
        var shoeCloset: Bool
        var sink: Bool
        var microwave: Bool
        var tub: Bool
    } // 빌트인 (에어컨, 냉장고, 세탁기, 인덕션/가스레인지, 책상, 침대, 옷장, 신발장, 싱크대, 전자레인지, 욕조 / 복수선택 가능)
    
    struct NearHome: Hashable, Codable {
        var laundry: Bool
        var convenience: Bool
        var mart: Bool
        var department: Bool
        var pcRoom: Bool
        var cafe: Bool
        var fastFood: Bool
        var rentCar: Bool
    } // 집 주변 정보 (코인세탁소, 편의점, 대형마트, 백화점, PC방, 카페, 패스트푸드, 쏘카존/그린카존)

    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude, // 위도
            longitude: coordinates.longitude    // 경도
        )
    }
    
//    var swipeImage: Image? {
//        isFeatured ? Image(imageName + "_feature") : nil
//    }
    
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}
