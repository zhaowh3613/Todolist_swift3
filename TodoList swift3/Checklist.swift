//
//  CheckList.swift
//  TodoList swift3
//
//  Created by Wenhui Zhao on 2017/3/14.
//  Copyright © 2017年 Wenhui Zhao. All rights reserved.
//

import Foundation
import UIKit

class Checklist: NSObject {
    var name = ""
    override init() {
        super.init()
    }
    init(name: String) {
        self.name = name
        super.init()
    }
}
