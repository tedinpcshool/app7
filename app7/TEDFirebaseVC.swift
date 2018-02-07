//
//  TEDFirebaseVC.swift
//  app7
//
//  Created by ios on 2018/1/31.
//  Copyright © 2018年 pcschool. All rights reserved.
//

import UIKit
import Firebase

class TEDFirebaseVC: UIViewController {
    
    var handle: AuthStateDidChangeListenerHandle?
    
    var ref: DatabaseReference!
    
    
    
    @IBAction func pushBtn(_ sender: UIButton) {
        
        print("pushBtn")
        
        Auth.auth().createUser(withEmail: "abce@abc.com", password: "aaaaaa") { (user, error) in
            // ...
            print("user")
            if let error = error {
                print(error.localizedDescription)
            }
            
        }
        
        
        Auth.auth().signIn(withEmail: "abce@abc.com", password: "aaaaaa") { (user, error) in
            if let user = user {
                // The user's ID, unique to the Firebase project.
                // Do NOT use this value to authenticate with your backend server,
                // if you have one. Use getTokenWithCompletion:completion: instead.
                let uid = user.uid
                let email = user.email
                print("uid = \(uid), email= \(String(describing: email))")
                self.ref.child("users").child(user.uid).setValue(["username": "username"])
//                self.ref.child("users").child(user.uid).setValue(["shop-name": "shop1"])
                self.ref.child("users/\(user.uid)/shop-name").setValue("shop1")
//                let key = self.ref.child("posts").childByAutoId().key
//                let post = ["uid": uid,
//                            "author": "username",
//                            "title": "title",
//                            "body": "body"]
//                let childUpdates = ["/posts/\(key)": post,
//                                    "/user-posts/\(uid)/\(key)/": post]
//                self.ref.updateChildValues(childUpdates)
            }else{
                if let error = error {
                    print(error.localizedDescription)
                }
                print("sign in failed")
            }
        }
        
    }
    
    @IBAction func pushDB(_ sender: UIButton) {
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            // ...
            
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        Auth.auth().removeStateDidChangeListener(handle!)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        ref = Database.database().reference()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
