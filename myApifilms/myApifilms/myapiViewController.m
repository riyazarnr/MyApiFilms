//
//  myapiViewController.m
//  myApifilms
//
//  Created by riyaz shaik on 30/05/1436 AH.
//  Copyright (c) 1436 AH Riyaz. All rights reserved.
//

#import "myapiViewController.h"

            ////      Common Data Types to ReUse    ////



static NSString *tyrAgainstring = @"Try Again";

static NSString *emptyString = @"";

static NSString *flatterArrayString = @"@unionOfArrays.self";

static NSString *joinByCommaString = @",";

@interface myapiViewController ()

{
}

@end

@implementation myapiViewController
{

}


@synthesize searchButton,searchTextfield,j,alert,restButton;


- (void)viewDidLoad {
    
    
    [super viewDidLoad];
    
    
    
    
    
    

    
    
                        ////        UIComponents        ////////
    
                             ////   Search TextField ////
    
    
        searchTextfield = [[UITextField alloc]initWithFrame:CGRectMake(40, 120, 300, 50)];
        
        
        searchTextfield.placeholder = @"Movie Name";
        
        
        searchTextfield.delegate = self;
        
        
        searchTextfield.textAlignment = NSTextAlignmentCenter;
        
        
        searchTextfield.background = [UIImage imageNamed:@"decorative_border.png"];
        
        
        [self.view addSubview:searchTextfield];
    
    
    
                            ////   Search Button ////

    
        searchButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        
        
        searchButton.frame = CGRectMake(170, 200, 50, 50);
        
        
        [searchButton setImage:[UIImage imageNamed:@"srButton.png"] forState:UIControlStateNormal];
        
        
        [searchButton addTarget:self action:@selector(SearchMoviesResults) forControlEvents:UIControlEventTouchUpInside];

        
        [self.view addSubview:searchButton];

    
    
                            //////     Observers Methods etc..   //////////
    
    
    
    
    [searchTextfield addObserver:self forKeyPath:@"text" options:NSKeyValueObservingOptionNew context:nil];


    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldDidChange) name:UITextFieldTextDidChangeNotification object:searchTextfield];

    
    [self textFieldDidChange];
    
    
 }


                            /////    Observer Calling Methods /////



- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if (object == searchTextfield)  {
        
        [self textFieldDidChange];
        
        
        
    }
}



                            ///  To Enable or Disable Button ///


- (void) textFieldDidChange {
    
    
    
    
    
    
    if ([searchTextfield.text isEqualToString:emptyString]) {
        searchButton.enabled = NO;
        
    }
    
    else
        
        
        searchButton.enabled  = YES;
    
    
    
    [self buttonstate];
    
    
}


                            /////     Text Field Delegate Methods etc .. /////



- (void)textFieldDidBeginEditing:(UITextField *)textField {
    
    
    
    
    [NSTimer scheduledTimerWithTimeInterval:8.0
                                     target:self
                                   selector:@selector(timertoUITextField)
                                   userInfo:nil
                                    repeats:YES];
    
    
  //  [NSTimer scheduledTimerWithTimeInterval:8.0 invocation:self repeats:YES];
    
    
    
    
}


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;
{
    [self textFieldDidChange];
    
    
    return YES;
}
- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    
    
    [self SearchMoviesResults];
    
    return [textField resignFirstResponder];
    
}


- (void) timertoUITextField {
    
    
    [searchTextfield resignFirstResponder];
    
}



                            //////    Touches Methods   ///////


- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [self textFieldDidChange];
    
    [searchTextfield resignFirstResponder];
    
}




                            //////   Buttons Action Calling Methods  //////



                                ////  Reset Button  //////


- (void) resetMovieResults {
    
    
    
                                searchTextfield.text = nil;
                                
                                urlDynamicIMD.text = nil;
                                
                                urlStaticIMDB.text = nil;
                                
                                genresDynamic.text = nil;
                                
                                genresStatic.text = nil;
                                
                                staticDirector.text = nil;
                                
                                dynamicDirector.text = nil;
                                
                                dynamicTitle.text = nil;
                                
                                staticTitle.text = nil;
                                
                                
                                urlDynamicIMD.hidden = YES;
                                
                                urlStaticIMDB.hidden = YES;
                                
                                genresDynamic.hidden = YES;
                                
                                genresStatic.hidden = YES;
                                
                                staticDirector.hidden = YES;
                                
                                dynamicDirector.hidden = YES;
                                
                                dynamicTitle.hidden = YES;
                                
                                staticTitle.hidden = YES;
                                
                                
                                [self textFieldDidChange];
                                
                                restButton.hidden = YES;
    
}



                                ////  Search Button  //////


