//
//  ViewController.h
//  traning2-1-10
//
//  Created by MAC管理者 STV on 2017/09/07.
//  Copyright © 2017年 MAC管理者 STV. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *mainTableView;
@property (weak, nonatomic) NSArray *imagesFromPlist;
@property (weak, nonatomic) NSArray *textsFromPlist;

@end

