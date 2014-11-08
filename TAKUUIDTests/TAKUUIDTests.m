//
//  TAKUUIDTests.m
//  TAKUUIDTests
//
//  Created by Takahiro Ooishi on 2014/11/08.
//  Copyright (c) 2014年 Takahiro Ooishi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import <TAKUUID/TAKUUID.h>

@interface TAKUUIDTests : XCTestCase

@end

@implementation TAKUUIDTests

- (void)setUp {
  [[TAKUUIDStorage sharedInstance] remove];
}

- (void)testCreate {
  NSString *UUID = [[TAKUUIDStorage sharedInstance] findOrCreate];
  XCTAssertNotNil(UUID);
}

- (void)testFind {
  NSString *first = [[TAKUUIDStorage sharedInstance] findOrCreate];
  XCTAssertNotNil(first);

  NSString *second = [[TAKUUIDStorage sharedInstance] findOrCreate];
  XCTAssertNotNil(second);

  XCTAssertEqualObjects(first, second);
}

- (void)testRemove {
  NSString *first = [[TAKUUIDStorage sharedInstance] findOrCreate];
  XCTAssertNotNil(first);

  BOOL success = [[TAKUUIDStorage sharedInstance] remove];
  XCTAssertTrue(success);
  
  NSString *second = [[TAKUUIDStorage sharedInstance] findOrCreate];
  XCTAssertNotNil(second);
  
  XCTAssertNotEqualObjects(first, second);
}

- (void)testRenew {
  NSString *first = [[TAKUUIDStorage sharedInstance] findOrCreate];
  XCTAssertNotNil(first);
  
  NSString *second = [[TAKUUIDStorage sharedInstance] renew];
  XCTAssertNotNil(second);
  
  XCTAssertNotEqualObjects(first, second);
}

@end
