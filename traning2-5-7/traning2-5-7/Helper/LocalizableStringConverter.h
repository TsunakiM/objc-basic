//
//  LocalizableStringConverter.h
//
//  Created by 増田紘宜 on 2017/10/11.
//  Copyright © 2017年 TsunakiMasuda. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LocalizableStringConverter : NSObject
- (NSString *)getStringFrom:(NSString *)localizedStringForKey;

@end
