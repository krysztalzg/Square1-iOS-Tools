//
//  ViewController.swift
//  Square1ToolsApp
//
//  Created by Ginés Navarro Fernández on 21/01/2019.
//  Copyright © 2019 Ginés Navarro Fernández. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  // MARK: - Private.
  
  func goToKeyboard() {
    performSegue(withIdentifier: "toKeyboard", sender: nil)
  }
  
  func goToStoryboard() {
    performSegue(withIdentifier: "toStoryboard", sender: nil)
  }
  
  // MARK: - TableView DataSource.
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 2
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as UITableViewCell
    
    switch indexPath.row {
    case 0:
      cell.textLabel?.text = "Keyboard"
    case 1:
      cell.textLabel?.text = "Storyboard"
    default:
      break
    }
    
    return cell
  }
  
  
  // MARK: - TableView Delegate.
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    defer {
      tableView.deselectRow(at: indexPath, animated: true)
    }
    
    switch indexPath.row {
    case 0:
      goToKeyboard()
    case 1:
      goToStoryboard()
    default:
      break
    }
  }
}
