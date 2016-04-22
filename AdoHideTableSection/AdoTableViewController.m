//
//  AdoTableViewController.m
//  AdoHideTableSection
//
//  Created by dwx on 16/4/22.
//  Copyright © 2016年 Nododo. All rights reserved.
//

#import "AdoTableViewController.h"
#import "UITableView+Ado.h"
#import "AdoTableViewHeaderFooterView.h"

static NSString * const headerID  = @"headerID";
static NSString * const cellID    = @"ado";

@interface AdoTableViewController ()

@end

@implementation AdoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.ado_defaultCellHeigt = 44; //必须给一个默认初始值
    [self.tableView registerClass:[AdoTableViewHeaderFooterView class] forHeaderFooterViewReuseIdentifier:headerID];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 10;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.backgroundColor = [UIColor cyanColor];
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    AdoTableViewHeaderFooterView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerID];
    header.headerSection = section;
    return header;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [tableView ado_configSectionHeightInSection:indexPath.section];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 50;
}

@end
