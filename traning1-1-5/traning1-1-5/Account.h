//
//  Account.h
//  traning1-1-5
//
//  Created by MAC管理者 STV on 2017/08/20.
//  Copyright © 2017年 MAC管理者 STV. All rights reserved.
//

#import <Foundation/Foundation.h>

// デリゲート本体の宣言
@protocol FavoriteProgrammingLanguageDelegate <NSObject>
@optional
- (void)didFuga: (NSString *)string;
@end

@interface Account : NSObject
// デリゲートの中身の宣言
@property (weak, nonatomic) id <FavoriteProgrammingLanguageDelegate> delegate;
- (void)fuga;
@end
