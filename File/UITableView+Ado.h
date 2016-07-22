//
//  UITableView+Ado.h
//  AdoHideTableSection
//
//  Created by dwx on 16/4/22.
//  Copyright © 2016年 Nododo. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  事件完成的block
 *
 *  @param section 隐藏或显示某个section
 *  @param isHided 此section是隐藏还是显示
 */
typedef void(^AdoCompletHandler)(NSInteger section, BOOL isHided);

@interface UITableView (Ado)
//设置默认高度
@property (nonatomic,assign)CGFloat ado_defaultCellHeigt;
//隐藏某个section
- (void)ado_hideSection:(NSInteger)section;
//隐藏某个section   添加完成后block
- (void)ado_hideSection:(NSInteger)section completHandler:(AdoCompletHandler)completHandler;
//存储隐藏section的集合
- (NSMutableIndexSet *)ado_hideSections;
//计算cell的高度  主要区别于0和默认高度
- (CGFloat)ado_configSectionHeightInSection:(NSInteger)section;

@end
