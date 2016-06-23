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

  var statusItem: NSStatusItem?

  func applicationDidFinishLaunching(aNotification: NSNotification) {
    // Insert code here to initialize your application
    statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(NSVariableStatusItemLength)
    statusItem?.button?.image = NSImage(named: "todo-icon")
    statusItem?.menu = ({
      let menu = NSMenu(title: "Menu Title")
      let infoMenuItem = NSMenuItem(title: "Todo's", action: #selector(itemClicked), keyEquivalent: "itemClicked")
      infoMenuItem.enabled = true
      menu.addItem(infoMenuItem)
      return menu
    })()

  }

  func applicationWillTerminate(aNotification: NSNotification) {
    // Insert code here to tear down your application
  }

  func itemClicked() {
    print("Item clicked")
  }

}

