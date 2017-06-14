//
//  TAKViewController.swift
//
//  Created by Takahiro Oishi
//  Copyright (c) 2016年 Takahiro Ooishi. All rights reserved.
//

import UIKit

final class TAKViewController: UIViewController {
  override func viewDidLoad() {
    guard let accessGroup = Bundle.main.object(forInfoDictionaryKey: "KeychainAccessGroup") as? String else { return }
    TAKUUIDStorage.sharedInstance().accessGroup = accessGroup
    TAKUUIDStorage.sharedInstance().migrate()
  }
  
  @IBAction func remove() {
    let result = TAKUUIDStorage.sharedInstance().remove()
    print("remove = \(result)")
    print("lastErrorStatus = \(TAKUUIDStorage.sharedInstance().lastErrorStatus)")
  }
  
  @IBAction func findOrCreate() {
    guard let uuid = TAKUUIDStorage.sharedInstance().findOrCreate() else { return }
    print("uuid = \(uuid)")
    print("lastErrorStatus = \(TAKUUIDStorage.sharedInstance().lastErrorStatus)")
  }
  
  @IBAction func renew() {
    guard let uuid = TAKUUIDStorage.sharedInstance().renew() else { return }
    print("uuid = \(uuid)")
    print("lastErrorStatus = \(TAKUUIDStorage.sharedInstance().lastErrorStatus)")
  }
}
