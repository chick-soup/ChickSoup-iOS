//
//  SignupViewController.swift
//  Kakaotalk_CloneCoding
//
//  Created by DohyunKim on 27/11/2019.
//  Copyright © 2019 DohyunKim. All rights reserved.
//

import UIKit


class SignupViewController: UIViewController {
    
    var mainUrl = URL(string: "https://chicksoup.s3.ap-northeast-2.amazonaws.com/")
    
    var emailCheckUrl = URL(string: "https://chicksoup.s3.ap-northeast-2.amazonaws.com/email/check")
    
    var emailAuthUrl = URL(string: "https://chicksoup.s3.ap-northeast-2.amazonaws.com/email/auth")
    
    var signupUrl = URL(string: "https://chicksoup.s3.ap-northeast-2.amazonaws.com/signup")
    
    
    @IBOutlet weak var EmailView: UIView!
    
    @IBOutlet weak var pwView: UIView!
    
    @IBOutlet weak var EmailVaildView: UIView!
    
    @IBOutlet weak var pwVaildView: UIView!
    
    @IBOutlet weak var txtEmailVaild: UITextField!
    
    @IBOutlet weak var txtEmailVaildCheck: UITextField!
    
    @IBOutlet weak var txtPW: UITextField!
    
    @IBOutlet weak var txtPWVaild: UITextField!
    
    override func viewDidLoad() {
        EmailView.layer.cornerRadius = 22.5
        EmailVaildView.layer.cornerRadius = 22.5
        pwView.layer.cornerRadius = 22.5
        pwVaildView.layer.cornerRadius = 22.5
        super.viewDidLoad()
    }
    
    @IBAction func btnEmailVaildCheck(_ sender: Any) {
        emailVaildCheck()
    }
    
    @IBAction func btnEmailVaildAuth(_ sender: Any) {
        emailVaildAuth()
    }
    
    @IBAction func btnSignup(_ sender: Any) {
        signup()
    }
    
    func emailVaildCheck() {
        
        if (txtEmailVaild.text!.count > 30 ) {
            print("30자 이하만 사용 가능")
        } else {
            let parameters = ["email": txtEmailVaild.text!]
            
            var request = URLRequest(url: emailCheckUrl!)
            
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
                    
                    print("인증번호 발송 성공")
                    
                    
                case 400:
                    print("인증번호 발송 실패")
                    
                case 470:
                    print("인증만 완료된 이메일")
                    
                case 471:
                    print("이미 인증 완료 후 회원가입시 사용된 이메일")
                    
                default:
                    DispatchQueue.main.async {
                        print((res as! HTTPURLResponse).statusCode)
                    }
                    
                }
            }.resume()
            
        }
    }
    
    func emailVaildAuth() {
        
        if (txtEmailVaildCheck.text!.count != 10) {
            print("인증번호는 10자리입니다")
        } else {
            
            let parameters = ["email": txtEmailVaild.text!, "auth_code": txtEmailVaildCheck.text!]
            
            var request = URLRequest(url: emailAuthUrl!)
            
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
                    
                    print("이메일 인증 성공")
                    
                    
                case 400:
                    print("이메일 인증 실패")
                    
                case 470:
                    print("이미 인증 처리가 완료된 이메일임")
                    
                case 471:
                    print("이메일 인증을 요청하지 않은 이메일을 전송함")
                    
                case 472:
                    print("이메일의 인증 코드가 올바르지 않음")
                    
                default:
                    DispatchQueue.main.async {
                        print((res as! HTTPURLResponse).statusCode)
                    }
                    
                }
            }.resume()
        }
    }
    
    
    func signup() {
        
        if (txtPW.text! == txtPWVaild.text! && txtPW.text!.count > 8) {
            
            let parameters = ["email": txtEmailVaild.text!, "password": txtPW.text!]
            
            var request = URLRequest(url: emailAuthUrl!)
            
            request.httpMethod = "POST"
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: parameters,  options: .prettyPrinted)
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
                    
                    print("회원가입 성공 및 사용자 이름 = \"DEFUALT\", 상태 메세지 = NULL로 초기화")
                    
                    UserDefaults.standard.set(jsonSerialization["access_token"], forKey: "access_token")
                    
                case 400:
                    print("이메일 인증 실패")
                    
                case 470:
                    print("이미 사용중인 이메일임")
                    
                case 471:
                    print("이메일 인증을 요청하지 않은 이메일임")
                    
                case 473:
                    print("다른 IP의 사용자가 인증한 이메일에 접근을 시도함")
                    
                default:
                    DispatchQueue.main.async {
                        print((res as! HTTPURLResponse).statusCode)
                    }
                    
                }
            }.resume()
        } else {
            print("비밀번호가 일치하지 않거나 8자리 미만입니다.")
        }
        
    }
    
    
    
}
