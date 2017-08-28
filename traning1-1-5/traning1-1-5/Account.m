//
//  Account.m
//  traning1-1-5
//
//  Created by MAC管理者 STV on 2017/08/20.
//  Copyright © 2017年 MAC管理者 STV. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Account.h"

@interface Account ()<FavoriteProgrammingLanguageDelegate>
@end

@implementation Account

// デリゲートの中身の処理
- (void)joinIntern {
    if ([self.delegate respondsToSelector:@selector(console)]) {
        // 確認用NSLog
        NSLog(@"joinIntern has been activated");
    }
}

@end
