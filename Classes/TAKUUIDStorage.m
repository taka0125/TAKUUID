//
//  TAKUUIDStorage.m
//  TAKUUID
//
//  Created by Takahiro Ooishi
//  Copyright (c) 2014 Takahiro Ooishi. All rights reserved.
//  Released under the MIT license.
//

#import "TAKUUIDStorage.h"

static NSString * const Account = @"TAKUUIDStorage/Account";

@interface TAKUUIDStorage ()

@property (nonatomic) OSStatus lastErrorStatus;

@end

@implementation TAKUUIDStorage

+ (nonnull instancetype)sharedInstance {
  static TAKUUIDStorage *_instance = nil;
  static dispatch_once_t oncePredicate;
  dispatch_once(&oncePredicate, ^{
    _instance = [[self alloc] init];
  });
  return _instance;
}

- (nullable NSString *)findOrCreate {
  self.lastErrorStatus = noErr;
  NSString *UUIDString = [self find];
  if (UUIDString) return UUIDString;
  return [self create];
}

- (BOOL)remove {
  self.lastErrorStatus = noErr;
  OSStatus status = SecItemDelete((__bridge CFDictionaryRef)[self queryForRemove]);
  return [self verifyStatusAndStoreLastError:status];
}

- (nullable NSString *)renew {
  self.lastErrorStatus = noErr;
  BOOL result = [self remove];
  if (result) return [self create];
  return nil;
}

- (BOOL)migrate {
  self.lastErrorStatus = noErr;

  NSString *UUIDString = [self find];
  if (!UUIDString) return NO;

  BOOL result = [self remove];
  if (!result) return NO;

  OSStatus status = SecItemAdd((__bridge CFDictionaryRef)[self queryForCreate:UUIDString], NULL);
  return [self verifyStatusAndStoreLastError:status];
}

#pragma mark - PrivateMethods

- (NSDictionary *)queryForFind {
  return @{
           (__bridge id)kSecClass: (__bridge id)kSecClassGenericPassword,
           (__bridge id)kSecAttrAccount: Account,
           (__bridge id)kSecAttrService: [NSBundle mainBundle].bundleIdentifier,
           (__bridge id)kSecReturnData: (__bridge id)kCFBooleanTrue
           };
}

- (NSDictionary *)queryForCreate:(NSString *)UUIDString {
  NSMutableDictionary *items = @{
    (__bridge id)kSecClass: (__bridge id)kSecClassGenericPassword,
    (__bridge id)kSecAttrAccount: Account,
    (__bridge id)kSecAttrAccessible: (__bridge id)kSecAttrAccessibleAfterFirstUnlock,
    (__bridge id)kSecValueData: [UUIDString dataUsingEncoding:NSUTF8StringEncoding],
    (__bridge id)kSecAttrDescription: @"",
    (__bridge id)kSecAttrService: [NSBundle mainBundle].bundleIdentifier,
    (__bridge id)kSecAttrComment: @""
  }.mutableCopy;

  if (self.accessGroup != nil && self.accessGroup.length > 0) {
    items[(__bridge id)kSecAttrAccessGroup] = self.accessGroup;
  }

  return [NSDictionary dictionaryWithDictionary: items];
}

- (NSDictionary *)queryForRemove {
  return @{
           (__bridge id)kSecClass: (__bridge id)kSecClassGenericPassword,
           (__bridge id)kSecAttrAccount: Account,
           (__bridge id)kSecAttrService: [NSBundle mainBundle].bundleIdentifier
           };
}

- (nullable NSString *)create {
  NSString *UUIDString = [[[NSUUID alloc] init] UUIDString];
  OSStatus status = SecItemAdd((__bridge CFDictionaryRef)[self queryForCreate:UUIDString], NULL);
  if ([self verifyStatusAndStoreLastError:status]) return UUIDString;
  return nil;
}

- (nullable NSString *)find {
  CFDataRef result;
  OSStatus status = SecItemCopyMatching((__bridge CFDictionaryRef)[self queryForFind], (CFTypeRef *)&result);
  if (![self verifyStatusAndStoreLastError:status]) return nil;
  
  NSData *data = (__bridge_transfer NSData *)result;
  return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

- (BOOL)verifyStatusAndStoreLastError:(OSStatus)status {
  BOOL isSuccess = (status == noErr);
  if (isSuccess) return YES;
  self.lastErrorStatus = status;
  return NO;
}

@end
