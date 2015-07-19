//
//  ChecklistItem.swift
//  Checklists
//
//  Created by Wing LeungCHOI on 28/6/15.
//  Copyright (c) 2015 WingLeung CHOI. All rights reserved.
//

import Foundation
class ChecklistItem: NSObject, NSCoding {
    var text = ""
    var checked = false
    var dueDate = NSDate()
    var shouldRemind = false
    var itemID: Int
    func toggleChecked() {
        checked = !checked
    }
    override init() {
        itemID = DataModel.nextChecklistItemID()
        super.init()
    }
    required init(coder aDecoder: NSCoder){
        text = aDecoder.decodeObjectForKey("Text") as! String
        checked = aDecoder.decodeBoolForKey("Checked") as Bool
        dueDate = aDecoder.decodeObjectForKey("DueDate") as! NSDate
        shouldRemind = aDecoder.decodeBoolForKey("ShouldRemind")
        itemID = aDecoder.decodeIntegerForKey("ItemID")
        super.init()
    }
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(text, forKey: "Text")
        aCoder.encodeBool(checked, forKey: "Checked")
        aCoder.encodeObject(dueDate, forKey: "DueDate")
        aCoder.encodeBool(shouldRemind, forKey: "ShouldRemin")
        aCoder.encodeInteger(itemID, forKey: "ItemID")
    }
}
