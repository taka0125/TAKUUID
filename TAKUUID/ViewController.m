//
//  ViewController.m
//  TAKUUID
//
//  Created by Takahiro Ooishi on 2014/11/08.
//  Copyright (c) 2014年 Takahiro Ooishi. All rights reserved.
//

#import "ViewController.h"
#import <TAKUUID/TAKUUID.h>

@implementation ViewController

- (void)viewDidLoad {
  NSString *accessGroup = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"KeychainAccessGroup"];
  [TAKUUIDStorage sharedInstance].accessGroup = accessGroup;
}

- (IBAction)remove {
  BOOL result = [[TAKUUIDStorage sharedInstance] remove];
  NSLog(@"remove => %d", result);
  NSLog(@"lastErrorStatus = %d", (int)[TAKUUIDStorage sharedInstance].lastErrorStatus);
}

- (IBAction)findOrCreate {
  NSString *UUIDString = [[TAKUUIDStorage sharedInstance] findOrCreate];
  NSLog(@"UUID = %@", UUIDString);
  NSLog(@"lastErrorStatus = %d", (int)[TAKUUIDStorage sharedInstance].lastErrorStatus);
}

- (IBAction)renew {
  NSString *UUIDString = [[TAKUUIDStorage sharedInstance] renew];
  NSLog(@"UUID = %@", UUIDString);
  NSLog(@"lastErrorStatus = %d", (int)[TAKUUIDStorage sharedInstance].lastErrorStatus);
}

@end
