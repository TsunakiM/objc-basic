//
//  Account.h
//  traning1-1-5
//
//  Created by MAC管理者 STV on 2017/08/20.
//  Copyright © 2017年 MAC管理者 STV. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FavoriteProgrammingLanguage.h"

// プロパティの設定
@interface Account : NSObject

- (id)init :(NSString *)name :(NSUInteger)age :(NSString *)sex :(NSString *)favoriteLanguage;

@end
