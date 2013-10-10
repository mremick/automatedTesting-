//
//  WoWUtilsTest.m
//  GuildBrowser
//
//  Created by Matt Remick on 10/4/13.
//  Copyright (c) 2013 Charlie Fulton. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "WoWUtils.h"

@interface WoWUtilsTest : XCTestCase

@end

@implementation WoWUtilsTest


//Test do determine the proper output of character classes
- (void)testCharacterNameClassLookup
{
    XCTAssertEqualObjects(@"Warrior", [WoWUtils classFromCharacterType:1], @"ClassType should be Warrior");
    
    XCTAssertFalse([@"Mage" isEqualToString:[WoWUtils classFromCharacterType:2]], @"Classtype should not be Mage");
    
    XCTAssertTrue([@"Paladin" isEqualToString:[WoWUtils classFromCharacterType:2]], @"Classtype should be Paladin"); 
    
    XCTAssertTrue([@"Hunter" isEqualToString:[WoWUtils classFromCharacterType:3]], @"Classtype should be Hunter");
    
}

- (void)setUp
{
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

- (void)testExample
{
    XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
}

@end
