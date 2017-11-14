//
//  HBK_NavigationBar.m
//  CustomNavigationBarDemo
//
//  Created by 黄冰珂 on 2017/8/3.
//  Copyright © 2017年 黄冰珂. All rights reserved.
//

#import "HBK_NavigationBar.h"
#import <objc/runtime.h>
#import "UIView+Extension.h"


/// 返回按钮图片
static NSString * BackButtonImageName = @"Back_Button";



//屏幕的宽度
#define kScreenWidth  [[UIScreen mainScreen] bounds].size.width
//屏幕的高度
#define kScreenHeight  [[UIScreen mainScreen] bounds].size.height

@interface HBK_NavigationBar ()


/*
 导航栏背景框
 */
@property (nonatomic, strong) UIImageView *bgImageView;

@property (nonatomic, copy) ClickBlock leftFirstBlock;
@property (nonatomic, copy) ClickBlock leftSecondBlock;
@property (nonatomic, copy) ClickBlock rightFirstBlock;
@property (nonatomic, copy) ClickBlock rightSecondBlock;
@property (nonatomic, copy) ClickBlock rightThirdBlock;


@end


@implementation HBK_NavigationBar

/*
 设置标题文字
 */
- (void)setTitle:(NSString *)title {
    self.titleLabel.text = title;
}
/*
 标题文字颜色
 */
- (void)setTitleColor:(UIColor *)titleColor {
    self.titleLabel.textColor = titleColor;
}
/*
 导航栏背景颜色
 */
- (void)setBgColor:(UIColor *)bgColor {
    self.backgroundColor = bgColor;
}


/**
 标题字体大小
 */
- (void)setFont:(UIFont *)font {
    self.titleLabel.font = font;
}

/*
设置背景图
 */
- (void)setBackgroundImage:(UIImage *)backgroundImage {
    self.bgImageView.image = backgroundImage;
}



- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.size = CGSizeMake(kScreenWidth, kNavBarHeight);
        self.backgroundColor = HexColorInt32_t(F8F8F8);
        // 分隔线
        CALayer * layer = [CALayer layer];
        layer.frame = CGRectMake(0, kNavBarHeight-0.5, kScreenWidth, 0.5);
        layer.backgroundColor = HexColorInt32_t(DDDDDD).CGColor;
        [self.layer addSublayer:layer];
        _deviderLayer = layer;
    }
    return self;
}

