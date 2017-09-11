//
//  Account.m
//  traning1-1-5
//
//  Created by MAC管理者 STV on 2017/08/20.
//  Copyright © 2017年 MAC管理者 STV. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Account.h"
#import "FavoriteProgrammingLanguage.h"
/*！！！ デリゲートされる側、処理をお願いされる側、通知を受けて処理をする側 ！！！*/

@interface Account ()
@end

@implementation Account : NSObject
- (void)activateJoinInternship {
    // FPLクラスのインスタンスを生成し、
    FavoriteProgrammingLanguage *favoriteProgrammingLanguage = [FavoriteProgrammingLanguage new];
    // 自身にFPLクラスで宣言したデリゲートをセットし、
    favoriteProgrammingLanguage.delegate = self;
    // デリゲートで利用するメソッドを呼び出す。
    [favoriteProgrammingLanguage joinInternship];
}

// デリゲートメソッドの中身を定義
- (void)canObjc{
    NSLog(@"Objctive-Cができます。");
}
@end
