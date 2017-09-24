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

typedef NS_ENUM(NSUInteger, queryContents){
    QueryName,
    QueryValue
};

typedef NS_ENUM(NSUInteger, queryList) {
    Caption,
    Comment
};

@end

@implementation FromURLSchemeController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createQueryParameterDictionary {
    // URLを受け取る（stv//:?caption=ABC&comment=AAA）
    NSArray *dividedByQuestionArray = [self.receiveQuery componentsSeparatedByString:@"?"];
    // Arrayの中身[stv//:, caption=ABC&comment=AAA]
    NSArray *dividedByAmpersandArray = [dividedByQuestionArray[1] componentsSeparatedByString:@"&"];
    // Arrayの中身[caption=ABC, comment=AAA]
    NSMutableArray *queryList = [@[] mutableCopy];
    for (int i = 0; i < dividedByQuestionArray.count; i++) {
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
