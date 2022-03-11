//
//  ViewController.swift
//  TestLoginDemo
//
//  Created by 盧彥辰 on 2021/8/30.
//

import UIKit
import FacebookLogin

class ViewController: UIViewController {

    @IBOutlet weak var appleLogInButton: UIButton!
    
    let fb = FacebookLogInHandler.shared
    let google = GoogleSignInHandler.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if #available(iOS 13.0, *) {
            appleLogInButton.isHidden = false
        }
        
        fb.fbLogInResult = { [self] (success) in
            
        }
    }

    // facebook 登入按鈕
    @IBAction func facebookLogInAction(_ sender: UIButton) {
        fb.LogIn()
    }
    
    // google 登入按鈕
    @IBAction func googleLogInAction(_ sender: UIButton) {
        google.signIn(controller: self)
    }
    
    // apple id 登入按鈕
    @IBAction func appleLogInAction(_ sender: UIButton) {
        
    }
}

