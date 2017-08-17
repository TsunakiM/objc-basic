//
//  Account.h
//  traning1-1-4
//
//  Created by MAC管理者 STV on 2017/08/15.
//  Copyright © 2017年 MAC管理者 STV. All rights reserved.
//

#import <Foundation/Foundation.h>

// プロパティの設定
@interface Account : NSObject

@property(retain)NSString *name;
@property NSUInteger age;
@property(retain)NSString *sex;
@property(retain)NSString *favLang;
//@property NSMutableArray *employeeList;

+(Account*)Account;
//-(void)addEmployee :(NSString*)name :(NSUInteger*)age :(NSString*)sex :(NSString*)favLang;
-(void)allEmployee;
-(void)printDetails;

@end
