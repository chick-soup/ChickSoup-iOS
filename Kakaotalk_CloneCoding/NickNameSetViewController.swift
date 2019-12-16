//
//  NickNameSetViewController.swift
//  Kakaotalk_CloneCoding
//
//  Created by DohyunKim on 02/12/2019.
//  Copyright © 2019 DohyunKim. All rights reserved.
//

import UIKit


class NickNameSetViewController: UIViewController {
    
    @IBOutlet weak var nickNameSetView: UIView!
    
    @IBOutlet weak var txtNickname: UITextField!
    
    var profileUrl = URL(string: "https://chicksoup.s3.ap-northeast-2.amazonaws.com/signup/profile")
    
    override func viewDidLoad() {
        nickNameSetView.layer.cornerRadius = 7
        super.viewDidLoad()
    }
    
    @IBAction func btnSetProfile(_ sender: Any) {
        signupProfile()
    }
    
    func signupProfile() {
        
        let parameters = ["nickname": txtNickname.text!]

        var request = URLRequest(url: profileUrl!)

        request.httpMethod = "POST"

        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
        } catch let error {
            print(error.localizedDescription)
        }
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("Authorization", forHTTPHeaderField: String(UserDefaults.standard.string(forKey :"refresh_token")!))
        URLSession.shared.dataTask(with: request) { [weak self] data, res, err in
            guard self != nil else { return }
            if let err = err { print(err.localizedDescription); return }
            print((res as! HTTPURLResponse).statusCode)
            switch (res as! HTTPURLResponse).statusCode{
                
                
                
            case 200:
                let jsonSerialization = try! JSONSerialization.jsonObject(with: data!, options: []) as! [String: Any]
                print("\(jsonSerialization)")
                
                print("해당 사용자의 닉네임 설정 성공")
               
            default:
                DispatchQueue.main.async {
                    print((res as! HTTPURLResponse).statusCode)
                }
                
            }
        }.resume()
    }
}
