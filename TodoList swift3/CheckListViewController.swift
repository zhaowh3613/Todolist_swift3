//
//  ViewController.swift
//  TodoList swift3
//
//  Created by Wenhui Zhao on 2017/3/5.
//  Copyright © 2017年 Wenhui Zhao. All rights reserved.
//

import UIKit

class CheckListViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func ShowAlert() {
        let alert = UIAlertController(title: "hello", message: "hello world", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }

}

