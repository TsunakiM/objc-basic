//
//  RootViewController.m
//  traning2-1-16
//
//  Created by 増田紘宜 on 2017/09/15.
//  Copyright © 2017年 TsunakiMasuda. All rights reserved.
//

#import "RootViewController.h"
#import "ContentViewController.h"

@interface RootViewController () <UIPageViewControllerDataSource>
@property (strong, nonatomic) UIPageViewController *pageViewController;
@property (strong, nonatomic) NSArray *pageIndexStrings;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.pageIndexStrings = @[@"ひとつめ", @"ふたつめ", @"みっつめ", @"よっつめ"];
    
    // ページビューコントローラーを作成
    // PageView.storyboardをインスタンス化。
    UIStoryboard *pageViewStoryboard = [UIStoryboard storyboardWithName:@"PageView" bundle:nil];
    self.pageViewController = [pageViewStoryboard instantiateInitialViewController];
    // dataSourceに接続。
    self.pageViewController.dataSource = self;
    
    // 最初のコンテンツページを作成
    ContentViewController *firstContentViewController = [self contentViewControllerAtIndex:0];
    NSArray *contentViewControllers = @[firstContentViewController];
    [self.pageViewController setViewControllers:contentViewControllers
                                      direction:UIPageViewControllerNavigationDirectionForward
                                       animated:NO
                                     completion:nil];
    
    // ページビューコントローラーを追加
    [self addChildViewController:self.pageViewController];
    [self.view addSubview:self.pageViewController.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// コンテンツページ作成のメソッド
- (ContentViewController *)contentViewControllerAtIndex:(NSUInteger)index {
    // contentViewStorybordに接続。
    UIStoryboard *contentViewStoryboard = [UIStoryboard storyboardWithName:@"ContentView" bundle:nil];
    ContentViewController *contentViewController = [contentViewStoryboard instantiateInitialViewController];
    
    // 値を代入
    contentViewController.labelText = self.pageIndexStrings[index];
    contentViewController.index = index;
    contentViewController.totalPageNumber = self.pageIndexStrings.count;
    
    return contentViewController;
}

// 前のページに戻る処理
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController
      viewControllerBeforeViewController:(UIViewController *)viewController {
    NSInteger index = ((ContentViewController *)viewController).index;
    index--;
    if (index < 0) {
        return nil;
    } else {
        return [self contentViewControllerAtIndex:index];
    }
}

// 次のページに進む処理
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController
       viewControllerAfterViewController:(UIViewController *)viewController {
    NSInteger index = ((ContentViewController *)viewController).index;
    index++;
    if (index == self.pageIndexStrings.count) {
        return nil;
    } else {
        return [self contentViewControllerAtIndex:index];
    }
}

/* 参考にしたページ
 簡単なページめくりの実装方法 on @Qiita
 http://qiita.com/soudap/items/6ff6ff4a381d7fc2975c
 */

@end
