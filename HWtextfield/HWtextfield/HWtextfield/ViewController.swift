//
//  ViewController.swift
//  HWtextfield
//
//  Created by Карина Дьячина on 25.01.24.
//

import UIKit

protocol UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool
        }
//protocol SendMessageDelegate: AnyObject {
//    func recieveString(text: String)
//}

class ViewController: UIViewController, UIGestureRecognizerDelegate /*SendMessageDelegate*/ {
//    func recieveString(text: String) {
//    }
    
    @nonobjc func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    

    let label = UILabel()
    let textField = UITextField()
    let button: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.backgroundColor = .systemBlue
        button.setTitle("button", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.frame = CGRect(x: 80, y: 250, width: 100, height: 40)
        return button
    }()
    var recieveText: String = ""
 //   weak var delegate: SendMessageDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(self.hideKeyboardOnSwipeDown))
          //  swipeDown.delegate = self
            swipeDown.direction =  UISwipeGestureRecognizer.Direction.down
                self.view.addGestureRecognizer(swipeDown)

        view.backgroundColor = .white
        setupAll()
        view.addSubview(button)
        button.addTarget(self, action: #selector(myButtonTapped), for: .touchUpInside)
    }
    
    func setupAll() {
        label.text = "label"
        label.textColor = .black
        label.backgroundColor = UIColor(red: 128/255, green: 128/255, blue: 128/255, alpha: 0.5)
        label.frame = CGRect(x: 80, y: 150, width: 250, height: 40)
        
        textField.text = "textfield"
        textField.textColor = .black
        textField.backgroundColor = UIColor(red: 128/255, green: 128/255, blue: 128/255, alpha: 0.5)
        textField.keyboardType = .default
        textField.textAlignment = .left
        textField.autocorrectionType = .yes
        textField.font = UIFont(name: "Optima", size: 18)
        textField.frame = CGRect(x: 80, y: 200, width: 250, height: 40)
        
        
        view.addSubview(label)
        view.addSubview(textField)
    }
    @objc func myButtonTapped() {
        recieveText = "\(textField.text ?? "text field is empty")"
      //  delegate?.recieveString(text: recieveText)
        self.label.text = recieveText
        textField.text = .none
    }
    
    @objc func hideKeyboardOnSwipeDown() {
            view.endEditing(true)
        }
//    func sendString() {
//        let message = recieveText
//        delegate?.recieveString(text: recieveText)
//    }
}

