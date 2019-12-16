//
//  ViewController.swift
//  Kakaotalk_CloneCoding
//
//  Created by DohyunKim on 27/11/2019.
//  Copyright © 2019 DohyunKim. All rights reserved.
//

import UIKit


class LoginViewController: UIViewController {
    
    let mainUrl =  URL(string: "https://chicksoup.s3.ap-northeast-2.amazonaws.com/")
    let loginUrl = URL(string: "https://chicksoup.s3.ap-northeast-2.amazonaws.com/login")
    
    
    @IBOutlet weak var txtID: UITextField!
    
    @IBOutlet weak var txtPW: UITextField!
    
    @IBOutlet weak var idView: UIView!
    
    @IBOutlet weak var pwView: UIView!
    
    override func viewDidLoad() {
        idView.layer.cornerRadius = 15
        pwView.layer.cornerRadius = 15
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginBtn(_ sender: Any) {
        login()
    }
    
    func login() {
        let parameters = ["email": txtID.text!, "password": txtPW.text!]
        var request = URLRequest(url: loginUrl!)
        
        request.httpMethod = "POST"
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
        } catch let error {
            print(error.localizedDescription)
        }
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        URLSession.shared.dataTask(with: request) { [weak self] data, res, err in
            guard self != nil else { return }
            if let err = err { print(err.localizedDescription); return }
            print((res as! HTTPURLResponse).statusCode)
            switch (res as! HTTPURLResponse).statusCode{
                
                
                
            case 200:
                let jsonSerialization = try! JSONSerialization.jsonObject(with: data!, options: []) as! [String: Any]
                print("\(jsonSerialization)")
                
                UserDefaults.standard.set(jsonSerialization["access_token"], forKey: "access_token")
                UserDefaults.standard.set(jsonSerialization["refresh_token"], forKey: "refresh_token")
                
                
            case 400:
                print("로그인 실패")
                
            case 470:
                print("해당 이메일의 계정이 존재하지 않음")
                
            case 471:
                print("비밀번호가 이메일과 매칭되지 않음")
                
            default:
                DispatchQueue.main.async {
                    print((res as! HTTPURLResponse).statusCode)
                }
                
            }
        }.resume()
        
        
        
    }
    
    
}
