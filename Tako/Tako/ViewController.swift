//
//  ViewController.swift
//

import UIKit

class ViewController: UIViewController {
  
  var textView :UITextView!
  var textField :UITextField!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    textView = UITextView(frame: CGRect(x: 50.0, y: 50.0, width: 100.0, height: 50.0))
    textView.text = "ああああ"
    textView.editable = false
    
    textField = UITextField(frame: CGRect(x: 50.0, y: 100.0, width: 100.0, height: 50.0))
    textField.placeholder = "入力しろ"
    
    self.view.addSubview(textView)
    self.view.addSubview(textField)
  }
}

