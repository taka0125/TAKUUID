//
//  TAKUUIDStorage.h
//  TAKUUID
//
//  Created by Takahiro Ooishi
//  Copyright (c) 2014 Takahiro Ooishi. All rights reserved.
//  Released under the MIT license.
//

#import <Foundation/Foundation.h>
#import <Security/Security.h>

@interface TAKUUIDStorage : NSObject

@property (nonatomic, readonly) OSStatus lastErrorStatus;
@property (nonatomic, copy, nullable) NSString *accessGroup;

+ (nonnull instancetype)sharedInstance;
- (nullable NSString *)findOrCreate;
- (BOOL)remove;
- (nullable NSString *)renew;
- (BOOL)migrate;

@end
