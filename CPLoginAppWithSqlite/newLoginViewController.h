//
//  newLoginViewController.h
//  CPLoginAppWithSqlite
//
//  Created by Student P_07 on 27/11/16.
//  Copyright © 2016 chaitu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CPDatabaseManager.h"

@interface newLoginViewController : UIViewController<UITextFieldDelegate>
{
    
    
    
}




@property (strong, nonatomic) IBOutlet UITextField *registrationEmailField;


@property (strong, nonatomic) IBOutlet UITextField *registrationPasswordField;
- (IBAction)signUpAction:(id)sender;




@end
