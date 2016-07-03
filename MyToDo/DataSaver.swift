//
//  DataSaver.swift
//  MyToDo
//
//  Created by Ayush Goel on 03/07/16.
//  Copyright © 2016 Ayush Goel. All rights reserved.
//

import Cocoa

let dataSaver = (NSApplication.sharedApplication().delegate as! AppDelegate).dataSaver

class DataSaver {
  private func getData(key: String) -> AnyObject? {
    return NSUserDefaults.standardUserDefaults().objectForKey(key)
  }

  private func saveData(key: String, data: AnyObject) {
    NSUserDefaults.standardUserDefaults().setObject(data, forKey: key)
  }
}

extension DataSaver {
  var taskDataKey: String {
    return "all-tasks"
  }

  func allTasks() -> [TaskData]? {
    guard let readTasks = getData(taskDataKey) as? [AnyObject] else {
      return nil
    }
    let tasks = readTasks.map { (readTask) in
      return try! TaskData.createSelf(readTask)
    }
    return tasks
  }

  func saveTasks(tasks: [TaskData]) {
    let writeableTasks = tasks.map { (task) in
      task.writableForm()
    }
    saveData(taskDataKey, data: writeableTasks)
  }
}
