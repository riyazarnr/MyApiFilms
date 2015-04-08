//
//  myapiViewController.m
//  myApifilms
//
//  Created by riyaz shaik on 30/05/1436 AH.
//  Copyright (c) 1436 AH Riyaz. All rights reserved.
//

#import "myapiViewController.h"

@interface myapiViewController ()



@end

@implementation myapiViewController



@synthesize search,searchButton,j,i;


- (void)viewDidLoad {
    
    
    [super viewDidLoad];
    
    
      /// uiTextField
    
    
    search = [[UITextField alloc]initWithFrame:CGRectMake(40, 150, 300, 50)];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldDidChange) name:UITextFieldTextDidChangeNotification object:search];


    search.placeholder = @"Movie Name";
    
    
    
    [search addObserver:self forKeyPath:@"text" options:NSKeyValueObservingOptionNew context:nil];
    
    
      search.delegate = self;
    
    search.textAlignment = NSTextAlignmentCenter;
    
    search.background = [UIImage imageNamed:@"decorative_border.png"];
    
    [self.view addSubview:search];
    
    searchButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    
    searchButton.frame = CGRectMake(170, 220, 50, 50);
    
    [searchButton setImage:[UIImage imageNamed:@"srButton.png"] forState:UIControlStateNormal];

    
    [searchButton addTarget:self action:@selector(Click) forControlEvents:UIControlEventTouchUpInside];
    
     [self.view addSubview:searchButton];
    
    
  //  search.text = @"";
    
 }


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (object == search)
    {
        
        [self textdata];
        
        
        // Do whatever with your text field here
    }
}


