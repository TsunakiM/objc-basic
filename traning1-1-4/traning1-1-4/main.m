//
//  main.m
//  traning1-1-4
//
//  Created by MAC管理者 STV on 2017/08/15.
//  Copyright © 2017年 MAC管理者 STV. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Account.h"

    int main (int argc, const char * argv[]) {
        
        NSMutableArray *allEmployees = [NSMutableArray array];
        
        Account *employee0000 = [Account new];
        [allEmployees addObject:[employee0000 init:@"山田太郎" :24 :@"M" :@"Java"]];
        [employee0000 printDetails];
        
        Account *employee0001 = [Account new];
        [allEmployees addObject:[employee0001 init:@"佐藤大輔" :31 :@"M" :@"C#"]];
        [employee0001 printDetails];
        
        Account *employee0002 = [Account new];
        [allEmployees addObject:[employee0002 init:@"Jon Coner" :24 :@"M" :@"C++"]];
        [employee0002 printDetails];
        
        Account *employee0003 = [Account new];
        [allEmployees addObject:[employee0003 init:@"鈴木花子" :22 :@"F" :@"Javascript"]];
        [employee0003 printDetails];

        NSLog(@"~~~社員一覧~~~");
        for(int i = 0; i < allEmployees.count; i++) {
            NSLog(@"%d: %@", i, [allEmployees[i] name]);
        }
        NSLog(@"~~~社員一覧~~~");

        return 0;
    }
