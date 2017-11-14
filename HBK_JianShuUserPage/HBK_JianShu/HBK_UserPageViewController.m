//
//  HBK_UserPageViewController.m
//  HBK_JianShuUserPage
//
//  Created by 黄冰珂 on 2017/11/14.
//  Copyright © 2017年 黄冰珂. All rights reserved.
//

#import "HBK_UserPageViewController.h"

@interface HBK_UserPageViewController ()<UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate>

@property (nonatomic, strong) UITableView *aTableView;

@property (nonatomic, strong) UITableView *bTableView;

@property (nonatomic, strong) UITableView *cTableView;

@property (nonatomic, strong) HBK_ScrollView *getScrollView;

@property (nonatomic, strong) UIView *disHeaderView;

@property (nonatomic, strong) HBK_SliderTitleView *titleView;
@end

@implementation HBK_UserPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self setUI];
    [self setHeaderView];
    [self setHBK_NavigationBar];
    
    
}
- (void)setHBK_NavigationBar {
    //    self.automaticallyAdjustsScrollViewInsets = NO;
    self.hbk_navgationBar = [HBK_NavigationBar HBK_setupNavigationBarWithTitle:@"个人主页" leftFirst:@"Login_Back_write" leftFirstAction:^{
        //此处有卡顿, 添加主线程进行
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.navigationController popViewControllerAnimated:YES];
        });
    } rightFirst:@"个人设置" rightFirstBtnAction:^{
        NSLog(@"个人设置");
    }];
    self.hbk_navgationBar.rightFirstBtn.titleLabel.font = kFont(kFit(13));
    NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:kFit(13)]};
    CGFloat length = [@"个人设置" boundingRectWithSize:CGSizeMake(320, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size.width;
    
    self.hbk_navgationBar.rightFirstBtn.frame = CGRectMake(kScreenWidth-length-20, 19/2, length+10, 25);
    self.hbk_navgationBar.bgColor = [UIColor clearColor];
    self.hbk_navgationBar.deviderLayer.backgroundColor = [UIColor clearColor].CGColor;
    self.hbk_navgationBar.titleLabel.textColor = [UIColor clearColor];
    self.hbk_navgationBar.rightFirstBtn.layer.cornerRadius = 2;
    self.hbk_navgationBar.rightFirstBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    self.hbk_navgationBar.rightFirstBtn.layer.borderWidth = 1;
    self.hbk_navgationBar.rightFirstBtn.layer.masksToBounds = YES;
    
    [self.hbk_navgationBar.rightFirstBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
}

- (void)setUI {
    self.getScrollView = [[HBK_ScrollView alloc] init];
    [self.view addSubview:self.getScrollView];
    self.getScrollView.bounces = NO;
    self.getScrollView.delaysContentTouches = NO;
    self.getScrollView.pagingEnabled = YES;
    self.getScrollView.showsVerticalScrollIndicator   = NO;
    self.getScrollView.showsHorizontalScrollIndicator = NO;
    self.getScrollView.delegate = self;
    self.getScrollView.contentSize = CGSizeMake(kScreenWidth*3, 0);
    
    UIView *headerView = [[UIView alloc] init];
    headerView.frame = CGRectMake(0, 0, 0, kHeaderViewHeight+kTitleHeight);
    
    self.aTableView = [[UITableView alloc] init];
    self.aTableView.delegate = self;
    self.aTableView.dataSource = self;
    self.aTableView.backgroundColor = kColor(245, 245, 245);
    self.aTableView.tableFooterView = [[UIView alloc] init];
    [self.getScrollView addSubview:self.aTableView];
    [self.aTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.getScrollView);
        make.width.mas_equalTo(kScreenWidth);
        make.top.equalTo(self.view);
        make.bottom.equalTo(self.view).offset(-kIPhoneXBottomHeight);
    }];
    self.aTableView.tableHeaderView = headerView;
    
    self.bTableView = [[UITableView alloc] init];
    self.bTableView.delegate = self;
    self.bTableView.dataSource = self;
    self.bTableView.backgroundColor = kColor(245, 245, 245);
    self.bTableView.tableFooterView = [[UIView alloc] init];
    [self.getScrollView addSubview:self.bTableView];
    [self.bTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.getScrollView).offset(kScreenWidth);
        make.width.equalTo(self.aTableView);
        make.top.bottom.equalTo(self.aTableView);
    }];
    self.bTableView.tableHeaderView = headerView;

    
    self.cTableView = [[UITableView alloc] initWithFrame:CGRectMake(kScreenWidth*2, 0, kScreenWidth, kScreenHeight) style:(UITableViewStylePlain)];
    self.cTableView.delegate = self;
    self.cTableView.dataSource = self;
    self.cTableView.backgroundColor = kColor(245, 245, 245);
    self.cTableView.tableFooterView = [[UIView alloc] init];
    [self.getScrollView addSubview:self.cTableView];
    [self.cTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.getScrollView).offset(kScreenWidth * 2);
        make.width.equalTo(self.aTableView);
        make.top.bottom.equalTo(self.aTableView);
    }];
    self.cTableView.tableHeaderView = headerView;
    
}

