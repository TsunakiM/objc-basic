//
//  FromURLSchemeController.m
//  traning2-6-1
//
//  Created by 増田紘宜 on 2017/09/25.
//  Copyright © 2017年 TsunakiMasuda. All rights reserved.
//

#import "FromURLSchemeController.h"

@interface FromURLSchemeController ()
@property (weak, nonatomic) IBOutlet UILabel *firstQueryName;
@property (weak, nonatomic) IBOutlet UILabel *secondQueryName;
@property (weak, nonatomic) IBOutlet UILabel *firstQueryValue;
@property (weak, nonatomic) IBOutlet UILabel *secondQueryValue;

typedef NS_ENUM(NSUInteger, QueryContents){
    QueryName,
    QueryValue
};

typedef NS_ENUM(NSUInteger, QueryList) {
    Caption,
    Comment
};

@end

@implementation FromURLSchemeController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createQueryParameter];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createQueryParameter {
    // URLを受け取る（stv//:?caption=ABC&comment=AAA）
    NSArray *dividedByQuestionArray = [self.receiveQuery componentsSeparatedByString:@"?"];
    // Arrayの中身[stv//:, caption=ABC&comment=AAA]
    NSArray *dividedByAmpersandArray = [dividedByQuestionArray[0] componentsSeparatedByString:@"&"];
    // Arrayの中身[caption=ABC, comment=AAA]
    NSMutableArray *queryList = [@[] mutableCopy];
    for (int i = 0; i < dividedByAmpersandArray.count; i++) {
        NSArray *forSetArray = [dividedByAmpersandArray[i] componentsSeparatedByString:@"="];
        [queryList addObject:forSetArray];
    }
    // Arrayの中身[{caption, ABC},{comment, AAA}]
    self.firstQueryName.text = queryList[Caption][QueryName];
    self.firstQueryValue.text = queryList[Caption][QueryValue];
    self.secondQueryName.text = queryList[Comment][QueryName];
    self.secondQueryValue.text = queryList[Comment][QueryValue];
    
}


@end
