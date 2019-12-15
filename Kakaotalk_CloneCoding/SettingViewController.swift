//
//  SettingViewController.swift
//  Kakaotalk_CloneCoding
//
//  Created by DohyunKim on 27/11/2019.
//  Copyright © 2019 DohyunKim. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {
    
    @IBOutlet weak var blockManageView: UIView!
    
    @IBOutlet weak var hiddenManageView: UIView!
    
    @IBOutlet weak var logoutView: UIView!
    
    @IBOutlet weak var checkIDView: UIView!
    
    override func viewDidLoad() {
        
        blockManageView.layer.cornerRadius = 15
        blockManageView.layer.shadowOffset = CGSize(width: 0, height: 0.4)
        blockManageView.layer.shadowRadius = 8
        blockManageView.layer.shadowOpacity = 0.3
        
        hiddenManageView.layer.cornerRadius = 15
        hiddenManageView.layer.shadowOffset = CGSize(width: 0, height: 0.4)
        hiddenManageView.layer.shadowRadius = 8
        hiddenManageView.layer.shadowOpacity = 0.3
        
        checkIDView.layer.cornerRadius = 15
        checkIDView.layer.shadowOffset = CGSize(width: 0, height: 0.4)
        checkIDView.layer.shadowRadius = 8
        checkIDView.layer.shadowOpacity = 0.3
        
        logoutView.layer.cornerRadius = 15
        logoutView.layer.shadowOffset = CGSize(width: 0, height: 0.4)
        logoutView.layer.shadowRadius = 8
        logoutView.layer.shadowOpacity = 0.3
        
        super.viewDidLoad()
    }
}
