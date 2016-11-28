//
//  newLoginViewController.m
//  CPLoginAppWithSqlite
//
//  Created by Student P_07 on 27/11/16.
//  Copyright © 2016 chaitu. All rights reserved.
//

#import "newLoginViewController.h"
#import "ViewController.h"
@interface newLoginViewController ()

@end

@implementation newLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)signUpAction:(id)sender {
    
    
    
    NSString *email = self.registrationEmailField.text;
    
    NSString *password = self.registrationPasswordField.text;
    
    
    if (email.length >0) {
        if (password.length >0) {
            
            
            
            NSString *query = [NSString stringWithFormat:@"INSERT INTO LOGIN_TABLE(LOG_ID,EMAIL,PASSWORD) VALUES('%@','%@','%@')", email.uppercaseString,email,password];
            
            
            NSLog(@"%@",query);
            
            int result = [[CPDatabaseManager sharedManager] executeQuery:query];
            
            if (result == 1) {
                NSLog( @" successfully inserted data");
                [self showAlertWithTitle:@"OK" message:@"Successfully insert in database"];

            }
            else{
                
                NSLog(@"unable to insert");
                [self showAlertWithTitle:@"Error..." message:@"Unable to insert in database"];
            }
        }
    }
    self.registrationEmailField.text = @"";
    self.registrationPasswordField.text = @"";

    ViewController *view = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
    
    [self.navigationController pushViewController:view animated:YES];
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
