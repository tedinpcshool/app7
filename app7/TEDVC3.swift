//
//  TEDVC3.swift
//  app7
//
//  Created by ios on 2018/1/26.
//  Copyright © 2018年 pcschool. All rights reserved.
//

import UIKit

class TEDVC3: UIViewController {

    var aaaa = "aaaa"
    
    
    @IBAction func pushBtn(_ sender: UIButton) {
       
        
//        self.dismiss(animated: <#T##Bool#>, completion: <#T##(() -> Void)?##(() -> Void)?##() -> Void#>)
        
        self.dismiss(animated: true) {
            print("dismiss")
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
