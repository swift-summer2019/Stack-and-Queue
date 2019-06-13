//
//  ViewController.swift
//  Stack and Queue
//
//  Created by Aseel Alshohatee on 6/12/19.
//  Copyright © 2019 Aseel Alshohatee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var count: Int? = 0;   //how many employees we currently have
    
    @IBOutlet weak var textField: UITextField!;
    
    override func viewDidLoad() {
        super.viewDidLoad();
        // Do any additional setup after loading the view, typically from a nib.
        title = "Employee number \(count! + 1)";
        textField.becomeFirstResponder();
    }
    
    @IBAction func returnKeyPressed(_ sender: UITextField) {
        sender.resignFirstResponder();
    }
    
}

