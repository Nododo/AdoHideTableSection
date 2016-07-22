//
//  AdoTableViewHeaderFooterView.m
//  AdoHideTableSection
//
//  Created by dwx on 16/4/22.
//  Copyright © 2016年 Nododo. All rights reserved.
//

#import "AdoTableViewHeaderFooterView.h"
#import "UITableView+Ado.h"
#import "Masonry.h"

@interface AdoTableViewHeaderFooterView ()

@property (nonatomic,weak)UIControl *tapControl;

@end

@implementation AdoTableViewHeaderFooterView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews {
    UIControl *tapControl = [[UIControl alloc] init];
    [tapControl addTarget:self action:@selector(tapSection:) forControlEvents:UIControlEventTouchUpInside];
    tapControl.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:tapControl];
    self.tapControl = tapControl;
}

- (void)layoutSubviews {
    [self.tapControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView);
    }];
    [super layoutSubviews];
}

- (void)tapSection:(UIControl *)control {
    UITableView *superView = (UITableView *)self.superview;
    [superView ado_hideSection:self.headerSection completHandler:^(NSInteger section, BOOL isHided) {
        NSLog(@"%ld----%d",section,isHided);
    }];
//    [superView ado_hideSection:self.headerSection];
}

@end
