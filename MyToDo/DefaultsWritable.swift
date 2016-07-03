//
//  DefaultsWritable.swift
//  MyToDo
//
//  Created by Ayush Goel on 03/07/16.
//  Copyright © 2016 Ayush Goel. All rights reserved.
//

import Foundation

enum DefaultsWritableError: ErrorType {
  case ReserializationFailure
}

protocol DefaultsWritable {
  func writableForm() -> AnyObject
  static func createSelf(obj: AnyObject) throws -> Self
}
