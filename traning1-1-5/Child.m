//
//  Child.m
//  traning1-1-5
//
//  Created by MAC管理者 STV on 2017/08/19.
//  Copyright © 2017年 MAC管理者 STV. All rights reserved.
//

#import "Child.h"

@interface Child ()
// Child配列が保持するitem配列を用意
@property (strong, nonatomic) NSMutableArray<NSString *> *items;
@end


@implementation Child
// item配列に持ち物を追加するメソッド
- (void)prepareItems:(NSArray<NSString *> *)items {
    self.items = [NSMutableArray<NSString *> array];
    [self.items addObjectsFromArray:items];
}

//Parentから聞かれたときの、返答内容
- (void)checkWithDelegate {
    if (![self.delegate respondsToSelector:@selector(askAboutItem)]) {
        return;
    }
    
    NSString *item = [self.delegate askAboutItem];
    BOOL isContained = [self.items containsObject:item];
    if (isContained) {
        NSLog(@"子供：%@は持った！", item);
    } else {
        NSLog(@"子供：%@は忘れてた！", item);
    }
}
@end
