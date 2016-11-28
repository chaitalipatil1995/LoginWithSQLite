//
//  ViewController.h
//  CPLoginAppWithSqlite
//
//  Created by Student P_07 on 27/11/16.
//  Copyright © 2016 chaitu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>
#import "CPDatabaseManager.h"
#import "newLoginViewController.h"
#import "nextViewController.h"


@interface ViewController : UIViewController<UITextFieldDelegate>
{
    
    NSMutableArray *loginArray;
    
    NSMutableArray *allLogArray;
    
    
    
    
    
}





- (IBAction)newRegistraionAction:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *emailField;

@property (strong, nonatomic) IBOutlet UITextField *passwordField;

- (IBAction)loginAction:(id)sender;






@end

