//
//  Account.m
//  traning1-1-5
//
//  Created by MAC管理者 STV on 2017/08/20.
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

@end
