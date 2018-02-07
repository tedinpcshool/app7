//
//  TEDVC2.swift
//  app7
//
//  Created by ios on 2018/1/26.
//  Copyright © 2018年 pcschool. All rights reserved.
//

import UIKit

class TEDVC2: UIViewController {
// aaa
//    ddgeet
    
    @IBOutlet var myLabels: [UILabel]!
    
    
    @IBAction func aaaaaa(_ sender: UIButton) {
        
        print("aaaaa")
        
    }
    
    @IBOutlet weak var label1: UILabel!
    @IBAction func pushBtn(_ sender: UIButton) {
        
        print("pushBtn")
        
        switch sender.tag {
        case 1:
            label1.text="you push 1"
        case 2:
            label1.text="you push 2"
        case 3:
            label1.text="you push 3"
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "vc3") as! TEDVC3
            
            
            self.present(vc, animated: true, completion: {
                
            })
            
//            self.present(vc!, animated: true, completion: {
//                print("completion")
//            })
        case 4:
            label1.text="you push 4"
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "vc4")
            self.navigationController?.pushViewController(vc!, animated: true)
        case 5:
            label1.text="you push 5"
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "vc5")
            self.navigationController?.pushViewController(vc!, animated: true)
            
        default:
            break
        }
        
        for labellllll in myLabels{
            if labellllll.tag == sender.tag{
                labellllll.text="you push this! "+String(sender.tag)
                
            }
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
