//
//  ItemDetailViewController.swift
//  Checklists
//
//  Created by Wing LeungCHOI on 1/7/15.
//  Copyright (c) 2015 WingLeung CHOI. All rights reserved.
//

import UIKit

protocol ItemDetailViewControllerDelegate: class {
    func itemDetailViewControllerDidCancel(controller: ItemDetailViewController)
    func itemDetailViewController(controller: ItemDetailViewController, didFinishAddingItem item: ChecklistItem)
    func itemDetailViewController(controller: ItemDetailViewController, didFinishEditingItem item: ChecklistItem)
}

class ItemDetailViewController: UITableViewController, UITextFieldDelegate {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    @IBOutlet weak var shouldRemindSwitch: UISwitch!
    @IBOutlet weak var dueDateLabel: UILabel!
    
    weak var delegate: ItemDetailViewControllerDelegate?
    var itemToEdit: ChecklistItem?
    var dueDate = NSDate()
    
    @IBAction func cancel() {
        println("i try to send itemDetailViewControllerDidCancel ")
        delegate?.itemDetailViewControllerDidCancel(self)
         println("i tried to send itemDetailViewControllerDidCancel ")
        //dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func done() {
        if let item = itemToEdit {
            item.text = textField.text
            item.shouldRemind = shouldRemindSwitch.on
            item.dueDate = dueDate
            delegate?.itemDetailViewController(self, didFinishEditingItem: item)
        } else {
        let item = ChecklistItem()
            item.text = textField.text
            item.checked = false
            item.shouldRemind = shouldRemindSwitch.on
            item.dueDate = dueDate
            delegate?.itemDetailViewController(self, didFinishAddingItem: item)
        }
    }
    
    override func tableView(tableView: UITableView,
        willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
            if indexPath.section == 1{
                return indexPath
            } else {
                return nil
            }
    }
    
    override func viewWillAppear(anitmated: Bool) {
        super.viewWillAppear(anitmated)
        textField.becomeFirstResponder()
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        let oldText: NSString = textField.text
        let newText: NSString = oldText.stringByReplacingCharactersInRange(range, withString: string)
        doneBarButton.enabled = (newText.length > 0)
        
        return true
    }
    
    func updateDueDateLabel() {
        let formatter = NSDateFormatter()
        formatter.dateStyle = .MediumStyle
        formatter.dateStyle = .ShortStyle
        dueDateLabel.text = formatter.stringFromDate(dueDate)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 44
        
        if let item = itemToEdit {
            title = "Edit Item"
            textField.text = item.text
            doneBarButton.enabled = true
            shouldRemindSwitch.on = item.shouldRemind
            dueDate = item.dueDate
        }
        updateDueDateLabel()
    }
    
}
