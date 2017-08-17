//
//  Account.h
//  traning1-1-4
//
//  Created by MAC管理者 STV on 2017/08/15.
//  Copyright © 2017年 MAC管理者 STV. All rights reserved.
//

#import <Foundation/Foundation.h>

// プロパティの設定
@interface Account : NSObject {
    NSString *message;
    NSDictionary *employeeRegister;
}

// メソッドの宣言
-(void)setMessage:(NSString*) str;
-(NSString*)message;
-(void)printMessage;
-(void)employeeSetting;

@end
