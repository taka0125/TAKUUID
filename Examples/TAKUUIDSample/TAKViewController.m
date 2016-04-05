#import "TAKViewController.h"
#import <TAKUUID/TAKUUID.h>

@implementation TAKViewController

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

- (IBAction)updateAttrAccessible {
  NSString *UUIDString = [[TAKUUIDStorage sharedInstance] findOrCreate];
  NSLog(@"UUID = %@", UUIDString);
  NSLog(@"lastErrorStatus = %d", (int)[TAKUUIDStorage sharedInstance].lastErrorStatus);
  
  [[TAKUUIDStorage sharedInstance] updateAttrAccessible];
  
  UUIDString = [[TAKUUIDStorage sharedInstance] findOrCreate];
  NSLog(@"UUID = %@", UUIDString);
}

@end