- (instancetype)initWithTitle:(NSString *)title
                    leftFirst:(NSString *)leftFirst
           leftFirstBtnAction:(ClickBlock)leftFirstAction
                   leftSecond:(NSString *)leftSecond
          leftSecondBtnAction:(ClickBlock)leftSecondAction
                   rightFirst:(NSString *)rightFirst
          rightFirstBtnAction:(ClickBlock)rightFirstAction
                  rightSecond:(NSString *)rightSecond
         rightSecondBtnAction:(ClickBlock)rightSecondAction
                   rightThird:(NSString *)rightThird
          rightThirdBtnAction:(ClickBlock)rightThirdAction {
    if (self = [super init]) {
        self.bgImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kNavBarHeight-0.5)];
        [self addSubview:self.bgImageView];
        
        UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, self.maxY-44, kScreenWidth, 44)];
        [self addSubview:bottomView];
        //如果标题存在, 创建label
        if (title) {
            self.titleLabel = [[UILabel alloc] initWithFrame:(CGRectMake(0, 0, kScreenWidth, 44))];
            self.titleLabel.textAlignment = NSTextAlignmentCenter;
            self.titleLabel.font = [UIFont systemFontOfSize:18];
            self.titleLabel.text = title;
            [bottomView addSubview:self.titleLabel];
        }
        
        //左边第一个按钮(最左边)
        if (leftFirst) {
            self.leftFirstBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
            self.leftFirstBtn.frame = CGRectMake(10, 7, 30, 30);
            UIImage *image = [UIImage imageNamed:leftFirst];
            if (image) {
                [self.leftFirstBtn setImage:[UIImage imageNamed:leftFirst] forState:(UIControlStateNormal)];
            } else {
                [self.leftFirstBtn setTitle:leftFirst forState:(UIControlStateNormal)];
                self.leftFirstBtn.titleLabel.font = [UIFont systemFontOfSize:15];
                [self.leftFirstBtn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
            }
            [self.leftFirstBtn addTarget:self action:@selector(leftFirstBtnAction) forControlEvents:(UIControlEventTouchUpInside)];
            self.leftFirstBlock = leftFirstAction;
            [bottomView addSubview:self.leftFirstBtn];
        }
        
        //左边第二个按钮
        if (leftSecond) {
            self.leftSecondBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
            self.leftSecondBtn.frame = CGRectMake(40, 27, 30, 30);
            UIImage *image = [UIImage imageNamed:leftSecond];
            if (image) {
                [self.leftSecondBtn setImage:[UIImage imageNamed:leftSecond] forState:(UIControlStateNormal)];
            } else {
                [self.leftSecondBtn setTitle:leftSecond forState:(UIControlStateNormal)];
                self.leftSecondBtn.titleLabel.font = [UIFont systemFontOfSize:15];
                [self.leftSecondBtn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
            }
            [self.leftSecondBtn addTarget:self action:@selector(leftSecondBtnAction) forControlEvents:(UIControlEventTouchUpInside)];
            self.leftSecondBlock = leftSecondAction;
            [bottomView addSubview:self.leftSecondBtn];
        }
        
        //右边第一个按钮(最右边)
        if (rightFirst) {
            self.rightFirstBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
            self.rightFirstBtn.frame = CGRectMake(kScreenWidth-35, 7, 30, 30);
            UIImage *image = [UIImage imageNamed:rightFirst];
            if (image) {
                [self.rightFirstBtn setImage:[UIImage imageNamed:rightFirst] forState:(UIControlStateNormal)];
            } else {
                [self.rightFirstBtn setTitle:rightFirst forState:(UIControlStateNormal)];
                self.rightFirstBtn.titleLabel.font = [UIFont systemFontOfSize:15];
                [self.rightFirstBtn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
            }
            [self.rightFirstBtn addTarget:self action:@selector(rightFirstBtnAction) forControlEvents:(UIControlEventTouchUpInside)];
            self.rightFirstBlock = rightFirstAction;
            [bottomView addSubview:self.rightFirstBtn];
        }
        
        //右边第二个按钮
        if (rightSecond) {
            self.rightSecondBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
            UIImage *image = [UIImage imageNamed:rightSecond];
            self.rightSecondBtn.frame = CGRectMake(kScreenWidth-70, 7, 30, 30);
            if (image) {
                [self.rightSecondBtn setImage:[UIImage imageNamed:rightSecond] forState:(UIControlStateNormal)];
            } else {
                [self.rightSecondBtn setTitle:rightSecond forState:(UIControlStateNormal)];
                self.rightSecondBtn.titleLabel.font = [UIFont systemFontOfSize:15];
                [self.rightSecondBtn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];

            }
            [self.rightSecondBtn addTarget:self action:@selector(rightSecondBtnAction) forControlEvents:(UIControlEventTouchUpInside)];
            self.rightSecondBlock = rightSecondAction;
            [bottomView addSubview:self.rightSecondBtn];
        }
        
        if (rightThird) {
            self.rightThirdBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
            self.rightThirdBtn.frame = CGRectMake(kScreenWidth-105, 7, 30, 30);
            UIImage *image = [UIImage imageNamed:rightThird];
            if (image) {
                [self.rightThirdBtn setImage:[UIImage imageNamed:rightThird] forState:(UIControlStateNormal)];
            } else {
                [self.rightThirdBtn setTitle:rightSecond forState:(UIControlStateNormal)];
                self.rightThirdBtn.titleLabel.font = [UIFont systemFontOfSize:15];
                [self.rightThirdBtn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
            }
            [self.rightThirdBtn addTarget:self action:@selector(rightThirdBtnAction) forControlEvents:(UIControlEventTouchUpInside)];
            self.rightThirdBlock = rightThirdAction;
            [bottomView addSubview:self.rightThirdBtn];
        }
        
        
        
        
    }
    return self;
}



+ (instancetype)HBK_setupNavigationBarWithTitle:(NSString *)title {
    return [[self alloc] initWithTitle:title
                             leftFirst:nil
                    leftFirstBtnAction:nil
                            leftSecond:nil
                   leftSecondBtnAction:nil
                            rightFirst:nil
                   rightFirstBtnAction:nil
                           rightSecond:nil
                  rightSecondBtnAction:nil
                            rightThird:nil
                   rightThirdBtnAction:nil];
}



+ (instancetype)HBK_setupNavigationBarWithTitle:(NSString *)title
                                     backAction:(ClickBlock)back {
    return [[self alloc] initWithTitle:title
                             leftFirst:BackButtonImageName
                    leftFirstBtnAction:back
                            leftSecond:nil
                   leftSecondBtnAction:nil
                            rightFirst:nil
                   rightFirstBtnAction:nil
                           rightSecond:nil
                  rightSecondBtnAction:nil
                            rightThird:nil
                   rightThirdBtnAction:nil];
}


+ (instancetype)HBK_setupNavigationBarWithTitle:(NSString *)title
                                      leftFirst:(NSString *)leftFirst
                                leftFirstAction:(ClickBlock)leftFirstAction {
    return [[self alloc] initWithTitle:title
                             leftFirst:leftFirst
                    leftFirstBtnAction:leftFirstAction
                            leftSecond:nil
                   leftSecondBtnAction:nil
                            rightFirst:nil
                   rightFirstBtnAction:nil
                           rightSecond:nil
                  rightSecondBtnAction:nil
                            rightThird:nil
                   rightThirdBtnAction:nil];
}


+ (instancetype)HBK_setupNavigationBarWithTitle:(NSString *)title
                                      leftFirst:(NSString *)leftFirst
                                leftFirstAction:(ClickBlock)leftFirstAction
                                     leftSecond:(NSString *)leftSecond
                            leftSecondBtnAction:(ClickBlock)leftSecondAction {
    return [[self alloc] initWithTitle:title
                             leftFirst:leftFirst
                    leftFirstBtnAction:leftFirstAction
                            leftSecond:leftSecond
                   leftSecondBtnAction:leftSecondAction
                            rightFirst:nil
                   rightFirstBtnAction:nil
                           rightSecond:nil
                  rightSecondBtnAction:nil
                            rightThird:nil
                   rightThirdBtnAction:nil];
}

+ (instancetype)HBK_setupNavigationBarWithTitle:(NSString *)title
                                     rightFirst:(NSString *)rightFirst
                            rightFirstBtnAction:(ClickBlock)rightFirstAction {
    return [[self alloc] initWithTitle:title
                             leftFirst:nil
                    leftFirstBtnAction:nil
                            leftSecond:nil
                   leftSecondBtnAction:nil
                            rightFirst:rightFirst
                   rightFirstBtnAction:rightFirstAction
                           rightSecond:nil
                  rightSecondBtnAction:nil
                            rightThird:nil
                   rightThirdBtnAction:nil];
}

+ (instancetype)HBK_setupNavigationBarWithTitle:(NSString *)title
                                      leftFirst:(NSString *)leftFirst
                                leftFirstAction:(ClickBlock)leftFirstAction
                                     rightFirst:(NSString *)rightFirst
                            rightFirstBtnAction:(ClickBlock)rightFirstAction {
    return [[self alloc] initWithTitle:title
                             leftFirst:leftFirst
                    leftFirstBtnAction:leftFirstAction
                            leftSecond:nil
                   leftSecondBtnAction:nil
                            rightFirst:rightFirst
                   rightFirstBtnAction:rightFirstAction
                           rightSecond:nil
                  rightSecondBtnAction:nil
                            rightThird:nil
                  rightThirdBtnAction:nil];
}



+ (instancetype)HBK_setupNavigationBarWithTitle:(NSString *)title
                                     rightFirst:(NSString *)rightFirst
                            rightFirstBtnAction:(ClickBlock)rightFirstAction
                                    rightSecond:(NSString *)rightSecond
                           rightSecondBtnAction:(ClickBlock)rightSecondAction {
    return [[self alloc] initWithTitle:title
                             leftFirst:nil
                    leftFirstBtnAction:nil
                            leftSecond:nil
                   leftSecondBtnAction:nil
                            rightFirst:rightFirst
                   rightFirstBtnAction:rightFirstAction
                           rightSecond:rightSecond
                  rightSecondBtnAction:rightSecondAction
                            rightThird:nil
                   rightThirdBtnAction:nil];
}



+ (instancetype)HBK_setupNavigationBarWithTitle:(NSString *)title
                                      leftFirst:(NSString *)leftFirst
                                leftFirstAction:(ClickBlock)leftFirstAction
                                     rightFirst:(NSString *)rightFirst
                            rightFirstBtnAction:(ClickBlock)rightFirstAction
                                    rightSecond:(NSString *)rightSecond
                           rightSecondBtnAction:(ClickBlock)rightSecondAction {
    return [[self alloc] initWithTitle:title
                             leftFirst:leftFirst
                    leftFirstBtnAction:leftFirstAction
                            leftSecond:nil
                   leftSecondBtnAction:nil
                            rightFirst:rightFirst
                   rightFirstBtnAction:rightFirstAction
                           rightSecond:rightSecond
                  rightSecondBtnAction:rightSecondAction
                            rightThird:nil
                   rightThirdBtnAction:nil];

}

+ (instancetype)HBK_setupNavigationBarWithTitle:(NSString *)title
                                     backAction:(ClickBlock)back
                                     rightFirst:(NSString *)rightFirst
                            rightFirstBtnAction:(ClickBlock)rightFirstAction {

    return [[self alloc] initWithTitle:title
                             leftFirst:BackButtonImageName
                    leftFirstBtnAction:back
                            leftSecond:nil
                   leftSecondBtnAction:nil
                            rightFirst:rightFirst
                   rightFirstBtnAction:rightFirstAction
                           rightSecond:nil
                  rightSecondBtnAction:nil
                            rightThird:nil
                   rightThirdBtnAction:nil];

}



+ (instancetype)HBK_setupNavigationBarWithTitle:(NSString *)title
                                     backAction:(ClickBlock)back
                                     rightFirst:(NSString *)rightFirst
                            rightFirstBtnAction:(ClickBlock)rightFirstAction
                                    rightSecond:(NSString *)rightSecond
                           rightSecondBtnAction:(ClickBlock)rightSecondAction {
    return [[self alloc] initWithTitle:title
                             leftFirst:BackButtonImageName
                    leftFirstBtnAction:back
                            leftSecond:nil
                   leftSecondBtnAction:nil
                            rightFirst:rightFirst
                   rightFirstBtnAction:rightFirstAction
                           rightSecond:rightSecond
                  rightSecondBtnAction:rightSecondAction
                            rightThird:nil
                   rightThirdBtnAction:nil];
}


+ (instancetype)HBK_setupNavigationBarWithTitle:(NSString *)title
                                      leftFirst:(NSString *)leftFirst
                                leftFirstAction:(ClickBlock)leftFirstAction
                                     rightFirst:(NSString *)rightFirst
                            rightFirstBtnAction:(ClickBlock)rightFirstAction
                                    rightSecond:(NSString *)rightSecond
                           rightSecondBtnAction:(ClickBlock)rightSecondAction
                                     rightThird:(NSString *)rightThird
                            rightThirdBtnAction:(ClickBlock)rightThirdBtnAction {
    return [[self alloc] initWithTitle:title
                             leftFirst:leftFirst
                    leftFirstBtnAction:leftFirstAction
                            leftSecond:nil
                   leftSecondBtnAction:nil
                            rightFirst:rightFirst
                   rightFirstBtnAction:rightFirstAction
                           rightSecond:rightSecond
                  rightSecondBtnAction:rightSecondAction
                            rightThird:rightThird
                   rightThirdBtnAction:rightThirdBtnAction];
}



#pragma mark ------------  Action ------------------
- (void)leftFirstBtnAction {
    if (self.leftFirstBlock) {
        self.leftFirstBlock();
    }
}

- (void)leftSecondBtnAction {
    if (self.leftSecondBlock) {
        self.leftSecondBlock();
    }
}

- (void)rightFirstBtnAction {
    if (self.rightFirstBlock) {
        self.rightFirstBlock();
    }
}

- (void)rightSecondBtnAction {
    if (self.rightSecondBlock) {
        self.rightSecondBlock();
    }
}

- (void)rightThirdBtnAction {
    if (self.rightThirdBlock) {
        self.rightThirdBlock();
    }
}



@end




//-------------------------------- 动态向类中添加方法 ---------------------
#import "HBK_NavigationBar.h"
static const char NavgationBarkey = '\0';
@implementation UIViewController (NavigatiionBar)

- (void)setHbk_navgationBar:(HBK_NavigationBar *)hbk_navgationBar {
    if (self.hbk_navgationBar != hbk_navgationBar) {
        [self.hbk_navgationBar removeFromSuperview];
        [self.view addSubview:hbk_navgationBar];
        /**
         @param object#> 表示关联者，是一个对象，变量名理所当然也是object description#>
         @param key#> 获取被关联者的索引key description#>
         @param value#> 被关联者 description#>
         @param policy#> 关联时采用的协议，有assign，retain，copy等协议 description#>
         
         关键策略是一个枚举值。
         OBJC_ASSOCIATION_ASSIGN = 0,      <指定一个弱引用关联的对象>
         OBJC_ASSOCIATION_RETAIN_NONATOMIC = 1,<指定一个强引用关联的对象>
         OBJC_ASSOCIATION_COPY_NONATOMIC = 3,  <指定相关的对象复制>
         OBJC_ASSOCIATION_RETAIN = 01401,      <指定强参考>
         OBJC_ASSOCIATION_COPY = 01403    <指定相关的对象复制>
         */
        objc_setAssociatedObject(self, &NavgationBarkey, hbk_navgationBar, OBJC_ASSOCIATION_ASSIGN);
    }
}

- (HBK_NavigationBar *)hbk_navgationBar {
    return objc_getAssociatedObject(self, &NavgationBarkey);
}






@end

