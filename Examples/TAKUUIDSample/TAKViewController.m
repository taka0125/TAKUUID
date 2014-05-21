#import "TAKViewController.h"
#import <TAKUUID/TAKUUID.h>

@implementation TAKViewController

- (IBAction)remove {
  BOOL result = [[TAKUUIDStorage sharedInstance] remove];
  NSLog(@"remove => %d", result);
}

- (IBAction)findOrCreate {
  NSString *UUIDString = [[TAKUUIDStorage sharedInstance] findOrCreate];
  NSLog(@"UUID = %@", UUIDString);
}

- (IBAction)renew {
  NSString *UUIDString = [[TAKUUIDStorage sharedInstance] renew];
  NSLog(@"UUID = %@", UUIDString);
}

@end
