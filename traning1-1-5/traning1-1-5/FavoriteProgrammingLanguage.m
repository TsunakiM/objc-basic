//
//  FavoriteProgrammingLanguage.m
//  traning1-1-5
//
//  Created by MAC管理者 STV on 2017/08/20.
//  Copyright © 2017年 MAC管理者 STV. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FavoriteProgrammingLanguage.h"
/*！！！ デリゲートする側、処理をお願いする側、通知を飛ばす側 ！！！*/

@interface FavoriteProgrammingLanguage ()
@end

@implementation FavoriteProgrammingLanguage

// 設定されたデリゲートメソッドを呼び出す処理
- (void)joinInternship{
    // optionalなので、デリゲートをインポートした先に、実装されているかを確認する。
    if ([self.delegate respondsToSelector:@selector(canObjc)]) {
        [self.delegate canObjc];
    }
}

@end
