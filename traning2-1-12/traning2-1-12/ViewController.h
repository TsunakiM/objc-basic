//
//  ViewController.h
//  traning2-1-12
//
//  Created by MAC管理者 STV on 2017/09/10.
//  Copyright © 2017年 MAC管理者 STV. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UICollectionViewDelegate, UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *mainCollection;


@end

