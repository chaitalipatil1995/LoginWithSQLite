//
//  CPDatabaseManager.m
//  CPLoginAppWithSqlite
//
//  Created by Student P_07 on 27/11/16.
//  Copyright © 2016 chaitu. All rights reserved.
//

#import "CPDatabaseManager.h"

@implementation CPDatabaseManager


+(instancetype)sharedManager{
    
    static CPDatabaseManager *sharedInstance;
    
    if(sharedInstance ==  nil){
        sharedInstance = [[CPDatabaseManager alloc]init];
        
    }
    return sharedInstance;
}


-(NSString *)getDatabasePath{
    
    return [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/SQDatabase.sqlite"];
    
}


-(int)executeQuery:(NSString *)query{
    
    int success = 0;
    
    sqlite3_stmt *statement;
    const char *UTFQuery = [query UTF8String];
    
    const char *UTFDatabase = [[self getDatabasePath]UTF8String];
    
    
    if (sqlite3_open(UTFDatabase, &myDatabse) == SQLITE_OK) {
        
        if (sqlite3_prepare_v2(myDatabse, UTFQuery, -1, &statement, NULL) == SQLITE_OK) {
            
            if (sqlite3_step(statement)== SQLITE_DONE) {
                
                success = 1;
                
            }
        }
        
        sqlite3_close(myDatabse);
        
    }
    return success;
    
}


-(NSMutableArray *)getAllLogs{
    NSMutableArray *logArray = [[NSMutableArray alloc]init];
    
    sqlite3_stmt *statement;
    
    NSString *query = @"SELECT * FROM LOGIN_TABLE";
    
    const char *UTFQuery = [query UTF8String];
    
    const char *UTFDatabasePath = [[self getDatabasePath]UTF8String];
    
    if (sqlite3_open(UTFDatabasePath, &myDatabse) == SQLITE_OK) {
        
        if (sqlite3_prepare_v2(myDatabse, UTFQuery, -1, &statement, nil) ==SQLITE_OK) {
            
            while (sqlite3_step(statement) == SQLITE_ROW) {
              
                const char * logID = (const char *)sqlite3_column_text(statement, 0);
                const char * email = (const char *)sqlite3_column_text(statement, 1);
                
                const char * password = (const char *)sqlite3_column_text(statement, 2);

                NSString *loginID = [NSString stringWithUTF8String:logID];
                
                NSString *emailString = [NSString stringWithUTF8String:email];
                
                NSString *passwordString = [NSString stringWithUTF8String:password];
                
                NSDictionary *logDictionary = [[NSDictionary alloc]initWithObjects:@[loginID,emailString,passwordString] forKeys:@[@"login_id",@"Email",@"Password"]];
                
                [logArray addObject:logDictionary];
                
            
                
            }
        }
    }
    return logArray;
    
}
    








@end
