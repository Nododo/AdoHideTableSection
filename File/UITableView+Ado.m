//
//  UITableView+Ado.m
//  AdoHideTableSection
//
//  Created by dwx on 16/4/22.
//  Copyright © 2016年 Nododo. All rights reserved.
//

#import "UITableView+Ado.h"
#import <objc/runtime.h>

const char adoHideSectionKey;
const char adoDefaultCellHeigtKey;

@implementation UITableView (Ado)

- (void)ado_hideSection:(NSInteger)section {
    [self ado_hideSection:section completHandler:nil];
}

- (void)ado_hideSection:(NSInteger)section completHandler:(AdoCompletHandler)completHandler {
    BOOL isHided;
    if ([self.ado_hideSections containsIndex:section]) {
        [self.ado_hideSections removeIndex:section];
        isHided = NO;
    } else {
        [self.ado_hideSections addIndex:section];
        isHided = YES;
    }
    [self reloadSections:[NSIndexSet indexSetWithIndex:section] withRowAnimation:UITableViewRowAnimationFade];
    if (completHandler) {
        completHandler(section, isHided);
    }
}

- (NSMutableIndexSet *)ado_hideSections {
    NSMutableIndexSet *set = objc_getAssociatedObject(self, &adoHideSectionKey);
    if (set == nil) {
        set = [NSMutableIndexSet indexSet];
        objc_setAssociatedObject(self, &adoHideSectionKey, set, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return set;
}

- (CGFloat)ado_defaultCellHeigt {
    return [objc_getAssociatedObject(self, &adoDefaultCellHeigtKey) floatValue];
}

- (void)setAdo_defaultCellHeigt:(CGFloat)ado_defaultCellHeigt {
    objc_setAssociatedObject(self, &adoDefaultCellHeigtKey, @(ado_defaultCellHeigt), OBJC_ASSOCIATION_ASSIGN);
}

- (CGFloat)ado_configSectionHeightInSection:(NSInteger)section {
    if ([self.ado_hideSections containsIndex:section]) {
        return 0;
    } else {
        NSAssert(self.ado_defaultCellHeigt != 0, @"must give a default height for cell by ado_defaultCellHeight");
        return self.ado_defaultCellHeigt;
    }
}


@end
