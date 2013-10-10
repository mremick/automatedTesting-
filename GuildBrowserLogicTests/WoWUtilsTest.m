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

- (void)testRaceLookup
{
    XCTAssertEqualObjects(@"Human", [WoWUtils raceFromRaceType:1], @"Race should be human");
    XCTAssertEqualObjects(@"Orc", [WoWUtils raceFromRaceType:2], @"Race should be Orc");
    XCTAssertFalse([@"Night Elf" isEqualToString:[WoWUtils raceFromRaceType:45]], @"Should be false");
    
    //in real program all races would be tested
}

- (void)testQualityLoop
{
    XCTAssertEqualObjects(@"Grey", [WoWUtils qualityFromQualityType:1], @"Color should be grey");
    XCTAssertFalse([@"Purple" isEqualToString:[WoWUtils qualityFromQualityType:10]], @"Should be false");
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


@end
