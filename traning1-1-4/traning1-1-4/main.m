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
        
        Account *obj = [Account Account];
        [obj setName:@"yamada"];
        [obj setAge:24];
        [obj setSex:@"M"];
        [obj setFavLang:@"java"];
        [obj printDetails];

        return 0;
    }
