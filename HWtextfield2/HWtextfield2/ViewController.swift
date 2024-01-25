//
//  ViewController.swift
//  HWtextfield2
//
//  Created by Карина Дьячина on 25.01.24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        registerForKeyboardNotifications()
    }
    deinit {
           removeKeyboardNotifications()
       }

       func registerForKeyboardNotifications() {
           NotificationCenter.default.addObserver(self, selector: #selector(kbWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
           NotificationCenter.default.addObserver(self, selector: #selector(kbWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
       }
       
       func removeKeyboardNotifications() {
           NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
           NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
       }
       
    @objc func kbWillShow(_ notification: Notification) {
           let userInfo = notification.userInfo
           let kbFrameSize = (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
           scrollView.contentOffset = CGPoint(x: 0, y: kbFrameSize.height)
       }
       
    @objc func kbWillHide() {
           scrollView.contentOffset = CGPoint.zero
       }
    
    
    @IBAction func buttonTapped(_ sender: Any) {
        textField.resignFirstResponder()
        label.text = textField.text
        textField.text = nil
        
    }
    
}

