//
//  KeyboardViewController.swift
//

import UIKit

class KeyboardViewController: UIInputViewController {
  
  @IBOutlet weak var nextKeyboardButton: UIButton!
  @IBOutlet weak var aButton: UIButton!
  @IBOutlet weak var delButton: UIButton!
  @IBOutlet weak var takoButton: UIButton!
  
  override func updateViewConstraints() {
    super.updateViewConstraints()
    
    // Add custom view sizing constraints here
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Perform custom UI setup here
    
    // 'Next Keyboard' Button
    self.nextKeyboardButton = UIButton.buttonWithType(.System) as UIButton
    
    self.nextKeyboardButton.setTitle(NSLocalizedString("Next Keyboard", comment: "Title for 'Next Keyboard' button"), forState: .Normal)
    self.nextKeyboardButton.sizeToFit()
    self.nextKeyboardButton.setTranslatesAutoresizingMaskIntoConstraints(false)
    
    self.nextKeyboardButton.addTarget(self, action: "advanceToNextInputMode", forControlEvents: .TouchUpInside)
    
    self.view.addSubview(self.nextKeyboardButton)
    
    var nextKeyboardButtonLeftSideConstraint = NSLayoutConstraint(item: self.nextKeyboardButton, attribute: .Left, relatedBy: .Equal, toItem: self.view, attribute: .Left, multiplier: 1.0, constant: 0.0)
    var nextKeyboardButtonBottomConstraint = NSLayoutConstraint(item: self.nextKeyboardButton, attribute: .Bottom, relatedBy: .Equal, toItem: self.view, attribute: .Bottom, multiplier: 1.0, constant: 0.0)
    self.view.addConstraints([nextKeyboardButtonLeftSideConstraint, nextKeyboardButtonBottomConstraint])
    
    // 'a' Button
    self.aButton = UIButton.buttonWithType(.System) as UIButton
    
    self.aButton.setTitle(NSLocalizedString("a", comment: "Title for 'a' button"), forState: .Normal)
    self.aButton.sizeToFit()
    self.aButton.setTranslatesAutoresizingMaskIntoConstraints(false)
    self.aButton.addTarget(self, action: "insert", forControlEvents: .TouchUpInside)
    self.view.addSubview(self.aButton)
    var aButtonRightSideConstraint = NSLayoutConstraint(item: self.aButton, attribute: .Right, relatedBy: .Equal, toItem: self.view, attribute: .Right, multiplier: 1.0, constant: 0.0)
    var aButtonTopSideConstraint = NSLayoutConstraint(item: self.aButton, attribute: .Top, relatedBy: .Equal, toItem: self.view, attribute: .Top, multiplier: 1.0, constant: 0.0)
    self.view.addConstraints([aButtonRightSideConstraint, aButtonTopSideConstraint])
    
    // 'Del' Button
    self.delButton = UIButton.buttonWithType(.System) as UIButton
    
    self.delButton.setTitle(NSLocalizedString("Del", comment: "Title for 'del' button"), forState: .Normal)
    self.delButton.sizeToFit()
    self.delButton.setTranslatesAutoresizingMaskIntoConstraints(false)
    self.delButton.addTarget(self, action: "deleteBackward", forControlEvents: .TouchUpInside)
    self.view.addSubview(self.delButton)
    var delButtonLeftSideConstraint = NSLayoutConstraint(item: self.delButton, attribute: .Left, relatedBy: .Equal, toItem: self.view, attribute: .Left, multiplier: 1.0, constant: 0.0)
    var delButtonTopSideConstraint = NSLayoutConstraint(item: self.delButton, attribute: .Top, relatedBy: .Equal, toItem: self.view, attribute: .Top, multiplier: 1.0, constant: 0.0)
    self.view.addConstraints([delButtonLeftSideConstraint, delButtonTopSideConstraint])
    
    // 'tako' Button
    self.takoButton = UIButton.buttonWithType(.System) as UIButton
    
    self.takoButton.setTitle(NSLocalizedString("たこ", comment: "Title for 'たこ' button"), forState: .Normal)
    self.takoButton.sizeToFit()
    self.takoButton.setTranslatesAutoresizingMaskIntoConstraints(false)
    self.takoButton.addTarget(self, action: "insertTako", forControlEvents: .TouchUpInside)
    self.view.addSubview(self.takoButton)
    var takoButtonRightSideConstraint = NSLayoutConstraint(item: self.takoButton, attribute: .Right, relatedBy: .Equal, toItem: self.view, attribute: .Right, multiplier: 1.0, constant: 0.0)
    var takoButtonBottomSideConstraint = NSLayoutConstraint(item: self.takoButton, attribute: .Bottom, relatedBy: .Equal, toItem: self.view, attribute: .Bottom, multiplier: 1.0, constant: 0.0)
    self.view.addConstraints([takoButtonRightSideConstraint, takoButtonBottomSideConstraint])
    
  }
  
  func insert() {
    var proxy = textDocumentProxy as UITextDocumentProxy
    proxy.insertText("a")
  }
  
  func insertTako() {
    var proxy = textDocumentProxy as UITextDocumentProxy
    proxy.insertText("たこ")
  }
  
  func deleteBackward() {
    var proxy = textDocumentProxy as UITextDocumentProxy
    proxy.deleteBackward()
  }
  
  override func advanceToNextInputMode() {
    super.advanceToNextInputMode()
  }
  
  override func textWillChange(textInput: UITextInput) {
    // The app is about to change the document's contents. Perform any preparation here.
  }
  
  override func textDidChange(textInput: UITextInput) {
    // The app has just changed the document's contents, the document context has been updated.
    
    var textColor: UIColor
    var proxy = self.textDocumentProxy as UITextDocumentProxy
    if proxy.keyboardAppearance == UIKeyboardAppearance.Dark {
      textColor = UIColor.whiteColor()
    } else {
      textColor = UIColor.blackColor()
    }
    self.nextKeyboardButton.setTitleColor(textColor, forState: .Normal)
  }
}
