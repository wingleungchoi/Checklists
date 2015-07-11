//
//  Checklist.swift
//  Checklists
//
//  Created by Wing LeungCHOI on 11/7/15.
//  Copyright (c) 2015 WingLeung CHOI. All rights reserved.
//

import UIKit

class Checklist: NSObject {
    var name = ""
    var items: [ChecklistItem] = [ChecklistItem]()
    init(name: String){
        self.name = name
        super.init()
    }
}
