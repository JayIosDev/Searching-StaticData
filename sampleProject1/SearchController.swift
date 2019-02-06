//
//  SearchController.swift
//  sampleProject1
//
//  Created by Jayaram G on 21/01/19.
//  Copyright © 2019 Jayaram G. All rights reserved.
//

import UIKit

class SearchController: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate {
   // @IBOutlet weak var resultLbl: UILabel!
    @IBOutlet weak var searchText: UITextField!
    var filtered:[String] = []

    var searchActive : Bool = false

    
    
    let SampleArray = ["Shyam","Neethu","Ram","Poonam","Ajith","Jithen","Nirmal","Naveen","Kiran","Madhu","Sheetal","Manju","Radha","Kireethana","Pallavi","Nikil","Sreejith","Sony","Leela","Ramya","Jishnu","Karthik","Manu","Nishanth","Parvathy","Shyam","Neethu","Ram","Poonam","Ajith","Jithen","Nirmal","Naveen","Kiran","Madhu","Sheetal","Manju","Radha","Kireethana","Pallavi","Nikil","Sreejith","Sony","Leela","Ramya","Jishnu","Karthik","Manu","Nishanth","Parvathy"]

    @IBOutlet weak var TableView1: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        searchText.addTarget(self, action: #selector(SearchController.textFieldDidChange(_:)),
                            for: UIControl.Event.editingChanged)
    
        


    }
    @objc func textFieldDidChange(_ textField: UITextField) {
        
        // filter tableViewData with textField.text
        
        let searchText  = textField.text
        
        filtered = SampleArray.filter({ (text) -> Bool in
            let tmp: NSString = text as NSString
            let range = tmp.range(of: searchText!, options: NSString.CompareOptions.caseInsensitive)
            return range.location != NSNotFound
        })
        if(filtered.count == 0){
            searchActive = false;
        } else {
            searchActive = true;
        }
        self.TableView1.reloadData()
        
    }
  
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(searchActive){
            return filtered.count
        } else {
            return SampleArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchCell", for: indexPath) as! SearchCell
        if(searchActive){
            cell.resultLbl.text = filtered[indexPath.row]
        } else {
            cell.resultLbl.text = SampleArray[indexPath.row]
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//   GlobalVariables.sharedManager.Something = filtered[indexPath.count]
        
        if(searchActive){
            GlobalVariables.sharedManager.Something = filtered[indexPath.row]
        } else {
            GlobalVariables.sharedManager.Something = SampleArray[indexPath.row]
        }

    
        
        let MoveToHomeVc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeVc") as? ViewController
        
        // present the HomeVC
        
        self.present(MoveToHomeVc!,animated: true ,completion: nil)
        
    }
 

}
