//
//  Account.m
//  traning1-1-5
//
//  Created by MAC管理者 STV on 2017/08/20.
//  Copyright © 2017年 MAC管理者 STV. All rights reserved.
//

#import "Account.h"

@implementation Account
- (void)wantJoinInternship {
    // joinInternshipメソッドの起動
    FavoriteProgrammingLanguage *favoriteprogramminglanguage = [FavoriteProgrammingLanguage new];
    [favoriteprogramminglanguage joinInternship];
}
@end
