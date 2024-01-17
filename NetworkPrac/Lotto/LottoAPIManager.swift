//
//  LottoAPIManager.swift
//  NetworkPrac
//
//  Created by SUCHAN CHANG on 1/16/24.
//

import Foundation
import Alamofire

struct LottoAPIManager {
    func callRequest(number: Int, completionHandler: @escaping (String) -> Void) {
        let url = "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=\(number)"
        AF.request(url, method: .get)
            .responseDecodable(of: Lotto.self) { response in
                switch response.result {
                case .success(let success):
                    completionHandler(success.drwNoDate)
                case .failure(let failure):
                    completionHandler("오류 발생")
                }
            }
    }
}
