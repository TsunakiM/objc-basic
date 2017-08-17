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
        
        NSArray *weatherList = @[@"weather", @"晴れ", @"曇り", @"雨", @"雪"];
        NSDictionary *capitalDic = @{
                                     @"東京都": @"新宿区",
                                     @"埼玉県": @"さいたま市",
                                     @"神奈川県": @"横浜市",
                                     @"群馬県": @"前橋市",
                                     };

        NSUInteger dicCount = capitalDic.count;
        
        // arrayすべてを表示
        NSLog(@"NSArray-All: %@", weatherList);
        // 日本語が文字化けするので、日本語で格納したものを順次表示
        NSLog(@"NSArray[1]: %@", weatherList[1]);
        NSLog(@"NSArray[2]: %@", weatherList[2]);
        NSLog(@"NSArray[3]: %@", weatherList[3]);
        NSLog(@"NSArray[4]: %@", weatherList[4]);
        
        // Dictionaryの長さ（個数）の表示
        NSLog(@"NSDictionary: %zd", dicCount);
        // キー（都道府県）から、値（県庁所在地）を出す
        NSLog(@"NSDictionary: 東京都の県庁所在地は %@", capitalDic[@"東京都"]);
        NSLog(@"NSDictionary: 神奈川県の県庁所在地は %@", capitalDic[@"神奈川県"]);
    }
    
    return 0;
}
