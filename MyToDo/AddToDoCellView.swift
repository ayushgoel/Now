//
//  AddToDoCellView.swift
//  MyToDo
//
//  Created by Ayush Goel on 04/07/16.
//  Copyright © 2016 Ayush Goel. All rights reserved.
//

import Cocoa

class AddToDoCellView: NSTableCellView {
  @IBAction func didCompleteAddingTask(sender: NSTextField) {
    let newTask = [TaskData(taskString: sender.stringValue, time: 0)]
    sender.stringValue = ""
    if let allTasks = dataSaver.allTasks() {
      dataSaver.saveTasks(allTasks + newTask)
    } else {
      dataSaver.saveTasks(newTask)
    }
  }
}
