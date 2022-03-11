//
//  FacebookLoginHandler.swift
//  TestLoginDemo
//
//  Created by 盧彥辰 on 2021/8/30.
//

import Foundation
import FacebookLogin

class FacebookLogInHandler: NSObject {
    
    static let shared = FacebookLogInHandler()
    
    let manager = LoginManager()
    
    var isFbLogIn: Bool = false
    
    // 檢查使用者的登入狀態
    func checkLogInStatus() {
        if let accessToken = AccessToken.current {
            print("\(accessToken.userID) login")
            isFbLogIn = true
        } else {
            // not login
            isFbLogIn = false
        }
    }
    
    var fbLogInResult = {(success: Bool) -> () in }
    // 登入
    func LogIn() {
        
        manager.logIn(permissions: [.email, .publicProfile]) { [self] (result) in
            if case LoginResult.success(granted: _, declined: _, token: _) = result {
                print("login ok")
                fbLogInResult(true)
                getUserProfile()
            } else {
                print("login fail")
                fbLogInResult(false)
            }
        }
    }
    
    //讀取使用者的 FB profile 資訊
    func getUserProfile() {
        if AccessToken.current != nil {
            Profile.loadCurrentProfile { (profile, error) in
                if error == nil {
                    if let profile = profile {
                        print("profile.userID = ", profile.userID)
                        print("profile.email = ", profile.email ?? "can't get email")
                        print("profile.name = ", profile.name ?? "can't get name")
                        print("profile.imageURL = ", profile.imageURL(forMode: .square, size: CGSize(width: 300, height: 300)) ?? "can't get imageURL")
                    }
                } else {
                    print("loadCurrentProfile Error = ", error?.localizedDescription ?? "loadCurrentProfile Error")
                }
            }
        }
    }
    
    // FB 登出
    func fbLogOut() {
        manager.logOut()
        print("fbLogOut")
    }
}
