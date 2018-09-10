//
//  MRunMenHeader.m
//  Demo_268EDU
//
//  Created by yizhilu on 2017/9/19.
//  Copyright © 2017年 Magic. All rights reserved.
//

#import "MRunMenHeader.h"

@implementation MRunMenHeader

- (void)prepare{
    [super prepare];
    
    [self setTitle:@"下拉刷新" forState:MJRefreshStateIdle];
    [self setTitle:@"松开刷新" forState:MJRefreshStatePulling];
    [self setTitle:@"努力奔跑中..." forState:MJRefreshStateRefreshing];
    
    /*
     这里根据项目实际情况，三种状态是用的同一个动画图片数组，可做相应修改
     */
    NSMutableArray *refreshingImages = [self gifRefreshImages];
    
    // 设置普通状态的动画图片
    [self setImages:refreshingImages forState:MJRefreshStateIdle];
    // 设置即将刷新状态的动画图片（一松开就会刷新的状态）
    [self setImages:refreshingImages forState:MJRefreshStatePulling];
    // 设置正在刷新状态的动画图片
    [self setImages:refreshingImages forState:MJRefreshStateRefreshing];
    
    // 隐藏时间
    self.lastUpdatedTimeLabel.hidden = YES;
    // 隐藏状态,只显示图片
//    self.stateLabel.hidden = YES;
    
    // 设置颜色、字体大小
    self.stateLabel.textColor = MJRefreshColor(102, 102, 102);
    self.stateLabel.font = [UIFont boldSystemFontOfSize:14];
}

- (NSMutableArray *)gifRefreshImages {
    NSMutableArray *refreshingImages = [NSMutableArray array];
    for (NSUInteger i = 0; i< 6; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"run_loading_%lu", (unsigned long)i]];
        [refreshingImages addObject:image];
    }
    return refreshingImages;
}


@end
