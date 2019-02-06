//
//  ViewController.swift
//  sampleProject1
//
//  Created by Jayaram G on 21/01/19.
//  Copyright © 2019 Jayaram G. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var ResultText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        ResultText.text = GlobalVariables.sharedManager.Something
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        let MoveToSearchVc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SearchVc") as? SearchController
        
        // present the HomeVC
        
        self.present(MoveToSearchVc!,animated: true ,completion: nil)
        
        
    }

}

