//
//  ViewController.swift
//  Example
//
//  Created by Mohammad reza Koohkan on 4/11/1399 AP.
//  Copyright © 1399 AP Mohamadreza Koohkan. All rights reserved.
//

import UIKit
import VersionKit

class ViewController: UIViewController {

    @IBOutlet weak var current: UILabel!
    @IBOutlet weak var new: UILabel!
    @IBOutlet weak var old: UILabel!
    
    // TODO:
    // Create textfield ta betone major.minor.pathch ro khodesh vared konee ya random ba ye dokme man az 0 ta 99 generate konam
    
    let exampleOfCurrentAppVersion = "51.2.20"
    let exampleOfHigherAppVersion = "52.1.14"
    let exampleOfLowerAppVersion = "51.0.25"
    
    lazy var appVersion: AppVersion? = AppVersion(version: self.exampleOfCurrentAppVersion)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    
    fileprivate func setupView() {
        guard let appVersion = self.appVersion else { return }
        self.current.text = appVersion.version
        self.new.text = self.exampleOfHigherAppVersion
        self.old.text = self.exampleOfLowerAppVersion
    }

    @IBAction func updateNewVersionTapped(_ sender: UIButton) {
        guard let appVersion = self.appVersion else { return }
        let isNewVersionHigher = appVersion.isLower(thanVersion: self.exampleOfHigherAppVersion)
        if isNewVersionHigher {
            print("\(self.exampleOfHigherAppVersion) is higher than current version, you should update app")
        }else{
            print("\(self.exampleOfHigherAppVersion) is lower than current version, you have latest version")
        }
    }
    
    @IBAction func checkOldVersionTapped(_ sender: UIButton) {
        guard let appVersion = self.appVersion else { return }
        let isOldVersionLower = appVersion.isHigher(thanVersion: self.exampleOfLowerAppVersion)
        if isOldVersionLower {
            print("\(self.exampleOfLowerAppVersion) is lower than current version, you have latest version")
        }else{
            print("\(self.exampleOfLowerAppVersion) is higher than current version, you should update app")
        }
    }
    
    
    
    
}

