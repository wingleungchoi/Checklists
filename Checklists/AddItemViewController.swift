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
    func addItemViewController(controller: AddItemViewController, didFinishEditingItem item: ChecklistItem)
}

class AddItemViewController: UITableViewController, UITextFieldDelegate {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    
    weak var delegate: AddItemViewControllerDelegate?
    var itemToEdit: ChecklistItem?
    
    @IBAction func cancel() {
        println("i try to send addItemViewControllerDidCancel ")
        delegate?.addItemViewControllerDidCancel(self)
         println("i tried to send addItemViewControllerDidCancel ")
        //dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func done() {
        if let item = itemToEdit {
            item.text = textField.text
            delegate?.addItemViewController(self, didFinishEditingItem: item)
        } else {
        let item = ChecklistItem()
            item.text = textField.text
            item.checked = false
            delegate?.addItemViewController(self, didFinishAddingItem: item)
        }
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 44
        
        if let item = itemToEdit {
            title = "Edit Item"
            textField.text = item.text
            doneBarButton.enabled = true
        }
    }
}
