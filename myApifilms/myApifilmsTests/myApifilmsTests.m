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

#import "AppDelegate.h"


@interface myApifilmsTests : XCTestCase
{
    AppDelegate *appdelegate;
}

@property (nonatomic ,strong) myapiViewController *apiview;

@property (nonatomic ,strong) NSObject *Button;

@property (nonatomic ,strong)NSObject *textField;


@end

@implementation myApifilmsTests

@synthesize apiview,Button,textField;


- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    apiview = [[myapiViewController alloc]init];
    
    
}


- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}



- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
    
    
}




- (void) testWithData
{
   // apiview = [[myapiViewController alloc]init];
    
    
 //   self.apiview.search = [[UITextField alloc]init];
    
    self.apiview.searchButton = [[UIButton alloc]init];
    
    
    
    apiview.search.text = @"Matrix";
    
    NSLog(@"the data testwithData is %@",[apiview.search text]);

    
    int Yesss = [apiview buttonstate];
    
    
    
    XCTAssertEqual(Yesss, 1,@"Pass Button is enabled");

    
}


//
//- (void) testWithData1
//{
//    // apiview = [[myapiViewController alloc]init];
//    
//    
//    //   self.apiview.search = [[UITextField alloc]init];
//    
//    self.apiview.searchButton = [[UIButton alloc]init];
//    
//    
//    
//    apiview.search.text = @"Matrix";
//    
//    NSLog(@"the data testwithData is %@",[apiview.search text]);
//    
//    
//    int Yesss = [apiview buttonstate];
//    
//    
//    
//    XCTAssertEqual(Yesss, 1,@"Pass Button is enabled");
//    
//    
//}
//





- (void) testWithoutData
{
    
  //  apiview = [[myapiViewController alloc]init];
    
   self.apiview.search = [[UITextField alloc]init];
    
    //    self.apiview.searchButton = [[UIButton alloc]init];
    
    self.apiview.search.text = @"";
    
    NSLog(@"the data withouttestData is %@",[apiview.search text]);

    
    int Yesss = [apiview buttonstate];
    
    
    XCTAssertEqual(Yesss, 0,@"Pass Button is Disabled");
    
}



//
//
//- (void) testWithoutData1
//{
//    
//    //  apiview = [[myapiViewController alloc]init];
//    
//    self.apiview.search = [[UITextField alloc]init];
//    
//    //    self.apiview.searchButton = [[UIButton alloc]init];
//    
//    self.apiview.search.text = @"";
//    
//    NSLog(@"the data withouttestData is %@",[apiview.search text]);
//    
//    
//    int Yesss = [apiview buttonstate];
//    
//    
//    XCTAssertEqual(Yesss, 0,@"Pass Button is Disabled");
//    
//}
//



- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}


@end