- (void) SearchMoviesResults {
    
    
                                ////  Resetting Movie Results ///
    
                                [searchTextfield resignFirstResponder];
    
                                dynamicDirector.text = nil;
    
                                genresDynamic.text = nil;
    
                                urlDynamicIMD.text = nil;
    
                                dynamicTitle.text = nil;
    
                                restButton.hidden = YES;
    
    
    
                                urlDynamicIMD.hidden = YES;
                                genresDynamic.hidden = YES;
                                dynamicDirector.hidden = YES;
                                dynamicTitle.hidden = YES;
    
    

    
    
                                //// Activity Indicator  ///
    
    
                indicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
                indicator.frame = CGRectMake(0, 0, 40, 40);
    
                indicator.center = self.view.center;
    
                [self.view addSubview:indicator];
    
                [indicator startAnimating];

    
    
    
        ////        ???????????    Making Query to Server  ????????????    /////
    
    
            NSString *str = @"http://www.myapifilms.com/imdb?title=mask&format=JSON";
    
            NSString *st = [str stringByReplacingOccurrencesOfString:@"mask" withString:searchTextfield.text];
    
            NSURL *url1 = [NSURL URLWithString:st];
    
            NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url1];
    
            NSOperationQueue *queue = [[NSOperationQueue alloc]init];
    
            [NSURLConnection sendAsynchronousRequest:urlRequest queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
         
         
         
                        if ([data length]>0 && error == nil) {
                            
                            
                            
                            
                            @autoreleasepool {
                                
                                
                                
NSDictionary *dataDic = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
                                
                                
                                // =====================  To get genres Names =============================== //
                                
                                
                                NSArray *genres = [dataDic valueForKey:@"genres"];
                                
                                
                                
                                NSArray *flattenedgenres = [genres valueForKeyPath:flatterArrayString];
                                
                                
                                
                                NSString *mutstr = [flattenedgenres componentsJoinedByString:joinByCommaString];
                                
                                
                                // ===================== To get Director Names =============================== //
                                
                                
                                NSDictionary *dirDic = [dataDic valueForKey:@"directors"];
                                
                                
                                NSArray *dirName = [dirDic valueForKey:@"name"];
                                
                                
                                NSArray *flatteneddirName  = [dirName valueForKeyPath:flatterArrayString];
                                
                                
                                
                                NSString *dirNamesStr = [flatteneddirName componentsJoinedByString:joinByCommaString];
                                
                                
                                // ===================== To get Title Names =================================  //
                                
                                
                                NSArray *titleMov = [dataDic valueForKey:@"title"];
                                
                                
                                NSString *movNameTitleStr = [titleMov componentsJoinedByString:joinByCommaString];
                                
                                
                                // ===================== To get Url Links ==================================  //
                                
                                NSArray *movUrlIMDB = [dataDic valueForKey:@"urlIMDB"];
                                
                                
                                
                                NSString *movUrlIMDBStr = [movUrlIMDB componentsJoinedByString:emptyString];
                                
                                
                                
                                
                                
                                ///  Reset Button  ///
                                
                                restButton = [UIButton buttonWithType:UIButtonTypeCustom];
                                
                                restButton.frame = CGRectMake(220, 600, 60, 60);
                                
                                [restButton setImage:[UIImage imageNamed:@"resetButton.png"] forState:UIControlStateNormal];
                                
                                
                                [restButton addTarget:self action:@selector(resetMovieResults) forControlEvents:UIControlEventTouchUpInside];
                                
                                [self.view addSubview:restButton];
                                
                                
                                
                                
                                /////    Movie Results Label Printing   /////
                                
                                
                                
                                staticTitle = [[UILabel alloc]initWithFrame:CGRectMake(20, 300, 100, 60)];
                                
                                staticTitle.text = @"Title";
                                
                                staticTitle.textAlignment = NSTextAlignmentCenter;
                                
                                staticTitle.backgroundColor = [UIColor brownColor];
                                
                                staticTitle.textColor = [UIColor blackColor];
                                
                                [self.view addSubview:staticTitle];
                                
                                
                                dynamicTitle = [[UILabel alloc]initWithFrame:CGRectMake(140, 300, 200, 60)];
                                
                                dynamicTitle.text = movNameTitleStr;
                                
                                dynamicTitle.textAlignment = NSTextAlignmentCenter;
                                
                                dynamicTitle.backgroundColor = [UIColor grayColor];
                                
                                dynamicTitle.textColor = [UIColor whiteColor];
                                
                                [self.view addSubview:dynamicTitle];
                                
                                
                                staticDirector = [[UILabel alloc]initWithFrame:CGRectMake(20, 370, 100, 60)];
                                
                                staticDirector.text = @"Dir_Name";
                                
                                staticDirector.textAlignment = NSTextAlignmentCenter;
                                
                                staticDirector.backgroundColor = [UIColor brownColor];
                                
                                staticDirector.textColor = [UIColor blackColor];
                                
                                [self.view addSubview:staticDirector];
                                
                                
                                
                                dynamicDirector = [[UILabel alloc]initWithFrame:CGRectMake(140, 370, 200, 60)];
                                
                                dynamicDirector.text = dirNamesStr;
                                
                                dynamicDirector.backgroundColor = [UIColor grayColor];
                                
                                dynamicDirector.textAlignment = NSTextAlignmentCenter;
                                
                                dynamicDirector.numberOfLines = 4;
                                
                                dynamicDirector.textColor = [UIColor whiteColor];
                                
                                [self.view addSubview:dynamicDirector];
                                
                                
                                genresStatic = [[UILabel alloc]initWithFrame:CGRectMake(20, 450, 100, 60)];
                                
                                genresStatic.text =@"Genres";
                                
                                genresStatic.textAlignment = NSTextAlignmentCenter;
                                
                                genresStatic.backgroundColor = [UIColor brownColor];
                                
                                
                                genresStatic.textColor = [UIColor blackColor];
                                
                                [self.view addSubview:genresStatic];
                                
                                
                                genresDynamic = [[UILabel alloc]initWithFrame:CGRectMake(140, 450, 200, 60)];
                                
                                genresDynamic.text = mutstr;
                                
                                genresDynamic.backgroundColor = [UIColor grayColor];
                                
                                genresDynamic.numberOfLines = 4;
                                
                                genresDynamic.textAlignment = NSTextAlignmentCenter;
                                
                                genresDynamic.textColor = [UIColor whiteColor];
                                
                                [self.view addSubview:genresDynamic];
                                
                                
                                urlStaticIMDB = [[UILabel alloc]initWithFrame:CGRectMake(20, 530, 100, 60)];
                                
                                urlStaticIMDB.text = @"UrlIMDB:";
                                
                                urlStaticIMDB.textAlignment = NSTextAlignmentCenter;
                                
                                urlStaticIMDB.backgroundColor = [UIColor brownColor];
                                
                                
                                urlStaticIMDB.textColor = [UIColor blackColor];
                                
                                [self.view addSubview:urlStaticIMDB];
                                
                                
                                urlDynamicIMD = [[UILabel alloc]initWithFrame:CGRectMake(140, 530, 200, 60)];
                                
                                urlDynamicIMD.text = movUrlIMDBStr;
                                
                                urlDynamicIMD.backgroundColor = [UIColor grayColor];
                                
                                urlDynamicIMD.textAlignment = NSTextAlignmentCenter;
                                
                                urlDynamicIMD.numberOfLines = 2;
                                
                                urlDynamicIMD.textColor = [UIColor whiteColor];
                                
                                [self.view addSubview:urlDynamicIMD];
                                
                                
                                

                            }
             
             
                        
             
[indicator stopAnimating];
                            
                            
               
                            

             
             
         }
                
                
                /////    !!!!!!!!!!!!!    Error Handling !!!!!!!!!!!!   ///////
                
                
         
         else if ([data length] == 0 && error == nil)
         {
             
             
             alert = [[UIAlertView alloc]initWithTitle:@"No Movie Found" message:@"Try Other Search" delegate:self cancelButtonTitle:tyrAgainstring otherButtonTitles:nil];
             
             
             [alert show];
             
             [indicator stopAnimating];
             
             
         }
                
                
                /////    !!!!!!!!!!!!!    Error Handling !!!!!!!!!!!!   ///////

         
         else if (error != nil)
         {
             alert = [[UIAlertView alloc]initWithTitle:@"Error" message:@"No Connection / remove Spaces" delegate:self cancelButtonTitle:tyrAgainstring otherButtonTitles:nil];
             
             [alert show];
             
             [indicator stopAnimating];
             
         }
         
     }
     
     ];
    
}


                        ////   Getting Button Status ////

- (int) buttonstate {
    
    
    
    if ([searchButton isEnabled]) {
        j = 1;
        
        
    }
    
    else
        
        j = 0;
    
    return j;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
    
}



@end
