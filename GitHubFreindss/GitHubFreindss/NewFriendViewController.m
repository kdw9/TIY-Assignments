//
//  NewFriendViewController.m
//  GitHubFreindss
//
//  Created by Keron Williams on 11/10/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

#import "NewFriendViewController.h"

@interface NewFriendViewController () <NSURLSessionDataDelegate>
{
    UITextField *usernameTextField;
    NSMutableData *receivedData;
}

@end

@implementation NewFriendViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    usernameTextField = [[UITextField alloc] initWithFrame:CGRectMake(10,60,300,40)];
    usernameTextField.placeholder = @"Username";
    [self.view addSubview:usernameTextField];
    
    UIButton *saveFriend = [[UIButton alloc] initWithFrame:CGRectMake(10, 110, 300, 40)];
    [saveFriend setTitle:@"Git User" forState:UIControlStateNormal];
    [saveFriend addTarget:self action:@selector(save) forControlEvents:UIControlEventTouchUpInside];
    saveFriend.backgroundColor = [UIColor blueColor];
    [self.view addSubview:saveFriend];
    
    UIButton *cancel = [[UIButton alloc] initWithFrame:CGRectMake(10, 160, 300, 40)];
    [cancel setTitle:@"Cancel" forState:UIControlStateNormal];
    [cancel addTarget:self action:@selector(cancel) forControlEvents:UIControlEventTouchUpInside];
    cancel.backgroundColor = [UIColor blueColor];
    [self.view addSubview:cancel];
    
}

- (void)didReceiveMemoryWarning
{
[super didReceiveMemoryWarning];
}

- (void)cancel
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)save
{
    NSString *name = usernameTextField.text;
    NSString *urlString = [NSString stringWithFormat:@"https://api.github.com/user/%@", name];
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLSessionConfiguration *configuration =
    [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:[NSOperationQueue mainQueue]];
                             
    NSURLSessionDataTask *task = [session dataTaskWithURL:url];
    [task resume];
}
    
    


#pragma mark - NSURLSessionData Delegate

- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveResponse:(NSURLResponse *)response completionHandler:(void (^)(NSURLSessionResponseDisposition))completionHandler
{
    completionHandler(NSURLSessionResponseAllow);
}
 
- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data
{
    if (!receivedData)
    {
        receivedData = [[NSMutableData alloc]init];
    }
    [receivedData appendData:data];
}
 
-(void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error
{
    if(!error)
    {
        NSLog(@"Download successful");
        NSDictionary *userInfo = [NSJSONSerialization JSONObjectWithData:receivedData options:0 error:nil];
        [self.friends addObject:userInfo];
        [self cancel];
    }
}
    
@end
