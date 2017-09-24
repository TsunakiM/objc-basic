//
//  ToDoEditViewController.h
//  traning2-3-2
//
//  Created by 増田紘宜 on 2017/09/18.
//  Copyright © 2017年 TsunakiMasuda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ToDoEditViewController : UIViewController<UITextFieldDelegate,UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *todoNameTextView;
@property (weak, nonatomic) IBOutlet UITextView *todoContentsTextField;
@property (strong, nonatomic) UIAlertController *registerAlertController;
@property (strong, nonatomic) UIAlertController *doneAlertController;

// DB用変数
@property  (nonatomic) int todoId;
@property  (strong, nonatomic) NSString *todoTitle;
@property  (strong, nonatomic) NSString *todoContents;
@property  (strong, nonatomic) NSString *created;
@property  (strong, nonatomic) NSString *modified;
@property  (strong, nonatomic) NSString *limitDate;
@property NSInteger deleteFlag;

- (int)addTodoId;
- (NSString *)getCreated;
- (NSString *)getLimitDate;
- (void)createAleart;
- (void)registerAction;


@end
