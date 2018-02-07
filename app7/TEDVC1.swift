//
//  TEDVC1.swift
//  app7
//
//  Created by ios on 2018/1/24.
//  Copyright © 2018年 pcschool. All rights reserved.
//

import UIKit
import HMSegmentedControl
class TEDVC1: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var titles=["a","b","c"]
        
        let imgs1=[#imageLiteral(resourceName: "pic0"),#imageLiteral(resourceName: "pic1"),#imageLiteral(resourceName: "pic2")]
        let imgs2=[#imageLiteral(resourceName: "pic3"),#imageLiteral(resourceName: "pic2"),#imageLiteral(resourceName: "pic1")]
        let aa = HMSegmentedControl(sectionImages: imgs1, sectionSelectedImages: imgs2, titlesForSections: titles)!
        aa.frame = CGRect(x: 50, y: 200, width: 200, height: 100)
        self.view.addSubview(aa)
        
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
