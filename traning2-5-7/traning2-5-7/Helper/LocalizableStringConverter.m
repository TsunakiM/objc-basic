//
//  LocalizableStringConverter.m
//
//  Created by 増田紘宜 on 2017/10/11.
//  Copyright © 2017年 TsunakiMasuda. All rights reserved.
//

#import "LocalizableStringConverter.h"

@implementation LocalizableStringConverter

/**
 LocalizableString.stringsのキー値を引数に指定すると、対応する値が戻ります。
 
 Convert LocalizedStringForKey to String.
 
 The following is fixed.
 
 value:nil
 
 table:@"Localizable"
 
 @param localizedStringForKey Enter localizedStringKey.
 @return Value(String), which is conversion of localizedStringKey.
 */
- (nonnull NSString *)getStringFrom:(nonnull NSString *)localizedStringForKey {
    NSString *localizedString = [NSBundle.mainBundle localizedStringForKey:localizedStringForKey
                                         value:nil
                                         table:@"Localizable"];
    return localizedString;
}

@end
