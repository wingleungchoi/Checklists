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
    var iconName:String
    required init(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObjectForKey("Name") as! String
        items = aDecoder.decodeObjectForKey("Items") as! [ChecklistItem]
        iconName = aDecoder.decodeObjectForKey("IconName") as! String
        super.init()
    }
    init(name: String, iconName: String){
        self.name = name
        self.iconName = iconName
        super.init()
    }
    convenience init(name: String){
        self.init(name: name, iconName: "No Icon")
    }
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: "Name")
        aCoder.encodeObject(items, forKey: "Items")
        aCoder.encodeObject(iconName, forKey: "IconName")
    }
    
    func countUncheckedItems() -> Int {
        var count = 0
        for item in items {
            if !item.checked {
                count += 1
            }
        }
        return count
    }
}
