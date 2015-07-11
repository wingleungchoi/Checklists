//
//  Checklist.swift
//  Checklists
//
//  Created by Wing LeungCHOI on 11/7/15.
//  Copyright (c) 2015 WingLeung CHOI. All rights reserved.
//

import UIKit

class Checklist: NSObject, NSCoding {
    var name = ""
    var items: [ChecklistItem] = [ChecklistItem]()
    required init(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObjectForKey("Name") as! String
        items = aDecoder.decodeObjectForKey("Items") as! [ChecklistItem]
        super.init()
    }
    init(name: String){
        self.name = name
        super.init()
    }
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: "Name")
        aCoder.encodeObject(items, forKey: "Items")
    }
}
