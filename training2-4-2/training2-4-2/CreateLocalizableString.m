//
//  CreateLocalizableString.m
//  training2-4-2
//
//  Created by 増田紘宜 on 2017/09/20.
//  Copyright © 2017年 TsunakiMasuda. All rights reserved.
//

#import "CreateLocalizableString.h"

@implementation CreateLocalizableString
- (NSString *)localizableString:(NSString *)localizedStringForKey {
    return [[NSBundle mainBundle]localizedStringForKey:localizedStringForKey value:nil table:@"Localizable"];
}

@end
