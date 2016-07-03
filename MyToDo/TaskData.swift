//
//  TaskData.swift
//  MyToDo
//
//  Created by Ayush Goel on 03/07/16.
//  Copyright © 2016 Ayush Goel. All rights reserved.
//

import Foundation

final class TaskData: DefaultsWritable {
  let taskString: String
  let time: Int

  init(taskString: String, time: Int) {
    self.taskString = taskString
    self.time = time
  }

  func writableForm() -> AnyObject {
    return ["task": taskString,
            "time": "\(time)"]
  }

  class func createSelf(obj: AnyObject) throws -> TaskData {
    guard let dict = obj as? Dictionary<String, String> else {
      throw DefaultsWritableError.ReserializationFailure
    }
    return TaskData(taskString: dict["task"]!, time: Int(dict["time"]!)!)
  }
}
