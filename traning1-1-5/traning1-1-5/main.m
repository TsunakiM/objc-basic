//
//  main.m
//  traning1-1-5
//
//  Created by MAC管理者 STV on 2017/08/20.
//  Copyright © 2017年 MAC管理者 STV. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FavoriteProgrammingLanguage.h"
#import "Account.h"

//実行メソッド
int main(int argc, const char * argv[]) {
    
    // Accountのインスタンスを作成し、
    Account *account = [Account new];
    // デリゲート設定をしたメソッドを呼び出す。
    [account activateJoinInternship];
    
    return 0;
}
