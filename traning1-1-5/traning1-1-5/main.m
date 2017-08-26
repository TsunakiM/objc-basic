//
//  main.m
//  traning1-1-5
//
//  Created by MAC管理者 STV on 2017/08/20.
//  Copyright © 2017年 MAC管理者 STV. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Account.h"

int main (int argc, const char * argv[]) {
    
    Account *employee = [[Account alloc] init:@"山田太郎"
                                           setAge:24
                                           setSex:@"M"
                              setFavoriteLanguage:@"Objective-C"
                        ];
    [employee joinIntern];
    
    return 0;
}
