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
@property (strong, nonatomic) NSString *hogeString;
@end

@implementation Account

// デリゲートの中身の処理
- (void)fuga {
    NSLog(@"確認用: fuga has been activated");
    if ([self.delegate respondsToSelector:@selector(didFuga:)]) {
        self.hogeString = @"sample message";
        [self.delegate didFuga:self.hogeString];
        NSLog(@"確認用: fuga's if has been activated");
    }
}

@end
