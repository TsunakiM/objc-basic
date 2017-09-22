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

- (void)printDetails {
    if([self.sex isEqualToString: @"M"]) {
        NSLog(@"%@君は、%@が得意な%zd歳です。", self.name, self.favoriteLanguage, self.age);
    } else if([self.sex isEqualToString: @"F"]) {
        NSLog(@"%@さんは、%@が得意な%zd歳です。", self.name, self.favoriteLanguage, self.age);
    } else {
        NSLog(@"Error: %@さんの性別に誤りがあります。\n男性の場合はM、女性の場合はFを入力してください（半角英字の大文字です）。", self.name);
    }
}

- (void)printName {
    NSLog(@"%@", self.name);
}

@end
