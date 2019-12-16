//
//  ProfileChangeViewController.swift
//  Kakaotalk_CloneCoding
//
//  Created by DohyunKim on 28/11/2019.
//  Copyright © 2019 DohyunKim. All rights reserved.
//

import UIKit


class ProfileChangeViewController: UIViewController {

    @IBOutlet weak var txtNickname: UITextField!
    
    @IBOutlet weak var txtStatusMessage: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setProfile() {
        <#function body#>
    }
}

 case 401:
                print("request의 header에 Authorization으로 JWT를 포함하지 않았거나 빈 문자열을 줌")
                
//            case 403:
//                print("사용 가능 기간이 만료된 JWT")
                
            case 404:
                print("JWT로 인증된 사용자가 실제로는 존재하지 않음")
                
            case 422:
                print("서버에서 해석할 수 없는 잘못된 형식의 JWT or 다른 타입의 토큰을 넘겨 줌")
