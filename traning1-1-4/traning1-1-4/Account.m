//
//  Account.m
//  traning1-1-4
//
//  Created by MAC管理者 STV on 2017/08/15.
//  Copyright © 2017年 MAC管理者 STV. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Account.h"


@implementation Account

@synthesize name, age, sex, favLang, employeeList;

+(Account*)Account {
    Account* obj;
    @autoreleasepool {
        obj = [self new];
    }
    return obj;
}

-(void)addEmployee :(NSString*)NAME :(NSUInteger)AGE :(NSString*)SEX :(NSString*)FAVLANG{
    name = NAME;
    age = AGE;
    sex = SEX;
    favLang = FAVLANG;

    [employeeList addObject:@[NAME, @(AGE), SEX, FAVLANG]];
}

-(void)allEmployee {
    NSLog(@"~~~社員一覧~~~");
    for(int i=0; i < employeeList.count; i++) {
        NSLog(@"%d: %@", i, employeeList[i][0]);
    }
    NSLog(@"~~~社員一覧~~~");
}

-(void)printDetails :(NSUInteger)listNum {
    if([employeeList[listNum][2] isEqualToString: @"M"]) {
        NSLog(@"%@君は、%@が得意な%@歳です。", employeeList[listNum][0], employeeList[listNum][3], employeeList[listNum][1]);
    } else {
        NSLog(@"%@さんは、%@が得意な%@歳です。", employeeList[listNum][0], employeeList[listNum][3], employeeList[listNum][1]);
    }
}

@end
