//
//  LanguageViewController.swift
//  NetworkPrac
//
//  Created by SUCHAN CHANG on 1/17/24.
//

import UIKit

class LanguageViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let languageDataList = [
        "ko": "한국어",
        "en": "영어",
        "ja": "일본어",
        "zh-CN": "중국어 간체",
        "zh-TW": "중국어 번체",
        "vi": "베트남어",
        "id": "인도네시아어",
        "th": "태국어",
        "de": "독일어",
        "ru": "러시아어",
        "es": "스페인",
        "it": "이탈리아어",
        "fr": "프렁스어"
    ]
    
    lazy var valuesArray = languageDataList.values.map { String($0) }
    
    var currentSourceLanguage: String = ""
    var currentTargetLanguage: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigationBar()
        configureTableView()
    }
    
    private func configureNavigationBar() {
        navigationItem.title = "이 언어로 입력"
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension LanguageViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return languageDataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LanguageTableViewCell")!
        
        let language = valuesArray[indexPath.row]
        
        cell.textLabel?.text = language
        
        if currentSourceLanguage == language {
            cell.textLabel?.textColor = .orange
            cell.textLabel?.font = .boldSystemFont(ofSize: 14.0)
        } else if currentTargetLanguage == language {
            cell.textLabel?.textColor = .blue
            cell.textLabel?.font = .boldSystemFont(ofSize: 14.0)
        }
        
        return cell
    }
}

extension LanguageViewController: UITableViewDelegate {
    
}
