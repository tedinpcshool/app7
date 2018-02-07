//
//  TEDVC5.swift
//  app7
//
//  Created by ios on 2018/1/29.
//  Copyright © 2018年 pcschool. All rights reserved.
//

import UIKit

class TEDVC5: UIViewController,UITableViewDataSource,UITableViewDelegate,UISearchResultsUpdating,UISearchBarDelegate {
    
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        shouldShowSearchResults = true
        tblSearchResults.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if !shouldShowSearchResults {
            shouldShowSearchResults = true
            tblSearchResults.reloadData()
        }
        
        searchController.searchBar.resignFirstResponder()
    }
    
    
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
            shouldShowSearchResults = false
            tblSearchResults.reloadData()
        
    }
    
    
    
    func updateSearchResults(for searchController: UISearchController) {
        
        guard let searchString = searchController.searchBar.text else {
            return
        }
        filteredArray = dataArray.filter { (country) -> Bool in
            return country.contains(searchString)
        }
        
        
        // Filter the data array and get only those countries that match the search text.
        filteredArray = dataArray.filter({ (country) -> Bool in
            let countryText = country
            return countryText.contains(searchString)
            
//            let countryText:NSString = country
            
//            return (countryText.rangeOfString(searchString, options: NSStringCompareOptions.CaseInsensitiveSearch).location) != NSNotFound
        })
        
        // Reload the tableview.
        tblSearchResults.reloadData()
    }
    
    
    var searchController: UISearchController!
    
    func configureSearchController() {
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Search here..."
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
        searchController.searchBar.sizeToFit()
        tblSearchResults.tableHeaderView = searchController.searchBar
    }
    
    
    //-Mark:tableView protocal
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if shouldShowSearchResults {
            return filteredArray.count
        }
        else {
            return dataArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "idCell")!
//        var cell = tableView.dequeueReusableCellWithIdentifier("idCell", forIndexPath: indexPath)
        
        if shouldShowSearchResults {
            cell.textLabel?.text = filteredArray[indexPath.row]
        }
        else {
            cell.textLabel?.text = dataArray[indexPath.row]
        }
        
        return cell
    }
    

    var dataArray = [String]()
    
    var filteredArray = [String]()
    
    var shouldShowSearchResults = false
    
    @IBOutlet weak var tblSearchResults: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loadListOfCountries()
        configureSearchController()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func loadListOfCountries() {
        // Specify the path to the countries list file.
        
        Bundle.main.path(forResource: "abc", ofType: "txt")
        
        let pathToFile = Bundle.main.path(forResource: "countries", ofType: "txt")
        
//        let pathToFile = NSBundle.mainBundle().pathForResource("countries", ofType: "txt")
        
        if let path = pathToFile {
            
            
            
    /*
            
            // Load the file contents as a string.
            let countriesString = String(contentsOfFile: path, encoding: NSUTF8StringEncoding, error: nil)!
            
            // Append the countries from the string to the dataArray array by breaking them using the line change character.
            dataArray = countriesString.componentsSeparatedByString("\n")
            
            // Reload the tableview.
            tblSearchResults.reloadData()
            
      */
            
            // Load the file contents as a string.
            do{
                let coutriesString = try String(contentsOfFile: path, encoding: .utf8)
                // Append the countries from the string to the dataArray array by breaking them using the line change character.
                
                
                
                dataArray = coutriesString.components(separatedBy: "\n")
//                dataArray = coutriesString.componentsSeparatedByString("\n")
                
                // Reload the tableview.
                tblSearchResults.reloadData()
                
            }catch{
                
            }
//            let countriesString = String(contentsOfFile: path, encoding: NSUTF8StringEncoding, error: nil)!
            
            
        }
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
