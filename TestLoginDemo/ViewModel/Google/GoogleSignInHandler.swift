//
//  GoogleSignInHandler.swift
//  TestLoginDemo
//
//  Created by 盧彥辰 on 2021/8/31.
//

import Foundation
import GoogleSignIn

private let GOOGLE_SERVICE_CLIENT_ID: String = "974075875217-ahhedcl8iujgfumopr66jtqeetabnuvp.apps.googleusercontent.com"


class GoogleSignInHandler: NSObject {
    
    static let shared = GoogleSignInHandler()
    
    let signInConfig = GIDConfiguration.init(clientID: GOOGLE_SERVICE_CLIENT_ID)
    
    
    
    /// 谷歌登入
    /// - Parameter controller: 當前的 UIViewController
    func signIn(controller: UIViewController) {
        
        GIDSignIn.sharedInstance.signIn(with: signInConfig, presenting: controller) { (user, error) in
            
            // 取得用戶資訊
            guard error == nil else { return }
            guard let user = user else { return }
            
            let emailAddress = user.profile?.email
            
            let fullName = user.profile?.name
            let userID = user.userID
            
            let profilePicUrl = user.profile?.imageURL(withDimension: 320)
            
            print("谷歌登入成功")
            print(" \n emailAddress = \(emailAddress) \n fullName = \(fullName) \n profilePicUrl = \(profilePicUrl) \n userID = \(userID)")
        }
    }
    
    func signOut() {
        GIDSignIn.sharedInstance.signOut()
        print("谷歌登出")
    }
}
