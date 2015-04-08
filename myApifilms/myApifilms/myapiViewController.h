//
//  myapiViewController.h
//  myApifilms
//
//  Created by riyaz shaik on 30/05/1436 AH.
//  Copyright (c) 1436 AH Riyaz. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface myapiViewController : UIViewController <UITextFieldDelegate,NSURLConnectionDelegate>
{
    
        
    
    UILabel *urlIMDBLabel;
    
    UILabel *genresLabel;
    
    
    UILabel *dirnamLabel;
    
    UILabel *movName;
    
    
    //  Static UILabels 
    
    UILabel*  urlIMDBLabel1;
    
    UILabel*    genresLabel1;
    
    UILabel*  dirnamLabel1;
    
    UILabel *    movName1;

    
    UIActivityIndicatorView *indicator;
    
    
    NSDictionary *dic;

}



@property (strong,nonatomic)    UITextField *search;

@property (strong,nonatomic)    UIButton *searchButton;


@property (assign) int j;

@property (assign) long i;


-(void) textFieldDidChange;

-(int) buttonstate;



@end
