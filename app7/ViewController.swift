//
//  ViewController.swift
//  app7
//
//  Created by ios on 2018/1/22.
//  Copyright © 2018年 pcschool. All rights reserved.
//

import UIKit
import HMSegmentedControl


class TEDCustomCell:UITableViewCell{
    @IBOutlet weak var imgView1: UIImageView!
    @IBOutlet weak var imgView2: UIImageView!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
}



class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var myTableView: UITableView!
    
    var searchController:UISearchController!
    
    var arys = ["aa","bb","cc","dd"]
    var arys2 = ["AA","BB","CC"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        if section == 0 {
            return 2
        }else if section == 1{
            return 2
        }
        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! TEDCustomCell
        
//        cell.imgView1.image

        let str1 = "pic" + String(indexPath.row*2)
        cell.imgView1.image=UIImage(named: str1)
        cell.imgView1.contentMode = .scaleAspectFit
        let str2 = "pic" + String(indexPath.row*2+1)
        cell.imgView2.image=UIImage(named: str2)
        cell.imgView2.contentMode = .scaleAspectFit
        print("str1=\(str1) , str2=\(str2)   ")
        
        
        
        cell.label1.text = arys[indexPath.row*2]
        cell.label2.text = arys[indexPath.row*2+1]
        
//        indexPath.section
//        indexPath.row
//        if indexPath.section == 0 {
//            cell.textLabel?.text = arys[indexPath.row]
//        }else{
//            cell.textLabel?.text = arys2[indexPath.row]
//        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
    }
    

    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
    }
    
    
//
//
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "my header"
    }

    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "my footer"
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        searchController=UISearchController(searchResultsController: nil)
        
        myTableView.tableHeaderView=searchController.searchBar
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

