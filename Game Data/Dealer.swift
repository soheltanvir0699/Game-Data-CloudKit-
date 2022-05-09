//
//  Dealer.swift
//  Game Data
//
//  Created by Aaron Fleming on 5/3/22.
//

import Foundation
import UIKit

class Dealer: UIViewController {

    @IBOutlet weak var textfield: UITextField!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        CloudManager.shared.fetchSettingFromCloud { }
    }

    @IBAction func backAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func actionCredit(_ sender: Any) {
        if let textFieldText = textfield.text, !textFieldText.isEmpty {
            if CloudManager.shared.settingRecord == nil {
                CloudManager.shared.saveSettingOnCloud(textFieldText)
            } else {
                CloudManager.shared.updateSettingOnCloud(textFieldText)
            }
        }
        isClickCredit = true
//        let vc = (self.storyboard?.instantiateViewController(withIdentifier: "Dealer2"))!
//        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
