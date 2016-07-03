//
//  ContentsViewController.swift
//  MyToDo
//
//  Created by Ayush Goel on 03/07/16.
//  Copyright © 2016 Ayush Goel. All rights reserved.
//

import Cocoa

class ContentsViewController: NSViewController {
  var tasks: [TaskData] {
    guard let allTasks = dataSaver.allTasks() else {
      return []
    }
    return allTasks
  }

  @IBAction func quitButtonClicked(sender: NSButton) {
    NSApplication.sharedApplication().terminate(sender)
  }
}

extension ContentsViewController: NSTableViewDataSource {
  func numberOfRowsInTableView(tableView: NSTableView) -> Int {
    return tasks.count
  }
}

extension ContentsViewController: NSTableViewDelegate {
  func tableView(tableView: NSTableView, viewForTableColumn tableColumn: NSTableColumn?, row: Int) -> NSView? {
    guard let view = tableView.makeViewWithIdentifier("ToDoCell", owner: self) as? ToDoCellView else {
      assertionFailure()
      return nil
    }
    view.taskName = tasks[row].taskString
    view.time = "\(tasks[row].time)"
    return view
  }
}
