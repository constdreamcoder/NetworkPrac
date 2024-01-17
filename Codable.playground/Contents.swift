import UIKit

// String
let jsonData = """
{
    "author": "Hue",
    "quote": "어디까지 디버깅 하셨나요?",
    "like": 2345
}
"""

// Decoding 전략
// 1. 키가 다르면 오류 발생 => Optional 해결 => nil로 다 들어와서 원하는 값을 얻을 수 없다.
// 2. CodingKeys를 통해 키값 매칭 => 디코딩 문제 해결. 서버에서 설정한 키랑 다른 키를 구조체에서 사용할 수 있음.
// => DecodingStrategy : CodingKey / init / decodeIfPresent / SnakeCase
struct Quote: Codable {
    let quote_content: String?
    let author_name: String?
    let likeCount: Int?
    
    enum CodingKeys: String, CodingKey {
        case quote_content = "quote"
        case author_name = "author"
        case likeCount = "like"
    }
}

// String을 Data 타입으로 변환 -> Data 타입을 Quote 구조체 타입 변환
func myDecoding() {
    guard let data = jsonData.data(using: .utf8) else {
        print("문제가 발생했어요")
        return
    }
    
    do {
        let value = try JSONDecoder().decode(Quote.self, from: data)
        
        dump(value)
    } catch {
        print(error)
    }
}

myDecoding()
