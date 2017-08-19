//
//  Parent.h
//  traning1-1-5
//
//  Created by MAC管理者 STV on 2017/08/19.
//  Copyright © 2017年 MAC管理者 STV. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Child.h"

@interface Parent : NSObject <ChildDelegate>
// childに、Itemを持っているかどうかを尋ねる（mainから起動する）
- (void)haveConversation;
@end
