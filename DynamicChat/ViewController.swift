//
//  ViewController.swift
//  DynamicChat
//
//  Created by Shubham Kapoor on 27/05/2019.
//  Copyright © 2019 Shubham Kapoor. All rights reserved.
//

import UIKit

enum ChatActionType {
    case buttons
    case images
    case meter
}

enum ChatResponseType {
    case question
    case answer
}

typealias chatResponse = (ChatResponseType, String)

class ViewController: UIViewController {

    //    MARK:- IBOutlets
    @IBOutlet weak var keyboardBottomAnchor: NSLayoutConstraint!
    @IBOutlet weak var questionTextField: UITextField!
    
    //    MARK:- Properties
    var chatArray = [Int: chatResponse]()
    var controlType: ChatActionType?
    
    //    MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    //    MARK:- IBActions
    @IBAction func sendButtonAction(_ sender: Any) {
        if questionTextField.text != "" {
            print(questionTextField.text!)
            questionTextField.resignFirstResponder()
        }
    }
    
    //    MARK:- Custom Methods
    @objc private func keyboardWillShow(_ notification: Notification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            keyboardBottomAnchor.constant = keyboardHeight - 20.0
            
            let duration = notification.userInfo![UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
            self.view.setNeedsLayout()
            self.view.setNeedsUpdateConstraints()
            
            UIView.animate(withDuration: duration, animations: {
                self.view.layoutIfNeeded()
            })
        }
    }
    
    @objc private func keyboardWillHide(_ notification: Notification) {
        
            keyboardBottomAnchor.constant = 20.0
            let duration = notification.userInfo![UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
            self.view.setNeedsLayout()
            self.view.setNeedsUpdateConstraints()
            
            UIView.animate(withDuration: duration, animations: {
                self.view.layoutIfNeeded()
            })
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let chatCell = tableView.dequeueReusableCell(withIdentifier: "ChatTableViewCell", for: indexPath) as! ChatTableViewCell
        
        return chatCell
    }
}

