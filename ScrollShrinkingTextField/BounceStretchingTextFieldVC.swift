//
//  BounceStretchingTextFieldVC.swift
//  ScrollShrinkingTextField
//
//  Created by Moayad on 3/15/18.
//  Copyright © 2018 Mo7ib. All rights reserved.
//

import UIKit

class BounceStretchingTextFieldVC : UIViewController {
  
  @IBOutlet var txtInput: UITextField!
  @IBOutlet var tableview: UITableView!
  
  // outlet to the text field height
  @IBOutlet var constraintTextFieldHeight: NSLayoutConstraint!
  
  // The maximum height for our text field
  let MAXIMUM_HEIGHT : Float = 250
  // The minimum height for our text field
  let MINIMUM_HEIGHT : Float = 100
  
  
  override func viewDidLoad() {
    // set the Height to maximium
    constraintTextFieldHeight.constant = CGFloat(MAXIMUM_HEIGHT)
    
    // shift the table content down by the maximum possible height
    tableview.contentInset = UIEdgeInsetsMake(constraintTextFieldHeight.constant, 0, 0, 0 )
  }
  
}


extension BounceStretchingTextFieldVC : UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 20
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
    cell?.textLabel?.text = "Item #\(indexPath.row)"
    return cell!
  }
}


extension BounceStretchingTextFieldVC : UITableViewDelegate {
  
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    // determine the new height based on the scroll offset
    var newHeight = -Float(scrollView.contentOffset.y)
    
    print("newHeight     = \(newHeight)")
    print("contentOffset = \(scrollView.contentOffset.y)")
  
    // avoid new height being less than minimum
    newHeight = max(newHeight, MINIMUM_HEIGHT)
    
    print("constraint    = \(newHeight)")
    
    print("--------------------------")
    
    // update the height constraint value
    constraintTextFieldHeight.constant = CGFloat(newHeight)
  }
  
}
