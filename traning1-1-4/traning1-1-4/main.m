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
        
        Account *employee0000 = [[Account alloc] init:@"山田太郎" setAge:24 setSex:@"M"  setFavoriteLanguage:@"Java"];
        Account *employee0001 = [[Account alloc] init:@"佐藤大輔" setAge:31 setSex:@"M" setFavoriteLanguage:@"C#"];
        Account *employee0002 = [[Account alloc] init:@"Jon Coner" setAge:24 setSex:@"hoge" setFavoriteLanguage:@"C++"];
        Account *employee0003 = [[Account alloc] init:@"鈴木花子" setAge:22 setSex:@"F" setFavoriteLanguage:@"Javascript"];
        
        NSArray *allEmployees = @[employee0000, employee0001, employee0002, employee0003];
        [employee0000 printDetails];
        [employee0001 printDetails];
        [employee0002 printDetails];
        [employee0003 printDetails];

        NSLog(@"~~~社員一覧~~~");
        for(id allEmployee in allEmployees) {
            [allEmployee printName];
        }
        NSLog(@"~~~社員一覧~~~");

        return 0;
    }
