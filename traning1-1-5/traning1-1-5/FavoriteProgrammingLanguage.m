//
//  FavoriteProgrammingLanguage.m
//  traning1-1-5
//
//  Created by MAC管理者 STV on 2017/08/20.
//  Copyright © 2017年 MAC管理者 STV. All rights reserved.
//

#import "FavoriteProgrammingLanguage.h"

@implementation FavoriteProgrammingLanguage
- (void)hoge {
    // 確認用NSLog
    NSLog(@"hoge has been activated");
    
    Account *account = [Account new];
    account.delegate = self;
    NSLog(@"Objective-Cができます");
}
@end
