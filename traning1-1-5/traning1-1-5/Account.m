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

- (instancetype)init :(NSString *)name
               setAge:(NSUInteger)age
               setSex:(NSString *)sex
  setFavoriteLanguage:(NSString *)favoriteLanguage {
    self = [super init];
    
    if (self) {
        self.name = name;
        self.age = age;
        self.sex = sex;
        self.favoriteLanguage = favoriteLanguage;
    }
    return self;
}

// デリゲートの中身の処理
- (void)joinIntern {
    if ([self.delegate respondsToSelector:@selector(console:)]) {
        [self.delegate console:self.favoriteLanguage];
    }
}

@end
