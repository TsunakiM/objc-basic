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
        
        Account *account = [Account new];
 
        [account init:@"山田太郎" :24 :@"M" :@"Java"];
        [account printDetails];
        [account init:@"佐藤大輔" :31 :@"M" :@"C#"];
        [account printDetails];
        [account init:@"Jon Coner" :24 :@"M" :@"C++"];
        [account printDetails];
        [account init:@"鈴木花子" :22 :@"F" :@"Javascript"];
        [account printDetails];

        return 0;
    }
