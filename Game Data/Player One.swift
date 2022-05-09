//
//  Player One.swift
//  Game Data
//
//  Created by Aaron Fleming on 5/3/22.
//

import Foundation
import UIKit
var isClickCredit = false
class PlayOne: UIViewController {

    @IBOutlet weak var lblCredit: UILabel!
    @IBOutlet weak var textfield: UITextField!
    @IBOutlet weak var creditBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector:  #selector(fetchSettingFromCloud), userInfo: nil, repeats: true)
        if isClickCredit == false {
            textfield.isHidden = true
            creditBtn.isHidden = true
        }else {
            textfield.isHidden = false
            creditBtn.isHidden = false
        }
        
    }

    @objc func fetchSettingFromCloud() {
        CloudManager.shared.fetchSettingFromCloud {
            if let settingSort = CloudManager.shared.settingRecord?["Credits"] as? String {
                DispatchQueue.main.async {
                    self.lblCredit.text = settingSort
                }
            }
        }
    }
    
    @IBAction func actionBuy(_ sender: Any) {
        
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
    }
    
}
