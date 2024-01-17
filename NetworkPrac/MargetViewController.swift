//
//  MargetViewController.swift
//  NetworkPrac
//
//  Created by SUCHAN CHANG on 1/16/24.
//

import UIKit
import Alamofire

struct MargetCode: Codable {
    let market: String
    let korean_name: String
    let english_name: String
}

class MargetViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var margetCodeList: [MargetCode] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        callRequest()
    }
    
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func callRequest() {
        let url = "https://api.upbit.com/v1/market/all"
        AF.request(url, method: .get)
            .validate(statusCode: 200..<501) // 상태코드 체크
            .responseDecodable(of: [MargetCode].self) { [weak self] response in
                guard let weakSelf = self else { return }
                switch response.result {
                case .success(let success):
                    if response.response?.statusCode == 200 {
                        weakSelf.margetCodeList = success
                        weakSelf.tableView.reloadData()
                    } else if response.response?.statusCode == 500 {
                        // 오류 처리
                        print("오류가 발생했어요. 잠시 후 다시 시도해주세요.")
                    }
                case .failure(let failure):
                    print(failure.localizedDescription)
                }
            }
    }
    
}

extension MargetViewController: UITableViewDelegate {
    
}

extension MargetViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return margetCodeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = margetCodeList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "MargetTableViewCell")!
        cell.textLabel?.text = data.market
        cell.detailTextLabel?.text = data.korean_name
        return cell
    }
    
}
