//
//  ChecklistItem.swift
//  Checklists
//
//  Created by Wing LeungCHOI on 28/6/15.
//  Copyright (c) 2015 WingLeung CHOI. All rights reserved.
//

import Foundation
class ChecklistItem: NSObject {
    var text = ""
    var checked = false
    func toggleChecked() {
        checked = !checked
    }
}
