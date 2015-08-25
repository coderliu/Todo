//
//  DetailViewController.swift
//  Todo
//
//  Created by 刘岳 on 15/6/14.
//  Copyright (c) 2015年 刘岳. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var childButton: UIButton!
    @IBOutlet weak var phoneButton: UIButton!
    @IBOutlet weak var travelButton: UIButton!
    @IBOutlet weak var shoppingCartButton: UIButton!
    @IBOutlet weak var todoItem: UITextField!
    @IBOutlet weak var todoDate: UIDatePicker!
    var image = ""
    var todo: TodoModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        todoItem.delegate = self
        
        if todo == nil {
            navigationItem.title = "Add"
            println("todo to edit is nil")
        }
        else {
            navigationItem.title = "Edit"
            let selectedImage = todo?.image
            switch selectedImage! {
            case "selected-child":
                childButton.selected = true
            case "selected-phone":
                phoneButton.selected = true
            case "selected-plane":
                travelButton.selected = true
            case "selected-shopping-cart":
                shoppingCartButton.selected = true
            default: break
            }
            image = selectedImage!
            todoItem.text = todo?.title
            todoDate.setDate((todo?.date)!, animated: false)
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func resetButtons() {
        childButton.selected = false
        phoneButton.selected = false
        travelButton.selected = false
        shoppingCartButton.selected = false
    }
    @IBAction func childTapped(sender: AnyObject) {
        resetButtons()
        childButton.selected = true
        image = "selected-child"
    }
    @IBAction func phoneTapped(sender: AnyObject) {
        resetButtons()
        phoneButton.selected = true
        image = "selected-phone"
    }
    @IBAction func travelTapped(sender: AnyObject) {
        resetButtons()
        travelButton.selected = true
        image = "selected-plane"
    }
    @IBAction func shoppingCartTapped(sender: AnyObject) {
        resetButtons()
        shoppingCartButton.selected = true
        image = "selected-shopping-cart"
    }
    
    @IBAction func okTapped(sender: AnyObject) {
        if "" == image {
            image = "selected-child"
        }
        if todo == nil {
            let uuid = NSUUID().UUIDString
            let todo = TodoModel(id: uuid, image: image, title: todoItem.text, date: todoDate.date)
            todos.append(todo)
        }
        else {
            todo?.image = image
            todo?.title = todoItem.text
            todo?.date = todoDate.date
        }
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
        todoItem.resignFirstResponder()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
