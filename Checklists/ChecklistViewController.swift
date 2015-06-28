//
//  ViewController.swift
//  Checklists
//
//  Created by Wing LeungCHOI on 13/6/15.
//  Copyright (c) 2015 WingLeung CHOI. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {
    
    var row0item: ChecklistItem
    var row1item: ChecklistItem
    var row2item: ChecklistItem
    var row3item: ChecklistItem
    var row4item: ChecklistItem
    
    required init(coder aDecoder: NSCoder) {
        row0item = ChecklistItem()
        row0item.text = "Walk the dog"
        row0item.checked = false
        
        row1item = ChecklistItem()
        row1item.text = "Brush my teeth"
        row1item.checked = true
        
        row2item = ChecklistItem()
        row2item.text = "Learn iOA development"
        row2item.checked = false
        
        row3item = ChecklistItem()
        row3item.text = "Soccer practice"
        row3item.checked = false
        
        row4item = ChecklistItem()
        row4item.text = "Eat ice cream"
        row4item.checked = true
        
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
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
         //let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as UITableViewCell
        
        let cell = tableView.dequeueReusableCellWithIdentifier("ChecklistItem", forIndexPath: indexPath) as! UITableViewCell
        
        let label = cell.viewWithTag(1000) as! UILabel
            
        if indexPath.row % 5 == 0 {
            label.text = row0item.text
        } else if indexPath.row % 5 == 1 {
            label.text = row1item.text
        } else if indexPath.row % 5 == 2 {
            label.text = row2item.text
        } else if indexPath.row % 5 == 3 {
            label.text = row3item.text
        } else if indexPath.row % 5 == 4 {
            label.text = row4item.text
        }
        
        configureCheckmarkForCell(cell, indexPath: indexPath)
            
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if let cell = tableView.cellForRowAtIndexPath(indexPath) {
            if indexPath.row == 0 {
                row0item.checked = !row0item.checked
            } else if indexPath.row == 1 {
                row1item.checked = !row1item.checked
            } else if indexPath.row == 2 {
                row2item.checked = !row2item.checked
            } else if indexPath.row == 3 {
                row3item.checked = !row3item.checked
            } else if indexPath.row == 4 {
                row4item.checked = !row4item.checked
            }
            
            configureCheckmarkForCell(cell, indexPath: indexPath)
        }
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    func configureCheckmarkForCell(cell: UITableViewCell, indexPath: NSIndexPath) {
        var isChecked = false
        
        if indexPath.row == 0 {
            isChecked = row0item.checked
        } else if indexPath.row == 1 {
            isChecked = row1item.checked
        } else if indexPath.row == 2 {
            isChecked = row2item.checked
        } else if indexPath.row == 3 {
            isChecked = row3item.checked
        } else if indexPath.row == 4 {
            isChecked  = row4item.checked
        }
        
        if isChecked {
            cell.accessoryType = .Checkmark
        } else {
            cell.accessoryType = .None
        }
    }
}

