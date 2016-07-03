//
//  AppDelegate.swift
//  MyToDo
//
//  Created by Ayush Goel on 23/06/16.
//  Copyright © 2016 Ayush Goel. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

  let popover: NSPopover = {
    let po = NSPopover()
    po.contentViewController = ContentsViewController()
    return po
  }()

  let statusItem: NSStatusItem = {
    let statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(NSVariableStatusItemLength)
    statusItem.button?.image = NSImage(named: "todo-icon")
    statusItem.button?.alternateImage = NSImage(named: "todo-icon-on")
    statusItem.button?.setButtonType(.ToggleButton)
    return statusItem
  }()

  var isSelected: Bool = false

  let dataSaver: DataSaver = {
    return DataSaver()
  }()

  func applicationDidFinishLaunching(aNotification: NSNotification) {
    statusItem.button?.target = self
    statusItem.button?.action = #selector(itemClicked)
  }

  func applicationWillTerminate(aNotification: NSNotification) {
    // Insert code here to tear down your application
  }

  func itemClicked(sender: NSStatusBarButton) {
    isSelected = !isSelected
    if isSelected {
      popover.showRelativeToRect(NSRect(), ofView: sender, preferredEdge: .MaxY)
    } else {
      popover.performClose(sender)
    }
    print("Item clicked")
  }
}

