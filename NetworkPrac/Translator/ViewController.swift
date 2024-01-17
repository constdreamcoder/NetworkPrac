//
//  ViewController.swift
//  NetworkPrac
//
//  Created by SUCHAN CHANG on 1/16/24.
//

import UIKit
import Alamofire

struct Papago: Codable {
    let message: PapagoResult
}

struct PapagoResult: Codable {
    let result: PapagoFinal
}

struct PapagoFinal: Codable {
    let srcLangType: String
    let tarLangType: String
    let translatedText: String
}

class ViewController: UIViewController {
    
    @IBOutlet weak var sourceLanguageButton: UIButton!
    @IBOutlet weak var swapButton: UIButton!
    @IBOutlet weak var targetLanguageButton: UIButton!
    
    @IBOutlet weak var sourceTextView: UITextView!
    @IBOutlet weak var translateButton: UIButton!
    @IBOutlet weak var targetLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
     
        
        sourceLanguageButton.addTarget(self, action: #selector(languageButtonTapped), for: .touchUpInside)
        targetLanguageButton.addTarget(self, action: #selector(languageButtonTapped), for: .touchUpInside)
        
        translateButton.addTarget(self, action: #selector(translateButtonClicked), for: .touchUpInside)
    }
    
    /*
     1. 와이파이가 안될 때(네트워크 단절 상태)
     2. API 콜수 상한선을 넘었을 때
     3. 번역 버튼 연속 버튼 제한(API 콜 횟수 제한)
     4. 텍스트 비교
     5. ProgressBar, LoadingView
     */
    
    @objc func translateButtonClicked() {
        let url = "https://openapi.naver.com/v1/papago/n2mt"
        
        let parameters: Parameters = [
            "source": "ko",
            "target": "en",
            "text": sourceTextView.text!
        ]
        
        let headers: HTTPHeaders = [
            "X-Naver-Client-Id": APIKey.clientID,
            "X-Naver-Client-Secret": APIKey.clientSecret
        ]
        
        AF.request(url, method: .post, parameters: parameters, headers: headers)
            .responseDecodable(of: Papago.self) { response in
                switch response.result {
                case .success(let success):
                    print(success)
                    
                    self.targetLabel.text = success.message.result.translatedText
                case .failure(let failure):
                    print(failure)
                }
            }
    }
    
    @objc func languageButtonTapped() {
        let languageVC = storyboard?.instantiateViewController(withIdentifier: LanguageViewController.identifier) as! LanguageViewController
        
        languageVC.currentSourceLanguage = sourceLanguageButton.currentTitle!
        languageVC.currentTargetLanguage = targetLanguageButton.currentTitle!
        
        navigationController?.pushViewController(languageVC, animated: true)
    }


}

