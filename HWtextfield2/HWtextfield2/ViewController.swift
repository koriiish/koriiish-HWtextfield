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
        NotificationCenter.default.addObserver(self, selector: #selector(keyboard), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func removeKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    @objc func keyboard(_ notification: Notification) {
                guard let keyboardValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
//        if let keyboardValue = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
//            let keyboardHeight = keyboardValue.height
            if notification.name == UIResponder.keyboardWillShowNotification {
                scrollView.contentOffset = CGPoint(x: 0, y: keyboardValue.cgRectValue.height / 2)
            }
            if notification.name == UIResponder.keyboardWillHideNotification {
                scrollView.contentOffset = CGPoint(x: 0, y: 0)
            }
        }
//            @objc func kbWillShow(_ notification: Notification) {
//                   let userInfo = notification.userInfo
//                   let kbFrameSize = (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
//                scrollView.contentOffset = CGPoint(x: 0, y:  textField.frame + kbFrameSize.height / 2)
//               }
//        
//            @objc func kbWillHide() {
//                   scrollView.contentOffset = CGPoint.zero
//               }
        
        
        @objc func buttonTapped(_ sender: Any) {
            textField.resignFirstResponder()
            label.text = textField.text
            textField.text = nil
            
        }
        
    }
    

