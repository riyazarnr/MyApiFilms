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
    
        
    
    UILabel *urlDynamicIMD;
    
    UILabel *genresDynamic;
    
    
    UILabel *dynamicDirector;
    
    UILabel *dynamicTitle;
    
    
    //  Static UILabels 
    
    UILabel*  urlStaticIMDB;
    
    UILabel*    genresStatic;
    
    UILabel*  staticDirector;
    
    UILabel *  staticTitle;

    
    UIActivityIndicatorView *indicator;
    
    
    NSDictionary *dic;

}



@property (strong,nonatomic)    UITextField *searchTextfield;

@property (strong,nonatomic)    UIButton *searchButton;

@property (strong,nonatomic) UIButton *restButton;


@property (strong , nonatomic) UIAlertView *alert;


@property (assign) int j;


-(void) textFieldDidChange;

-(int) buttonstate;



@end
