//
//  AppDelegate.h
//  traning2-5-8
//
//  Created by 増田紘宜 on 2017/09/28.
//  Copyright © 2017年 TsunakiMasuda. All rights reserved.
//

#import <UIKit/UIKit.h>

@import Firebase;
@import UserNotifications;

@interface AppDelegate : UIResponder <UIApplicationDelegate, UNUserNotificationCenterDelegate, FIRMessagingDelegate>

@property (strong, nonatomic) UIWindow *window;


@end

