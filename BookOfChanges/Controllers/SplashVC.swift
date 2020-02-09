//
//  SplashVC.swift
//  BookOfChanges
//
//  Created by Mairambek on 2/5/20.
//  Copyright © 2020 Evgeniy Suprun. All rights reserved.
//

import UIKit

class SplashVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UserDefaults.standard.bool(forKey: "checkValidation") {
            let myKeySecretApp = "78f3b3a9f3bc4c7983dec2dc9163faec"
            IAPPMAnager.shared.receiptValidation(secretKey: myKeySecretApp)
        } else {
            let purchaseVC = ProViewController()
            UIApplication.shared.keyWindow?.rootViewController = purchaseVC
        }
    }
}
