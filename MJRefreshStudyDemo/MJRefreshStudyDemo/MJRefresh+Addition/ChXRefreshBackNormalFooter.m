//
//  ChXRefreshBackNormalFooter.m
//  MJRefreshStudyDemo
//
//  Created by Xu Chen on 2018/9/10.
//  Copyright © 2018年 xu.yzl. All rights reserved.
//

#import "ChXRefreshBackNormalFooter.h"

@implementation ChXRefreshBackNormalFooter

- (void)prepare {
    [super prepare];
    
    [self setTitle:@"点击或上拉加载更多" forState:MJRefreshStateIdle];
    [self setTitle:@"松开立即加载更多" forState:MJRefreshStatePulling];
    [self setTitle:@"努力加载中" forState:MJRefreshStateRefreshing];
    [self setTitle:@"没有更多了" forState:MJRefreshStateNoMoreData];
    
    self.stateLabel.font = [UIFont boldSystemFontOfSize:13];
//    self.stateLabel.textColor = MJRefreshColor(102, 102, 102);
    self.stateLabel.textColor = UIColor.blueColor;
}

@end
