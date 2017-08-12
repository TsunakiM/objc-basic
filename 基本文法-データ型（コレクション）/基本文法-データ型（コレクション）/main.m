//
//  main.m
//  基本文法-データ型（コレクション）
//
//  Created by MAC管理者 STV on 2017/08/12.
//  Copyright © 2017年 MAC管理者 STV. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 1-1-2 NSArray型、NSDictonary型の変数を定義し、コンソールにログを出力する。(NSLog)
        
        NSArray *arrayA = [NSArray arrayWithObjects: @"weather", @"晴れ", @"曇り", @"雨", @"雪", nil];
        NSDictionary *dicB = [NSDictionary dictionaryWithObjectsAndKeys:
                              @"東京", @"東京都",
                              @"さいたま市", @"埼玉県",
                              @"横浜市", @"神奈川県",
                              @"前橋市", @"群馬県",
                              nil];
        // int型だとXcodeから警告が出るため、厳密にchar型を使用
        char dicLength = [dicB count];
        
        // arrayすべてを表示
        NSLog(@"NSArray-All: %@", arrayA);
        // 日本語が文字化けするので、日本語で格納したものを順次表示
        NSLog(@"NSArray[1]: %@", arrayA[1]);
        NSLog(@"NSArray[2]: %@", arrayA[2]);
        NSLog(@"NSArray[3]: %@", arrayA[3]);
        NSLog(@"NSArray[4]: %@", arrayA[4]);
        
        // Dictionaryの長さ（個数）の表示
        NSLog(@"NSDictionary.length: %d", dicLength);
        // キー（都道府県）から、値（県庁所在地）を出す
        NSLog(@"NSDictionary: 東京都の県庁所在地は %@", [dicB objectForKey:@"東京都"]);
        NSLog(@"NSDictionary: 神奈川県の県庁所在地は %@", [dicB objectForKey:@"神奈川県"]);
    }
    return 0;
}
