//
//  AdoTableViewHeaderFooterView.h
//  AdoHideTableSection
//
//  Created by dwx on 16/4/22.
//  Copyright © 2016年 Nododo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AdoTableViewHeaderFooterView : UITableViewHeaderFooterView

@property (nonatomic,assign)NSInteger headerSection;//确认自己的section 可以通过superView完成隐藏指定section的功能

@end
