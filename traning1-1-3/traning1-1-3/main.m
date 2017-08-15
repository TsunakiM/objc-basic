//
//  main.m
//  基本文法-条件分岐、ループ
//
//  Created by MAC管理者 STV on 2017/08/14.
//  Copyright © 2017年 MAC管理者 STV. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 1-1-3 if文、if〜else文、if〜else if文、三項演算子、for文、高速列挙構文、switchを利用したプログラムを作成し、結果をコンソールに出力する。
        
        // 判定用の変数
        int checkNum = 2;
        NSString *checkStr = @"朝";
        // NSString *checkStr = @"昼";
        // NSString *checkStr = @"夜";
        // NSString *checkStr = @"hogehoge";
        NSArray *checkArray = [NSArray arrayWithObjects:@"東京都", @"埼玉県", @"神奈川県", @"千葉県", nil];
        
        // if文
        if(checkNum % 2 == 0){
            NSLog(@"if文: %d は偶数です。", checkNum);
        }
        
        // if〜else文
        if(checkNum %2 == 0){
            NSLog(@"if〜else文: %d は偶数です。", checkNum);
        } else {
            NSLog(@"if〜else文: %d は奇数です。", checkNum);
        }
        
        // if〜else if文
        if([checkStr isEqual:@"朝"]) {
            NSLog(@"if〜else if文: おはようございます");
        }else if([checkStr isEqual:@"昼"]) {
            NSLog(@"if〜else if文: こんにちは");
        }else if([checkStr isEqual:@"夜"]) {
            NSLog(@"if〜else if文: こんばんは");
        } else {
            NSLog(@"if〜else if文: いらっしゃいませ");
        }
        
        // 三項演算子
        checkNum %2 == 0 ? NSLog(@"三項演算子: %d は偶数です。", checkNum) : NSLog(@"三項演算子: %d は奇数です。", checkNum);
        
        // for文
        for(int i=0;i<3;i++){
            NSLog(@"for文 %d回目", i+1);
        }
        // 高速列挙構文
        for(NSString *hoge in checkArray){
            NSLog(@"高速列挙構文: %@", hoge);
        }
        
        // swich文
        switch(checkNum % 2){
            case 0:
                NSLog(@"swich文: %d は偶数です", checkNum);
                break;
                
            case 1:
                NSLog(@"swich文: %d は奇数です", checkNum);
                break;
                
            default:
                NSLog(@"swich文: 数字を入力してください");
                break;
        }
    }
    return 0;
}
