//
//  UITableView+Ado.h
//  AdoHideTableSection
//
//  Created by dwx on 16/4/22.
//  Copyright © 2016年 Nododo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (Ado)
//设置默认高度
@property (nonatomic,assign)CGFloat ado_defaultCellHeigt;
//隐藏某个section
- (void)ado_hideSection:(NSInteger)section;
//存储隐藏section的集合
- (NSMutableIndexSet *)ado_hideSections;
//计算cell的高度  主要区别于0和默认高度
- (CGFloat)ado_configSectionHeightInSection:(NSInteger)section;

@end
