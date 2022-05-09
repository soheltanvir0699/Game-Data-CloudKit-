//
//  Dealer2.swift
//  Game Data
//
//  Created by Sohel Rana on 9/5/22.
//

import UIKit

class Dealer2: UIViewController {

    @IBOutlet weak var textfield: UITextField!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationController!.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        CloudManager.shared.fetchSettingFromCloud { }
    }

    @IBAction func backAction(_ sender: Any) {
//        self.dismiss(animated: true, completion: nil)
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
