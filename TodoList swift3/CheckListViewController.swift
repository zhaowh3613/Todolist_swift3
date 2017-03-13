//
//  ViewController.swift
//  TodoList swift3
//
//  Created by Wenhui Zhao on 2017/3/5.
//  Copyright © 2017年 Wenhui Zhao. All rights reserved.
//

import UIKit

class CheckListViewController: UITableViewController, ItemDetailViewControllerDelegate {
    var items: [ChecklitItem]
    var editItemIndexPath: IndexPath?
    let dataFileName = "Checklist.plist"

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
        row2.text = "music"
        items.append(row2)
        super.init(coder: aDecoder)
        print("document directory path \(self.documentDirectory())")
        print("data file path \(self.dataFilePath())")
    }
    
    func documentDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func dataFilePath() -> URL {
        return documentDirectory().appendingPathComponent(dataFileName)
    }
    
    func saveChecklistItems() {
        let data = NSMutableData()
        let archiver = NSKeyedArchiver(forWritingWith: data)
        archiver.encode(items, forKey: "ChecklistItems")
        archiver.finishEncoding()
        data.write(to: dataFilePath(), atomically: true)
    }
    
    func itemDetailViewControllerDidCancel(_ controller: ItemDetailViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    func itemDetailViewController(_ controller: ItemDetailViewController, didFinishAdding item: ChecklitItem) {
       print("delegate invoke FinishAdding")
        let newRowIndex = items.count
        items.append(item)
        let indexPath = IndexPath(item: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
        
        saveChecklistItems()
        dismiss(animated: true, completion: nil)
    }
    
    func itemDetailViewController(_ controller: ItemDetailViewController, didFinishEditing item: ChecklitItem) {
//        items.index(of: item)
        if let indexPath = editItemIndexPath{
            if let cell = tableView.cellForRow(at: indexPath) {
                configText(for: cell, with: item)
                saveChecklistItems()
            }
        }
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func addItem() {
        
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
        saveChecklistItems()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddItem"{
            let navigationController = segue.destination as! UINavigationController
            let controller = navigationController.topViewController as! ItemDetailViewController
            controller.delegate = self
            editItemIndexPath = nil
        } else if segue.identifier == "EditItem" {
            let navigationController = segue.destination as! UINavigationController
            let controller = navigationController.topViewController as! ItemDetailViewController
            controller.title = "EditItem"
            controller.delegate = self
            if let indexPath = tableView.indexPath(for: sender as! UITableViewCell) {
                editItemIndexPath = indexPath
                controller.itemToEdit = items[indexPath.row]
            }
        }
    }
    
    func configText(for cell: UITableViewCell, with item: ChecklitItem) {
//        let item = items[indexPath.row]
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = item.text

    }
    
    func configCheckmark(for cell: UITableViewCell, with item: ChecklitItem) {
//        let item = items[indexPath.row]
        let label = cell.viewWithTag(1001) as! UILabel
        if item.checked {
            label.text = "✓"
//            cell.accessoryType = .checkmark
        } else {
            label.text = "" 
//            cell.accessoryType = .none
        }
    }

}

