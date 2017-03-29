//
//  ViewController.swift
//  Blockstack
//
//  Created by Larry Salibra on 3/28/17.
//  Copyright © 2017 Blockstack. All rights reserved.
//

import UIKit
import SafariServices
class ViewController: UIViewController, SFSafariViewControllerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        NSLog("viewDidLoad")
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        NSLog("viewDidAppear")
        let url = URL(string: "http://localhost:8080")!
        let svc = SFSafariViewController(url: url)
        self.present(svc, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

