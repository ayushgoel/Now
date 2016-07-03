//
//  ToDoCellView.swift
//  MyToDo
//
//  Created by Ayush Goel on 03/07/16.
//  Copyright © 2016 Ayush Goel. All rights reserved.
//

import Cocoa

class ToDoCellView: NSTableCellView {
  @IBOutlet private var taskNameLabel: NSTextField!
  @IBOutlet private var timeLabel: NSTextField!

  var taskName: String {
    get {
      return taskNameLabel.stringValue
    } set(newValue) {
      taskNameLabel.stringValue = newValue
    }
  }

  var time: String {
    get {
      return timeLabel.stringValue
    } set(newValue) {
      timeLabel.stringValue = newValue
    }
  }
}
