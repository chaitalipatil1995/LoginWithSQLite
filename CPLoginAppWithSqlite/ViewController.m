//
//  ViewController.m
//  CPLoginAppWithSqlite
//
//  Created by Student P_07 on 27/11/16.
//  Copyright © 2016 chaitu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    loginArray = [[NSMutableArray alloc]init];
    allLogArray = [[NSMutableArray alloc]init];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)getAllLogs
{
    
    loginArray = [[CPDatabaseManager sharedManager]getAllLogs];

}



- (IBAction)newRegistraionAction:(id)sender {
 
    newLoginViewController *log = [self.storyboard instantiateViewControllerWithIdentifier:@"newLoginViewController"];
    
    [self.navigationController pushViewController:log animated:YES];
    
    
    
}
- (IBAction)loginAction:(id)sender {

    [self getAllLogs];
    NSString *emails = self.emailField.text;
    NSString *passwords = self.passwordField.text;
    

    if (emails.length > 0 ) {
        if (passwords.length >0) {
            
           // NSDictionary *logDic = [[NSDictionary alloc]init];
            
            int index;
            
            for(index = 1; index<loginArray.count; index++){
                
                
                //logDic = [loginArray objectAtIndex:index];
                
//                NSString * tempEmail =[[loginArray firstObject]valueForKey:@"Email"];
//                NSString * tempPassword =[[loginArray firstObject]valueForKey:@"Password"];
            NSString * tempEmail =[[loginArray objectAtIndex:index]valueForKey:@"Email"];
            NSString * tempPassword =[[loginArray objectAtIndex:index]valueForKey:@"Password"];

            
                            if ([emails isEqualToString:tempEmail]) {
                                if ([passwords isEqualToString:tempPassword]) {
                
                
                                    nextViewController *newWindow = [self.storyboard instantiateViewControllerWithIdentifier:@"nextViewController"];
                
                                    [self.navigationController pushViewController:newWindow animated:YES];
                
                
                                }
                                else {
                
                                    NSLog(@"password is incorrect");
                                    [self showAlertWithTitle:@"Error..." message:@"Your password is incorrect"];

                                }
                                
                            }
                            else {
                                
                                NSLog(@"email is incorect");
                                [self showAlertWithTitle:@"Error..." message:@"Email is incorrect"];
                            }
                        }
                    }
                
    }
                self.emailField.text = @"";
                self.passwordField.text = @"";
}

-(void) showAlertWithTitle:(NSString *)title
                   message:(NSString *)message
{
    
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *OK = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"ok");
        
    }];
    
    [alert addAction:OK];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
