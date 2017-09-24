//
//  PostInstagram.h
//  traning2-4-8
//
//  Created by 増田紘宜 on 2017/09/22.
//  Copyright © 2017年 TsunakiMasuda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PostInstagram : UIViewController <UIDocumentInteractionControllerDelegate>
{
    UIDocumentInteractionController *interactionCotroller;
}

+ (BOOL)canInstagramOpen;
- (void)setImage:(UIImage *)image;

@property (nonatomic,retain) UIDocumentInteractionController *interactionController;

@end
