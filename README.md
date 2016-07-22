# AdoHideTableSection
An easy way to hide or show section in a tableview
##NOTE:
###Version 0.2 添加block用来处理隐藏section之后的事件
###请记得把自定义cell的clipToBounds设置为YES，这样才不会让cell的内容“露”出来。。。
###传统的删除UITableView的section，往往是通过删除数据源,然后reloadSections的方法完成。但是如果想隐藏、显示多个section的时候,重复的addObject和removeObject并附带各种逻辑判断，是不是整个人都不开心了。
###就像完成下面的功能：（gif中的内容涉及公司车型数据库，就不拿出来献丑了。demo中的颜色搭配，请大家忍耐下吧~）
![](https://github.com/Nododo/AdoHideTableSection/blob/master/AdoHideTableSection/2016-04-22%2010_51_04.gif)
####考虑了一下，想要简单的实现这个功能，最有效的方法就是为UITableView添加一个category，从而不干扰项目中的其他部分。
####那么，这里之所以用hide而不是delete，就是把需要隐藏的section中的cell高度设置为0，需要显示时再还原为初始高度。那么设置一个defaultHeight是必须的咯。在category添加这么一个属性，咋办？对，用一下runtime。
#####@property (nonatomic,assign)CGFloat ado_defaultCellHeigt;
####有了默认高度，那么需要一个集合保留那些section是被隐藏的，那些section是正常的，那么哪种集合类型比较好呢？参考：
#####- (void)reloadSections:(NSIndexSet *)sections withRowAnimation:(UITableViewRowAnimation)animation NS_AVAILABLE_IOS(3_0);
####API用了NSIndexSet类型，仔细研究下，发现NSIndexSet用来实现我们的功能最好不过了。而我们需要不断的增加或减少section，所有选择其子类：NSMutableIndexSet，能addIndex，removeIndex，并能判断index是否存在：containsIndex，是不是觉得很完美？
#####- (NSMutableIndexSet *)ado_hideSections;
####这里存储了隐藏和显示的section，那么每个section中cell中的高度自然要我们自己计算了。根据self.ado_hideSections存储的section，返回不同的高度.
#####- (CGFloat)ado_configSectionHeightInSection:(NSInteger)section;
####关于AdoTableViewHeaderFooterView.h的写法，是我不想在controller中过多的增加代码，想出来的“歪招”。给其增加了一个属性：headerSection，让其记住自己属于UITableView中的那个section，更简单的完成自己的使用。
####给AdoTableViewHeaderFooterView的contentView增加一个UIControl，响应隐藏或显示的事件。
  `UITableView *superView = (UITableView *)self.superview;`
  `[superView ado_hideSection:self.headerSection];`
####获取父视图，隐藏或显示自己的section，搞定~

