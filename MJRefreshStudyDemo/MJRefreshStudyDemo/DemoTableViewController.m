//
//  DemoTableViewController.m
//  MJRefreshStudyDemo
//
//  Created by Xu Chen on 2018/9/7.
//  Copyright © 2018年 xu.yzl. All rights reserved.
//

#import "DemoTableViewController.h"

#import <MJRefresh/MJRefresh.h>
#import "MRunMenHeader.h"
#import "ChXRefreshBackNormalFooter.h"

@interface DemoTableViewController ()

@end

@implementation DemoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.tableFooterView = [UIView new];
    self.tableView.backgroundColor = UIColor.whiteColor;
    self.view.backgroundColor = UIColor.groupTableViewBackgroundColor;
    
    self.tableView.mj_header = [MRunMenHeader headerWithRefreshingBlock:^{
        
        // 延迟 3s 后添加到主队列执行
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.tableView.mj_header endRefreshing];
            [self.tableView.mj_footer resetNoMoreData];
        });
        
    }];
    [self.tableView.mj_header beginRefreshing];
    
    
    // 默认block方法：设置上拉加载更多
    self.tableView.mj_footer = [ChXRefreshBackNormalFooter footerWithRefreshingBlock:^{
        
        // 延迟 3s 后添加到主队列执行
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.tableView.mj_footer endRefreshingWithNoMoreData];
        });
        
    }];
    
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId" forIndexPath:indexPath];
//    if (!cell) {
       UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellId"];
//    }
    cell.textLabel.text = [NSString stringWithFormat:@"第 %ld 行", indexPath.row];
    return cell;
    
}


@end
