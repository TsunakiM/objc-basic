//
//  FavoriteProgrammingLanguage.h
//  traning1-1-5
//
//  Created by MAC管理者 STV on 2017/08/20.
//  Copyright © 2017年 MAC管理者 STV. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol FavoriteProgrammingLanguageDelegate <NSObject>
@optional
- (BOOL)canUseObjc;
@end

@interface FavoriteProgrammingLanguage : NSObject
@property (weak, nonatomic) id<FavoriteProgrammingLanguageDelegate> delegate;
- (void)joinInternship;
@end