-(void) Click {
    
    
    indicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
    indicator.frame = CGRectMake(0, 0, 40, 40);
    
    indicator.center = self.view.center;
    
    [self.view addSubview:indicator];
    
    
    
    [indicator startAnimating];

    
    
    dirnamLabel.text = nil;
    
    genresLabel.text = nil;
    
    urlIMDBLabel.text = nil;
    
    movName.text = nil;
    
    
    
     NSString *str = @"http://www.myapifilms.com/imdb?title=mask&format=JSON";
    
    
    
    
    NSString *st = [str stringByReplacingOccurrencesOfString:@"mask" withString:search.text];
    
    
    

    
    
    NSURL *url1 = [NSURL URLWithString:st];
    
    
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url1];
    
    
    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
    
    
    [NSURLConnection sendAsynchronousRequest:urlRequest queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
         
         
         
         if ([data length]>0 && error == nil) {
             

             
             
             
             NSLog(@"%lu",(unsigned long)[data length]);
             
             
             

             
             
             NSDictionary *dataDic = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
             
             
             // =====================    genres Names ===============================
             
             
             NSArray *genres = [dataDic valueForKey:@"genres"];
             
             NSLog(@"genre before flatter %@",genres);
             
             
             NSArray *flattened = [genres valueForKeyPath:@"@unionOfArrays.self"];
             
             NSLog(@"genre after flatter %@",flattened);

             
             NSString *mutstr = [flattened componentsJoinedByString: @","];
             
             
             // =====================    Director Names ===============================
             
             
             NSDictionary *dirDic = [dataDic valueForKey:@"directors"];
             
             
             NSArray *dirName = [dirDic valueForKey:@"name"];
             
             
             NSArray *flatteneddieName  = [dirName valueForKeyPath:@"@unionOfArrays.self"];
             
             
             
             NSString *dirNamesStr = [flatteneddieName componentsJoinedByString: @","];
             
             
             // =====================    Title Names ===============================
             
             
             NSArray *titleMov = [dataDic valueForKey:@"title"];
             
             
             NSString *movNameTitleStr = [titleMov componentsJoinedByString:@","];
             
             
             // =====================    Title Names ===============================
             
             NSArray *movUrlIMDB = [dataDic valueForKey:@"urlIMDB"];
             
             
             
             NSString *movUrlIMDBStr = [movUrlIMDB componentsJoinedByString:@""];
             
             NSLog(@"%@",movUrlIMDBStr);
             
          //   [indicator stopAnimating];
             
    
             
             ///// -------------   UILabels -------------------------
           
             
             
            movName1 = [[UILabel alloc]initWithFrame:CGRectMake(0, 250, 100, 30)];
             
             movName1.text = @"Title :";
             
             movName1.textColor = [UIColor blackColor];
             
             
             [self.view addSubview:movName1];

             
             movName = [[UILabel alloc]initWithFrame:CGRectMake(120, 250, 200, 30)];
             
             movName.text = movNameTitleStr;
             
             movName.textColor = [UIColor redColor];
             
             
             [self.view addSubview:movName];
             
             
               dirnamLabel1 = [[UILabel alloc]initWithFrame:CGRectMake(0, 300, 100, 60)];
             
             dirnamLabel1.text = @"Dir_Name :";
             
             dirnamLabel1.textColor = [UIColor blackColor];
             
             
             [self.view addSubview:dirnamLabel1];
             
             
             
             dirnamLabel = [[UILabel alloc]initWithFrame:CGRectMake(120, 300, 200, 60)];
             
             dirnamLabel.text = dirNamesStr;
             
             dirnamLabel.numberOfLines = 4;
             
             dirnamLabel.textColor = [UIColor redColor];
             
             
             [self.view addSubview:dirnamLabel];
             

                 genresLabel1 = [[UILabel alloc]initWithFrame:CGRectMake(0, 380, 80, 60)];
             
             genresLabel1.text =@"Genres :";
             
             genresLabel1.textColor = [UIColor blackColor];
             
             
             [self.view addSubview:genresLabel1];
             
             
             genresLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 380, 200, 60)];
             
             genresLabel.text = mutstr;
             
             genresLabel.numberOfLines = 4;
             
             genresLabel.textColor = [UIColor redColor];
             
             [self.view addSubview:genresLabel];
             
             
            urlIMDBLabel1 = [[UILabel alloc]initWithFrame:CGRectMake(0, 450, 80, 60)];
             
             urlIMDBLabel1.text = @"urlIMDB :";
             
             urlIMDBLabel1.textColor = [UIColor blackColor];
             
             
             [self.view addSubview:urlIMDBLabel1];
             
             urlIMDBLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 450, 200, 60)];
             
             urlIMDBLabel.text = movUrlIMDBStr;
             
             urlIMDBLabel.numberOfLines = 2;
             
             urlIMDBLabel.textColor = [UIColor redColor];
             
             [self.view addSubview:urlIMDBLabel];
             
             [indicator stopAnimating];

             
             
             
             
         }
         
         else if ([data length] == 0 && error == nil)
         {
             NSLog(@"Noting dowmn");
         }
         
         else if (error != nil)
         {
             NSLog(@"Error occured");
         }
         
     }
     
     ];
    
}



- (BOOL) textFieldShouldReturn:(UITextField *)textField;              // called when 'return' key pressed. return NO to ignore.
{
    
       return [textField resignFirstResponder];
    
}


-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [self textdata];
    
    [search resignFirstResponder];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;   // return NO to not change text
{
    [self textdata];
    
    NSLog(@"i am here");
    
    
    return YES;
}


-(void) textdata
{
    
    
    
    
    
    if ([search.text isEqualToString:@""])
    {
        searchButton.enabled = NO;

    }
    
    else
    {
        searchButton.enabled  = YES;
    }
    
//    
//     i = search.text.length;
//    
//    if (i > 0) {
//        searchButton.enabled = YES;
//        
//    }
//    
//    else
//    {
//        searchButton.enabled = NO;
//        
//    }
//    
    
    [self buttonstate];
    
    
}

-(int) buttonstate {
    
    
    
    if ([searchButton isEnabled]) {
        j = 1;
        
        
    }
    
    else
        
        j = 0;
    
    
    NSLog(@" j value is %d",j);
    
    
    return j;
}


- (void) textFieldDidChange {
    
    [self textdata];
    
    
    NSLog(@"test data is %@",search.text);
}




@end
