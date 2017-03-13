//
//  Checklistitem.swift
//  TodoList swift3
//
//  Created by Wenhui Zhao on 2017/3/8.
//  Copyright © 2017年 Wenhui Zhao. All rights reserved.
//

import Foundation
class ChecklitItem: NSObject,NSCoding {
    func encode(with aCoder: NSCoder) {
        aCoder.encode(text, forKey: "Text")
        aCoder.encode(checked, forKey: "Checked")
    }
    
    required init?(coder aDecoder: NSCoder) {
        text = aDecoder.decodeObject(forKey: "Text") as! String
        checked = (aDecoder.decodeObject(forKey: "Cheecked") != nil)
        super.init()
    }
    
    override init() {
        super.init()
    }
    
    var text = ""
    var checked = false
    func toggleChecked() {
        checked = !checked
    }
}
