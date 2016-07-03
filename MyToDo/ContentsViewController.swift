//
//  ContentsViewController.swift
//  MyToDo
//
//  Created by Ayush Goel on 03/07/16.
//  Copyright © 2016 Ayush Goel. All rights reserved.
//

import Cocoa

class ContentsViewController: NSViewController {

  @IBOutlet weak var tasksTableView: NSTableView!

  var tasks: [TaskData] {
    guard let allTasks = dataSaver.allTasks() else {
      return []
    }
    return allTasks
  }

  override func viewDidAppear() {
    super.viewDidAppear()
    NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(tasksUpdated), name: "TasksUpdated", object: nil)
  }

  func tasksUpdated(notification: NSNotification) {
    tasksTableView.reloadData()
  }

  @IBAction func quitButtonClicked(sender: NSButton) {
    NSApplication.sharedApplication().terminate(sender)
  }
}

extension ContentsViewController: NSTableViewDataSource {
  func numberOfRowsInTableView(tableView: NSTableView) -> Int {
    return tasks.count + 1
  }
}

extension ContentsViewController: NSTableViewDelegate {
  func tableView(tableView: NSTableView, viewForTableColumn tableColumn: NSTableColumn?, row: Int) -> NSView? {

    if row == tasks.count {
      guard let view = tableView.makeViewWithIdentifier("AddToDoCellView", owner: self) as? AddToDoCellView else {
        return nil
      }
      return view
    }

    guard let view = tableView.makeViewWithIdentifier("ToDoCell", owner: self) as? ToDoCellView else {
      assertionFailure()
      return nil
    }
    view.taskName = tasks[row].taskString
    view.time = "\(tasks[row].time)"
    return view
  }
}
