//
//  ModelData.swift
//  MyRoom
//
//  Created by 김우성 on 2021/11/03.
//

import Foundation

var rooms: [Room] = load("roomData.json") // rooms는 파일에서 load해온 Room 구조체의 배열

// T : 제네릭. 타입에 제한을 두지 않는 코드를 사용할 때 쓴다.
// String으로 주어지는 파일을 받고, 타입 제한 없는 걸로 출력한다
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    // 메인 번들에서 filename을 갖는 파일을 찾아 할당
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("메인 번들에서 \(filename)을 찾을 수 없음.")
    }
    
    // 찾은 파일의 컨텐츠를 data로 읽어옴
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("메인 번들에서 \(filename) 을 읽어올 수 없음:\n\(error)")
    }
    
    // decoder로 data를 자동으로 분류하며 디코드
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

// 어떤 구조체와 파일명을 넘겨 파일을 저장
func save<T : Encodable>(_ value: T, _ filename: String) {
    do {
        let fileURL = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent(filename)
        
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
    
        try encoder.encode(value) // 괄호에는 room에 해당하는 것이 들어가야 함
            .write(to: fileURL, options: .atomic)
    } catch {
        print("인코딩에 문제가 발생함: \(error)")
    }
}
