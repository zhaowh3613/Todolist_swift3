//
//  ViewController.swift
//  TodoList swift3
//
//  Created by Wenhui Zhao on 2017/3/5.
//  Copyright © 2017年 Wenhui Zhao. All rights reserved.
//

import UIKit

class CheckListViewController: UITableViewController {
    var items: [ChecklitItem]

    required init?(coder aDecoder: NSCoder) {
        items = [ChecklitItem]()
        
        let row0 = ChecklitItem()
        row0.checked = false
        row0.text = "books"
        items.append(row0)
        
        let row1 = ChecklitItem()
        row1.checked = false
        row1.text = "shopping"
        items.append(row1)
        
        let row2 = ChecklitItem()
        row2.checked = false
        row2.text = "musice"
        items.append(row2)
        super.init(coder: aDecoder)
    }
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
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        let item = items[indexPath.row]
        configText(for: cell, with: item)
        configCheckmark(for: cell, with: item)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            let item = items[indexPath.row]
            item.toggleChecked()
            configCheckmark(for: cell, with: item)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func configText(for cell: UITableViewCell, with item: ChecklitItem) {
//        let item = items[indexPath.row]
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = item.text

    }
    
    func configCheckmark(for cell: UITableViewCell, with item: ChecklitItem) {
//        let item = items[indexPath.row]
        if item.checked {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
    }

}

