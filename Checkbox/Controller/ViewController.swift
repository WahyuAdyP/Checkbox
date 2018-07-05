//
//  ViewController.swift
//  Checkbox
//
//  Created by Crocodic MBP-2 on 7/5/18.
//  Copyright © 2018 Crocodic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var checkbox: CheckBox!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Handle checkbox state change
        checkbox.setOnTap { (checkBox, isChecked) in
            print("Checkbox in checked state is \(isChecked)")
        }
        
        // Change checkbox state
        checkbox.setState(in: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

