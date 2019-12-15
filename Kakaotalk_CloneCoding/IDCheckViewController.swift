//
//  IDCheckViewController.swift
//  Kakaotalk_CloneCoding
//
//  Created by DohyunKim on 28/11/2019.
//  Copyright © 2019 DohyunKim. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class IDCheckViewController: UIViewController {
    
    @IBOutlet weak var IDCheckView: UIView!
    
    override func viewDidLoad() {
        IDCheckView.layer.cornerRadius = 7
        super.viewDidLoad()
    }
}
