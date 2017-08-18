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
        obj.employeeList = [@[] mutableCopy];
        
        [obj addEmployee:@"山田太郎" :24 :@"M" :@"Java"];
        [obj addEmployee:@"佐藤大輔" :31 :@"M" :@"C#"];
        [obj addEmployee:@"鈴木花子" :22 :@"F" :@"Javascript"];
        [obj addEmployee:@"Jon Coner" :24 :@"M" :@"C++"];
        
        [obj allEmployee];
        [obj printDetails: 0];
        [obj printDetails: 1];
        [obj printDetails: 2];
        [obj printDetails: 3];
        

        return 0;
    }
