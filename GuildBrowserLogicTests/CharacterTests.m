//
//  CharacterTests.m
//  GuildBrowser
//
//  Created by Matt Remick on 10/10/13.
//  Copyright (c) 2013 Charlie Fulton. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Character.h"
#import "Item.h"

@interface CharacterTests : XCTestCase

@end

@implementation CharacterTests
{
    NSDictionary *_characterDetailJson;
}

- (void)setUp
{
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
    
    NSURL *dataServiceURL = [[NSBundle bundleForClass:self.class] URLForResource:@"character" withExtension:@"json"];
    
    NSData *sampleData = [NSData dataWithContentsOfURL:dataServiceURL];
    NSError *error;
    
    id json = [NSJSONSerialization JSONObjectWithData:sampleData options:kNilOptions error:&error];
    
    XCTAssertNotNil(json, @"Invalid test data");
    
    //initalizing an instance variable to be used in tests
    _characterDetailJson = json;
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
    
    //once each test is done the instance variable is turned to nil
    _characterDetailJson = nil;
}

- (void)testCreateCharacterFromDetailJson
{
    Character *testGuy1 = [[Character alloc] initWithCharacterDetailData:_characterDetailJson];
    XCTAssertNotNil(testGuy1, @"Could not create character from detail json");
    
    Character *testGuy2 = [[Character alloc] initWithCharacterDetailData:nil];
    XCTAssertNotNil(testGuy2, @"Could not create chracer from nil data");
}

- (void)testCreateCharacterFromDetailJsonProps
{
    Character *testGuy = [[Character alloc] initWithCharacterDetailData:_characterDetailJson];
    
    XCTAssertEqualObjects(testGuy.thumbnail, @"borean-tundra/171/40508075-avatar.jpg", @"Thumbnail URL is wrong");
    XCTAssertEqualObjects(testGuy.name, @"Hagrel", @"name is wrong");
    XCTAssertEqualObjects(testGuy.battleGroup, @"Emberstorm", @"battlegroup is wrong");
    XCTAssertEqualObjects(testGuy.realm, @"Borean Tundra", @"realm is wrong");
    XCTAssertEqualObjects(testGuy.achievementPoints, @3130, @"achievement points is wrong");
    XCTAssertEqualObjects(testGuy.level,@85, @"level is wrong");
    
    XCTAssertEqualObjects(testGuy.classType, @"Warrior", @"class type is wrong");
    XCTAssertEqualObjects(testGuy.race, @"Human", @"race is wrong");
    XCTAssertEqualObjects(testGuy.gender, @"Male", @"gener is wrong");
    XCTAssertEqualObjects(testGuy.averageItemLevel, @379, @"avg item level is wrong");
    XCTAssertEqualObjects(testGuy.averageItemLevelEquipped, @355, @"avg item level is wrong");
}

-(void)testCreateCharacterFromDetailJsonValidateItems
{
    Character *testGuy = [[Character alloc] initWithCharacterDetailData:_characterDetailJson];
    

    XCTAssertEqualObjects(testGuy.neckItem.name,@"Stoneheart Choker", @"name is wrong");
    XCTAssertEqualObjects(testGuy.wristItem.name,@"Vicious Pyrium Bracers", @"name is wrong");
    XCTAssertEqualObjects(testGuy.waistItem.name,@"Girdle of the Queen's Champion", @"name is wrong");
    XCTAssertEqualObjects(testGuy.handsItem.name,@"Time Strand Gauntlets", @"name is wrong");
    XCTAssertEqualObjects(testGuy.shoulderItem.name,@"Temporal Pauldrons", @"name is wrong");
    XCTAssertEqualObjects(testGuy.chestItem.name,@"Ruthless Gladiator's Plate Chestpiece", @"name is wrong");
    XCTAssertEqualObjects(testGuy.fingerItem1.name,@"Thrall's Gratitude", @"name is wrong");
    XCTAssertEqualObjects(testGuy.fingerItem2.name,@"Breathstealer Band", @"name is wrong");
    XCTAssertEqualObjects(testGuy.shirtItem.name,@"Black Swashbuckler's Shirt", @"name is wrong");
    XCTAssertEqualObjects(testGuy.tabardItem.name,@"Tabard of the Wildhammer Clan", @"nname is wrong");
    XCTAssertEqualObjects(testGuy.headItem.name,@"Vicious Pyrium Helm", @"neck name is wrong");
    XCTAssertEqualObjects(testGuy.backItem.name,@"Cloak of the Royal Protector", @"neck name is wrong");
    XCTAssertEqualObjects(testGuy.legsItem.name,@"Bloodhoof Legguards", @"neck name is wrong");
    XCTAssertEqualObjects(testGuy.feetItem.name,@"Treads of the Past", @"neck name is wrong");
    XCTAssertEqualObjects(testGuy.mainHandItem.name,@"Axe of the Tauren Chieftains", @"neck name is wrong");
    XCTAssertEqualObjects(testGuy.offHandItem.name,nil, @"offhand should be nil");
    XCTAssertEqualObjects(testGuy.trinketItem1.name,@"Rosary of Light", @"neck name is wrong");
    XCTAssertEqualObjects(testGuy.trinketItem2.name,@"Bone-Link Fetish", @"neck name is wrong");
    XCTAssertEqualObjects(testGuy.rangedItem.name,@"Ironfeather Longbow", @"neck name is wrong");
}

@end
