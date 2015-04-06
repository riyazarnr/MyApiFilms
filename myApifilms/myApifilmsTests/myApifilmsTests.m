//
//  myApifilmsTests.m
//  myApifilmsTests
//
//  Created by riyaz shaik on 29/05/1436 AH.
//  Copyright (c) 1436 AH Riyaz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "myapiViewController.h"

@interface myApifilmsTests : XCTestCase

@end

@implementation myApifilmsTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}


-(void)testwithData
{
    
    myapiViewController  *apiViw = [[myapiViewController alloc]init];
    
    
    
    apiViw.search = [[UITextField alloc]init];
    
    apiViw.search.text = @"300";
    
    
    NSLog(@"text data si %@",apiViw.search.text);
    
      [apiViw.searchButton sendActionsForControlEvents: UIControlEventTouchUpInside];
    
    [apiViw textdata];
    
    int i =   [apiViw buttonenabled];
    
    
    NSLog(@"with data %d",i);
    
    XCTAssertEqual(i, 1,@"Data test Passed");
    
}


-(void)testwithoutData
{
    myapiViewController  *apiViw = [[myapiViewController alloc]init];
    
    int i =   [apiViw buttonenabled];
    
    
    
    XCTAssertEqual(i, 0,@"Withot Data test Passed");
    
}






- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}


@end
