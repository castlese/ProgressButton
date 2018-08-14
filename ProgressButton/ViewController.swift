//
//  ViewController.swift
//  ProgressButton
//
//  Created by Emily Castles on 07/08/2018.
//  Copyright © 2018 Emily Castles. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func newProgressButtonPressed(_ sender: Any) {
        newProgressButton.isHidden = true
    }
    @IBOutlet weak var newProgressButton: ProgressButton!
    @IBAction func resetButtonPressed(_ sender: Any) {
        newProgressButton.autoDismiss(after: 5)
    }
}

