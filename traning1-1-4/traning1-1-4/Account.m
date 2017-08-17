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

    [employeeList addObject:@[NAME, age, SEX, FAVLANG]];
    NSLog(@"%@", employeeList);
}

-(void)printDetails {
    if([self.sex isEqualToString: @"M"]) {
        NSLog(@"%@君は、%@が得意な%zd歳です。", name, favLang, age);
    } else {
        NSLog(@"%@さんは、%@が得意な%zd歳です。", name, favLang, age);
    }
//    NSLog(@"%@", employeeList[listCount]);
}

@end
