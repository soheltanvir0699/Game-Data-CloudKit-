//
//  CloudManager.swift
//  PackageTrack
//
//  Created by Sahil Garg on 16/06/20.
//  Copyright © 2020 Sahil. All rights reserved.
//

import UIKit
import CloudKit

class CloudManager {

    static let shared = CloudManager()
    
    var settingRecord : CKRecord?
    
    let privateDatabase = CKContainer.init(identifier: "iCloud.com.app.gameDataAppiOS").publicCloudDatabase
    
    func fetchSettingFromCloud(completion: @escaping () -> ()) {
       
        let predicate = NSPredicate(value: true)
        let querySetting = CKQuery(recordType: "GameDataSetting", predicate: predicate)
        
        privateDatabase.perform(querySetting, inZoneWith: nil) { (results, error) in
            if error != nil {
                print(error?.localizedDescription as Any)
            } else {
                guard let record = results?.first else {
                    return
                }
                self.settingRecord = record
            }
            completion()
        }
        
    }
    
    func saveSettingOnCloud(_ credits: String) {
        
        let settingID = CKRecord.ID.init(recordName: "\(Date())")
        let record = CKRecord(recordType: "GameDataSetting", recordID: settingID)
        
        record.setObject(credits as NSString, forKey: "Credits")
        
        privateDatabase.save(record) { (result, error) in
            if error != nil {
                print(error?.localizedDescription as Any)
            } else {
                if let record = result {
                    self.settingRecord = record
                }
            }
        }
    }
    
    func updateSettingOnCloud(_ credits: String) {
        
        if let record = self.settingRecord {
            record.setObject(credits as NSString, forKey: "Credits")
            
            privateDatabase.save(record) { (result, error) in
                if error != nil {
                    print(error?.localizedDescription as Any)
                } else {
                    if let record = result {
                        self.settingRecord = record
                    }
                }
            }
        }
    }
    
}