- (void)setHeaderView {
    self.disHeaderView = [[UIView alloc] init];
    self.disHeaderView.backgroundColor = kThemeColor;
    self.disHeaderView.frame = CGRectMake(0, 0, kScreenWidth, kHeaderViewHeight+kTitleHeight);
    [self.view addSubview:self.disHeaderView];
    
    self.titleView = [[HBK_SliderTitleView alloc] init];
    [self.disHeaderView addSubview:self.titleView];
    self.titleView.backgroundColor = [UIColor whiteColor];
    [self.titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.disHeaderView);
        make.bottom.equalTo(self.disHeaderView.mas_bottom);
        make.height.mas_equalTo(kTitleHeight);
    }];
    [self.getScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.bottom.equalTo(self.view).offset(-kIPhoneXBottomHeight);
        make.top.mas_equalTo(self.disHeaderView.mas_top);
    }];
    
    _titleView.titles  = @[@"动态", @"文章", @"更多"];
    _titleView.selectedIndex = 0;
    kWeakSelf(self);
    _titleView.buttonSelected = ^(NSInteger index){
        kStrongSelf(self);
        [self.getScrollView setContentOffset:CGPointMake(kScreenWidth * index, 0) animated:YES];
    };
}





- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"aaa"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"aaa"];
    }
    cell.backgroundColor = kRandomColor;
    return cell;
}


#pragma mark --------------------- UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (scrollView == self.getScrollView) {
        CGFloat contentOffsetX = scrollView.contentOffset.x;
        NSInteger pageNum = contentOffsetX / kScreenWidth + 0.5;
        self.titleView.selectedIndex = pageNum;
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView == self.getScrollView || !scrollView.window) {
        return;
    }
    CGFloat offsetY = scrollView.contentOffset.y;
    CGFloat originY = 0;
    CGFloat otherOffsetY = 0;
    if (offsetY <= (kHeaderViewHeight-kNavBarHeight)) {
        originY = -offsetY;
        if (offsetY < 0) {
            otherOffsetY = 0;
        } else {
            otherOffsetY = offsetY;
        }
    } else {
        originY = -kHeaderViewHeight+kNavBarHeight;
        otherOffsetY = kHeaderViewHeight+kNavBarHeight;
    }
    self.disHeaderView.frame = CGRectMake(0, originY, kScreenWidth, kHeaderViewHeight+kTitleHeight);
    for ( int i = 0; i < self.titleView.titles.count; i++ ) {
        if (i != self.titleView.selectedIndex) {
            UITableView *contentView = self.getScrollView.subviews[i];
            CGPoint offset = CGPointMake(0, otherOffsetY);
            if ([contentView isKindOfClass:[UITableView class]]) {
                if (contentView.contentOffset.y < kHeaderViewHeight || offset.y < kHeaderViewHeight) {
                    [contentView setContentOffset:offset animated:NO];
                    self.getScrollView.offset = offset;
                }
            }
        }
    }
    
    CGPoint offset = scrollView.contentOffset;
    CGFloat y = offset.y;
    CGFloat alphy = y / 150 > 1.0 ? 1.0 : y / 150;
    self.hbk_navgationBar.bgColor = [UIColor colorWithRed:256 green:0 blue:0 alpha:alphy];
    self.hbk_navgationBar.titleLabel.textColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:alphy];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
