//
//  FavoriteProgrammingLanguage.h
//  traning1-1-5
//
//  Created by MAC管理者 STV on 2017/08/20.
//  Copyright © 2017年 MAC管理者 STV. All rights reserved.
//

#import <Foundation/Foundation.h>
/*！！！ デリゲートする側、処理をお願いする側、通知を飛ばす側 ！！！*/

// デリゲート用プロトコルを宣言
@protocol FavoriteProgrammingLanguageDelegate <NSObject>
@optional
- (void)canObjc;
@end

@interface FavoriteProgrammingLanguage : NSObject
// デリゲートで利用するためのメソッド名を定義
@property (weak, nonatomic) id <FavoriteProgrammingLanguageDelegate> delegate;
- (void)joinInternship;
@end
