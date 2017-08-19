//
//  Parent.m
//  traning1-1-5
//
//  Created by MAC管理者 STV on 2017/08/19.
//  Copyright © 2017年 MAC管理者 STV. All rights reserved.
//

#import "Parent.h"

@interface Parent ()
@end

@implementation Parent

// childに、Itemを持っているかどうかを尋ねる関数（meinから起動）
- (void)haveConversation {
    Child *child = [Child new];
    // childのデリゲートを、自分にセット
    child.delegate = self;
    // childのitem配列に、持ち物をセット
    [child prepareItems:@[@"教科書", @"ノート", @"筆記具"]];
    // childに
    [child checkWithDelegate];
}

// childデリゲートに
- (NSString *)askAboutItem {
    NSString *item = @"傘";
    NSLog(@"母親：%@は持った？", item);
    return item;
}
@end
