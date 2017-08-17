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



@synthesize name, age, sex, favLang;
//@synthesize name, age, sex, favLang, employeeList;

+(Account*)Account {
    Account* obj;
    @autoreleasepool {
        obj = [self new];
    }
    return obj;
}

//-(void)addEmployee :(NSString*)name :(NSUInteger*)age :(NSString*)sex :(NSString*)favLang{
//    
//}

-(void)allEmployee{
    
}

-(void)printDetails {
    if([self.sex isEqualToString: @"M"]) {
        NSLog(@"%@君は、%@が得意な%zd歳です。", name, favLang, age);
    } else {
        NSLog(@"%@さんは、%@が得意な%zd歳です。", name, favLang, age);
    }
}

@end
