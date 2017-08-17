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
        
        [obj addEmployee:@"yamada" :24 :@"F" :@"Java"];
        [obj printDetails];
        [obj addEmployee:@"satou" :31 :@"M" :@"C#"];
        [obj printDetails];
        

        return 0;
    }
