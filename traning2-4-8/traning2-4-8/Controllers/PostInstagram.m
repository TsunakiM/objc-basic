//
//  PostInstagram.m
//  traning2-4-8
//
//  Created by 増田紘宜 on 2017/09/22.
//  Copyright © 2017年 TsunakiMasuda. All rights reserved.
//

#import "PostInstagram.h"

@interface PostInstagram()
- (void)closeView;
@end

@implementation PostInstagram

// Instagramがインストールされているかの確認（開けるかの確認）。
+ (BOOL)canInstagramOpen {
    NSURL *instagramURL = [NSURL URLWithString:@"instagram://app"];
    
    if ([[UIApplication sharedApplication] canOpenURL:instagramURL]) {
        return YES;
    }
    
    return NO;
}

- (void)openInstagram {
    NSString *filePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/image.igo"];
    NSURL *fileURL = [NSURL fileURLWithPath:filePath];
    
    self.interactionController = [UIDocumentInteractionController interactionControllerWithURL:fileURL];
    self.interactionController.UTI = @"com.instagram.exclusivegram";
    self.interactionController.delegate = self;
    
    BOOL present = [self.interactionController presentOpenInMenuFromRect:self.view.frame
                                                                  inView:self.view
                                                                animated:YES];
    if (!present) {
        [self closeView];
    }
}

// 投稿したい画像ファイルを、.igo形式で一時保存
- (void)setImage:(UIImage *)image {
    NSData *imageData = UIImageJPEGRepresentation(image, 0.75f);
    NSString *filePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/image.igo"];
    [imageData writeToFile:filePath atomically:YES];
}

- (void)viewDidAppear:(BOOL)animated {
    [self openInstagram];
}

- (void)closeView {
    [self.view removeFromSuperview];
    [self removeFromParentViewController];
    self.interactionController.delegate = nil;
}

#pragma mark - UIDocumentInteractionControllerDelegate

- (void)documentInteractionController:(UIDocumentInteractionController *)controller
        willBeginSendingToApplication:(NSString *)application {
    
}

- (void)documentInteractionController:(UIDocumentInteractionController *)controller
           didEndSendingToApplication:(NSString *)application {
    [self closeView];
}

- (void) documentInteractionControllerDidDismissOpenInMenu: (UIDocumentInteractionController *) controller {
    // キャンセルで閉じたときの挙動
    [self closeView];
}
@end

