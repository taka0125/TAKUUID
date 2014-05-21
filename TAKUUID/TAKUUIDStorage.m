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

@implementation TAKUUIDStorage

+ (instancetype)sharedInstance {
  static TAKUUIDStorage *_instance = nil;
  static dispatch_once_t oncePredicate;
  dispatch_once(&oncePredicate, ^{
    _instance = [[self alloc] init];
  });
  return _instance;
}

- (NSString *)findOrCreate {
  NSString *UUIDString = [self find];
  if (UUIDString) return UUIDString;
  return [self create];
}

- (BOOL)remove {
  OSStatus status = SecItemDelete((__bridge CFDictionaryRef)[self queryForRemove]);
  return status == noErr;
}

- (NSString *)renew {
  BOOL result = [self remove];
  if (result) return [self create];
  return nil;
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
  return @{
           (__bridge id)kSecClass: (__bridge id)kSecClassGenericPassword,
           (__bridge id)kSecAttrAccount: Account,
           (__bridge id)kSecValueData: [UUIDString dataUsingEncoding:NSUTF8StringEncoding],
           (__bridge id)kSecAttrDescription: @"",
           (__bridge id)kSecAttrService: [NSBundle mainBundle].bundleIdentifier,
           (__bridge id)kSecAttrComment: @""
           };
}

- (NSDictionary *)queryForRemove {
  return @{
           (__bridge id)kSecClass: (__bridge id)kSecClassGenericPassword,
           (__bridge id)kSecAttrAccount: Account,
           (__bridge id)kSecAttrService: [NSBundle mainBundle].bundleIdentifier
           };
}

- (NSString *)create {
  NSString *UUIDString = [[[NSUUID alloc] init] UUIDString];
  OSStatus status = SecItemAdd((__bridge CFDictionaryRef)[self queryForCreate:UUIDString], NULL);
  if (status == noErr) return UUIDString;
  return nil;
}

- (NSString *)find {
  CFDataRef result;
  OSStatus status = SecItemCopyMatching((__bridge CFDictionaryRef)[self queryForFind], (CFTypeRef *)&result);
  if (status != noErr) return nil;
  
  NSData *data = (__bridge_transfer NSData *)result;
  return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

@end
