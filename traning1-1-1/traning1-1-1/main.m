//
//  main.m
//  traning1-1-1
//
//  Created by MAC管理者 STV on 2017/08/12.
//  Copyright © 2017年 MAC管理者 STV. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 1.1.1 BOOL型、NSString型、NSInteger型、NSNumber型の変数を定義し、コンソールにログを出力する。(NSLog)
        BOOL checked = YES;
        NSString *firstMessage = @"Hello World!";
        NSInteger thisYear = 17;
        NSNumber *memberNum = @12;
        
        NSLog(@"BOOL: %d", checked);
        NSLog(@"NSString: %@", firstMessage);
        NSLog(@"NSInteger: %ld", thisYear);
        NSLog(@"NSNumber: %@", memberNum);
    }
    return 0;
}
