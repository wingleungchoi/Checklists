//
//  AddItemTableViewController.swift
//  Checklists
//
//  Created by Wing LeungCHOI on 1/7/15.
//  Copyright (c) 2015 WingLeung CHOI. All rights reserved.
//

import UIKit

protocol AddItemViewControllerDelegate: class {
    func addItemViewControllerDidCancel(controller: AddItemViewController)
    func addItemViewController(controller: AddItemViewController, didFinishAddingItem item: ChecklistItem)
}

class AddItemViewController: UITableViewController, UITextFieldDelegate {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    
    weak var delegate: AddItemViewControllerDelegate?
    
    @IBAction func cancel() {
        println("i try to send addItemViewControllerDidCancel ")
        delegate?.addItemViewControllerDidCancel(self)
         println("i tried to send addItemViewControllerDidCancel ")
        //dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func done() {
        let item = ChecklistItem()
        item.text = textField.text
        item.checked = false
        delegate?.addItemViewController(self, didFinishAddingItem: item)
        //println("Contents of the text field: \(textField.text)")
        //dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func tableView(tableView: UITableView,
        willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
            return nil
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
}
