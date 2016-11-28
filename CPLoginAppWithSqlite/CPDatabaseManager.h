//
//  CPDatabaseManager.h
//  CPLoginAppWithSqlite
//
//  Created by Student P_07 on 27/11/16.
//  Copyright © 2016 chaitu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface CPDatabaseManager : NSObject
{
    sqlite3 *myDatabse;
    
}

+(instancetype) sharedManager;

-(NSString *)getDatabasePath;
-(int)executeQuery:(NSString *)query;
-(NSMutableArray *)getAllLogs;

@end
