//
//  main.m
//  基本文法-データ型（プリミティブ）
//
//  Created by MAC管理者 STV on 2017/08/12.
//  Copyright © 2017年 MAC管理者 STV. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 1.1.1 BOOL型、NSString型、NSInteger型、NSNumber型の変数を定義し、コンソールにログを出力する。(NSLog)
        BOOL a = YES;
        NSString *b = @"Hello World!";
        NSInteger c = 17;
        NSNumber *d = @12;
        
        NSLog(@"BOOL: %d", a);
        NSLog(@"NSString: %@", b);
        NSLog(@"NSInteger: %ld", c);
        NSLog(@"NSNumber: %@", d);
    }
    return 0;
}
