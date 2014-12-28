//
//  CCBReader_NodeReferenceTest.m
//  SpriteBuilder
//
//  Created by Stuart Carnie on 12/28/14.
//
//

#import <XCTest/XCTest.h>
#import "Cocos2dTestHelpers.h"
#import "CCBReader.h"

@interface CCBReader_NodeReferenceTest : XCTestCase

@end

@implementation CCBReader_NodeReferenceTest

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testCCBRenderTest
{
    NSData * animData = [Cocos2dTestHelpers readCCB:@"ClipNodeTest"];
    XCTAssertNotNil(animData, @"Can't find ccb File");
    if(!animData)
        return;
    
    CCBReader * reader = [CCBReader reader];
    CCNode* root = [reader loadWithData:animData owner:nil];
    
    CCClippingNode* clip = (CCClippingNode*)[root getChildByName:@"clipper" recursively:YES];
    XCTAssertTrue([clip isKindOfClass:[CCClippingNode class]], @"clip should be an instance of CCClippingNode");
    
    CCNodeColor* mask = (CCNodeColor*)[root getChildByName:@"mask" recursively:YES];
    XCTAssertTrue([mask isKindOfClass:[CCNodeColor class]], @"mask should be an instance of CCNodeColor");
    
    XCTAssertTrue(clip.stencil == mask);
}

@end

