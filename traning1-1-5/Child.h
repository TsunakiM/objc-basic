//
//  Child.h
//  traning1-1-5
//
//  Created by MAC管理者 STV on 2017/08/19.
//  Copyright © 2017年 MAC管理者 STV. All rights reserved.
//

#import <Foundation/Foundation.h>

// プロトコル（約束・契約）を利用した、役割の実現がデリゲート。Delegateという関数とかがあるわけじゃない。
// 「私（プロトコル）を利用したいクラスは、このメソッド名を使ってください」という宣言。
// 「私を使ってくれ！」という側がDelegate。
// 使って欲しがっているクラス名 + Delegateと命名。

// Parentが「ある持ち物を持ったか確認するとき」に開かれるためのプロトコル
// Childから見ると、「忘れ物がないか聞いて！」というプロトコル
@protocol ChildDelegate <NSObject>
// Parentクラスから起動するメソッド。
// 返り値で、特定の持ち物を確認する用のitem文字列を返す。
- (NSString *)askAboutItem;
@end


@interface Child : NSObject
// デリゲートのプロパティ
@property (weak, nonatomic) id<ChildDelegate> delegate;
- (void)prepareItems:(NSArray<NSString *> *)items;
//Parentから聞かれたときの、返答内容
- (void)checkWithDelegate;
@end
