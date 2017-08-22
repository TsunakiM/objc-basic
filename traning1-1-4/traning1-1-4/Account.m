//
//  Account.m
//  traning1-1-4
//
//  Created by MAC管理者 STV on 2017/08/15.
//  Copyright © 2017年 MAC管理者 STV. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Account.h"

@interface Account ()
@property (nonatomic)NSString *name;
@property (nonatomic)NSUInteger age;
@property (nonatomic)NSString *sex;
@property (nonatomic)NSString *favoriteLanguage;
@end

@implementation Account

- (id)init :(NSString *)name :(NSUInteger)age :(NSString *)sex :(NSString *)favoriteLanguage {
    self.name = name;
    self.age = age;
    self.sex = sex;
    self.favoriteLanguage = favoriteLanguage;
    
    return self;
}

- (void)printDetails {
    if([self.sex isEqualToString: @"M"]) {
        NSLog(@"%@君は、%@が得意な%zd歳です。", self.name, self.favoriteLanguage, self.age);
    } else {
        NSLog(@"%@さんは、%@が得意な%zd歳です。", self.name, self.favoriteLanguage, self.age);
    }
}

@end
