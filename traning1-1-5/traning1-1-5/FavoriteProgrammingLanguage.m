//
//  FavoriteProgrammingLanguage.m
//  traning1-1-5
//
//  Created by MAC管理者 STV on 2017/08/20.
//  Copyright © 2017年 MAC管理者 STV. All rights reserved.
//

#import "FavoriteProgrammingLanguage.h"

@implementation FavoriteProgrammingLanguage

- (void)joinInternship {
    // デリゲートのメソッドcanUseObjcの呼び出し。
    if([self canUseObjc]) {
        NSLog(@"インターンに参加できます。");
    }
}

- (BOOL)canUseObjc {
    // デリゲートされる側の処理。
    BOOL objcInternship = YES;
    return objcInternship;
}

@end
