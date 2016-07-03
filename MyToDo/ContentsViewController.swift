//
//  ContentsViewController.swift
//  MyToDo
//
//  Created by Ayush Goel on 03/07/16.
//  Copyright © 2016 Ayush Goel. All rights reserved.
//

import Cocoa

class ContentsViewController: NSViewController {
  let data = ["asd", "asd2", "asd3", "asd4", "asd5"]
}

extension ContentsViewController: NSTableViewDataSource {
  func numberOfRowsInTableView(tableView: NSTableView) -> Int {
    return 5
  }
}

extension ContentsViewController: NSTableViewDelegate {
  func tableView(tableView: NSTableView, viewForTableColumn tableColumn: NSTableColumn?, row: Int) -> NSView? {
    guard let view = tableView.makeViewWithIdentifier("ToDoCell", owner: self) as? ToDoCellView else {
      assertionFailure()
      return nil
    }
    view.taskName = data[row]
    view.time = "20"
    return view
  }
}
