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
    if (![self.delegate respondsToSelector:@selector(canUseObjc)]) {
        return;
    }
    // デリゲートのメソッドcanUseObjcの呼び出し。
    [self canUseObjc];
}

- (void)canUseObjc {
    // デリゲートされる側の処理。
    NSLog(@"Objctive-Cができます。");
}

@end
