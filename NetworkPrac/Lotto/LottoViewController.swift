//
//  LottoViewController.swift
//  NetworkPrac
//
//  Created by SUCHAN CHANG on 1/16/24.
//

import UIKit

class LottoViewController: UIViewController {
    
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var dateLabel: UILabel!
    
    let manager = LottoAPIManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manager.callRequest(number: 1102) { date in
            self.dateLabel.text = date
        }
    }
    
    @IBAction func textFieldReturnTapped(_ sender: UITextField) {
        // 공백이거나, 문자를 입력한 경우에는 통신이 잘 안될 수도 있겠다!
        manager.callRequest(number: Int(sender.text!) ?? 0) { date in
            self.dateLabel.text = date
        }
    }
}
