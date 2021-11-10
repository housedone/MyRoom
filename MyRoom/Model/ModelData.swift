//
//  ModelData.swift
//  MyRoom
//
//  Created by 김우성 on 2021/11/03.
//

import Foundation

var rooms: [Room] = load("roomData.json") // rooms는 파일에서 load해온 Room 구조체의 배열

// T : 제네릭. 타입에 제한을 두지 않는 코드를 사용할 때 쓴다.
// String으로 된 파일이름을 받고, 타입 제한 없는 걸로 출력한다
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("메인 번들에서 \(filename)을 찾을 수 없음.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("메인 번들에서 \(filename) 을 읽어올 수 없음:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

//func save(_ filename: String) {
//    do {
//        let encoder = JSONEncoder()
//        let data = try encoder.encode()// 무언가를 인코드
//    } catch {
//        print("인코딩에 문제가 발생함: \(error)")
//    }
//}
