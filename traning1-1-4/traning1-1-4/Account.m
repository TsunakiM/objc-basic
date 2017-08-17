//
//  Account.m
//  traning1-1-4
//
//  Created by MAC管理者 STV on 2017/08/15.
//  Copyright © 2017年 MAC管理者 STV. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Account.h"

// Account.hで宣言したメソッドの内容
@implementation Account

    // インスタンス変数messageにテキストを設定し、変数strとして返す。
    -(void)setMessage:(NSString*) str {
        message = str;
    }

    // インスタンス変数messageを取り出す。
    -(NSString*)message {
        return message;
    }

    // インスタンス変数messageを出力する。
    -(void)printMessage {
        NSLog(@"%@",message);
    }

@end
