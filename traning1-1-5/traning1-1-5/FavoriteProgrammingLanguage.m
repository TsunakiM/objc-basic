//
//  FavoriteProgrammingLanguage.m
//  traning1-1-5
//
//  Created by MAC管理者 STV on 2017/08/20.
//  Copyright © 2017年 MAC管理者 STV. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FavoriteProgrammingLanguage.h"

@interface FavoriteProgrammingLanguage() <FavoriteProgrammingLanguageDelegate>
@property (strong, nonatomic) Account *account;
@end

@implementation FavoriteProgrammingLanguage : Account
- (void)didFuga: (NSString *)string {
    // 確認用NSLog
    NSLog(@"確認用: hoge has been activated");
    
    NSLog(@"%@", string);
}
@end
