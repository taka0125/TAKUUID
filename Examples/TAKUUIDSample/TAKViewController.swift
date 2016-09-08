//
//  TAKViewController.swift
//
//  Created by Takahiro Oishi
//  Copyright (c) 2016年 Takahiro Ooishi. All rights reserved.
//

import UIKit

final class TAKViewController: UIViewController {
  @IBAction func remove() {
    let result = TAKUUIDStorage.sharedInstance().remove()
    print("remove = \(result)")
    print("lastErrorStatus = \(TAKUUIDStorage.sharedInstance().lastErrorStatus)")
  }
  
  @IBAction func findOrCreate() {
    let uuid = TAKUUIDStorage.sharedInstance().findOrCreate()
    print("uuid = \(uuid)")
    print("lastErrorStatus = \(TAKUUIDStorage.sharedInstance().lastErrorStatus)")
  }
  
  @IBAction func renew() {
    let uuid = TAKUUIDStorage.sharedInstance().renew()
    print("uuid = \(uuid)")
    print("lastErrorStatus = \(TAKUUIDStorage.sharedInstance().lastErrorStatus)")
  }
  
  @IBAction func updateAttrAccessible() {
    var uuid = TAKUUIDStorage.sharedInstance().findOrCreate()
    print("uuid = \(uuid)")
    print("lastErrorStatus = \(TAKUUIDStorage.sharedInstance().lastErrorStatus)")
  
    TAKUUIDStorage.sharedInstance().updateAttrAccessible()
    
    uuid = TAKUUIDStorage.sharedInstance().findOrCreate()
    print("uuid = \(uuid)")
  }
}
