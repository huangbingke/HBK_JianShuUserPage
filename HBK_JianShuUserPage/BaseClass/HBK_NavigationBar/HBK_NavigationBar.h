//
//  HBK_NavigationBar.h
//  CustomNavigationBarDemo
//
//  Created by 黄冰珂 on 2017/8/3.
//  Copyright © 2017年 黄冰珂. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ClickBlock)();

@interface HBK_NavigationBar : UIView

/* 
 标题
 */
@property (nonatomic, strong) UILabel *titleLabel;

/* 
 最左边按钮 
 */
@property (nonatomic, strong) UIButton *leftFirstBtn;

/* 
 左边第二个按钮 
 */
@property (nonatomic, strong) UIButton *leftSecondBtn;

/* 
 最右边item 
 */
@property (nonatomic, strong) UIButton *rightFirstBtn;

/* 
 右边第二个item 
 */
@property (nonatomic, strong) UIButton *rightSecondBtn;


/**
 右边第三个item
 */
@property (nonatomic, strong) UIButton *rightThirdBtn;


/* 
 背景图片 
 */
@property (nonatomic, strong) UIImage *backgroundImage;

/*
 背景颜色
 */
@property (nonatomic, strong) UIColor *bgColor;

/*
 标题
 */
@property (nonatomic, copy) NSString *title;
 
/*
 标题字体大小
 */
@property (nonatomic, strong) UIFont *font;

/*
 标题颜色
 */
@property (nonatomic, strong) UIColor *titleColor;

/*
 导航栏下面的线
 */
@property (nonatomic, strong) CALayer * deviderLayer;



/**
 只有标题的navigationBar
 @param title 标题
 @return 导航栏
 */
+ (instancetype)HBK_setupNavigationBarWithTitle:(NSString *)title;


/**
 标题  ---> 返回按钮
 @param title 标题
 @param back 返回按钮
 @return 导航栏
 */
+ (instancetype)HBK_setupNavigationBarWithTitle:(NSString *)title
                                     backAction:(ClickBlock)back;


/**
 标题  ---> 左边一个按钮

 @param title 标题
 @param leftFirst 图片名字
 @param leftAction 按钮事件
 @return 导航栏
 */
+ (instancetype)HBK_setupNavigationBarWithTitle:(NSString *)title
                                      leftFirst:(NSString *)leftFirst
                                leftFirstAction:(ClickBlock)leftAction;



/**
 标题  ----> 左边两个按钮

 @param title 标题
 @param leftFirst 左边第一个按钮图片
 @param leftFirstAction 左边第一个按钮事件
 @param leftSecond 左边第二个按钮图片
 @param leftSecondAction 左边第二个按钮
 @return 导航栏
 */
+ (instancetype)HBK_setupNavigationBarWithTitle:(NSString *)title
                                      leftFirst:(NSString *)leftFirst
                                leftFirstAction:(ClickBlock)leftFirstAction
                                     leftSecond:(NSString *)leftSecond
                            leftSecondBtnAction:(ClickBlock)leftSecondAction;





/**
 标题  ----> 左边一个按钮 ---> 右边一个按钮

 @param title 标题
 @param leftFirst 左边图片名
 @param leftFirstAction 左边事件
 @param rightFirst 右边图片名
 @param rightFirstAction 右边事件
 @return 导航栏
 */
+ (instancetype)HBK_setupNavigationBarWithTitle:(NSString *)title
                                      leftFirst:(NSString *)leftFirst
                                leftFirstAction:(ClickBlock)leftFirstAction
                                     rightFirst:(NSString *)rightFirst
                            rightFirstBtnAction:(ClickBlock)rightFirstAction;



/**
 标题  -----> 右边一个
 
 @param title 标题
 @param rightFirst 右边第一个图片
 @param rightFirstAction 右边第一个事件
 @return 导航栏
 */
+ (instancetype)HBK_setupNavigationBarWithTitle:(NSString *)title
                                     rightFirst:(NSString *)rightFirst
                            rightFirstBtnAction:(ClickBlock)rightFirstAction;



/**
 标题  -----> 右边两个

 @param title 标题
 @param rightFirst 右边第一个图片
 @param rightFirstAction 右边第一个事件
 @param rightSecond 右边第二个图片
 @param rightSecondAction 右边第二个事件
 @return 导航栏
 */
+ (instancetype)HBK_setupNavigationBarWithTitle:(NSString *)title
                                     rightFirst:(NSString *)rightFirst
                            rightFirstBtnAction:(ClickBlock)rightFirstAction
                                    rightSecond:(NSString *)rightSecond
                           rightSecondBtnAction:(ClickBlock)rightSecondAction;





/**
 标题 左边一个, 右边两个

 @param title 标题
 @param leftFirst 左边第一个图片
 @param leftFirstAction 左边第一个事件
 @param rightFirst 右边第一个图片
 @param rightFirstAction 右边第一个事件
 @param rightSecond 右边第二个图片
 @param rightSecondAction 右边第二个事件
 @return 导航栏
 */
+ (instancetype)HBK_setupNavigationBarWithTitle:(NSString *)title
                                      leftFirst:(NSString *)leftFirst
                                leftFirstAction:(ClickBlock)leftFirstAction
                                     rightFirst:(NSString *)rightFirst
                            rightFirstBtnAction:(ClickBlock)rightFirstAction
                                    rightSecond:(NSString *)rightSecond
                           rightSecondBtnAction:(ClickBlock)rightSecondAction;



/**
 标题  ---> 返回按钮 右边一个按钮
 @param title 标题
 @param back 返回按钮
 @param rightFirst 右边第一个图片
 @param rightFirstAction 右边第一个事件
 @return 导航栏
 */
+ (instancetype)HBK_setupNavigationBarWithTitle:(NSString *)title
                                     backAction:(ClickBlock)back
                                     rightFirst:(NSString *)rightFirst
                            rightFirstBtnAction:(ClickBlock)rightFirstAction;



/**
 标题  ---> 返回按钮 右边两个按钮
 @param title 标题
 @param back 返回按钮
 @param rightFirst 右边第一个图片
 @param rightFirstAction 右边第一个事件
 @param rightSecond 右边第二个图片
 @param rightSecondAction 右边第二个事件
 @return 导航栏
 */
+ (instancetype)HBK_setupNavigationBarWithTitle:(NSString *)title
                                     backAction:(ClickBlock)back
                                     rightFirst:(NSString *)rightFirst
                            rightFirstBtnAction:(ClickBlock)rightFirstAction
                                    rightSecond:(NSString *)rightSecond
                           rightSecondBtnAction:(ClickBlock)rightSecondAction;



/**
 标题  ---> 返回按钮 右边三个按钮

 @param title 标题
 @param leftFirst 返回按钮图片
 @param leftFirstAction 返回按钮事件
 @param rightFirst 右边第一个图片
 @param rightFirstAction 右边第一个事件
 @param rightSecond 右边第二个图片
 @param rightSecondAction 右边第二个事件
 @param rightThird 右边第三个图片
 @param rightThirdBtnAction 右边第三个事件
 @return 导航栏
 */
+ (instancetype)HBK_setupNavigationBarWithTitle:(NSString *)title
                                      leftFirst:(NSString *)leftFirst
                                leftFirstAction:(ClickBlock)leftFirstAction
                                     rightFirst:(NSString *)rightFirst
                            rightFirstBtnAction:(ClickBlock)rightFirstAction
                                    rightSecond:(NSString *)rightSecond
                           rightSecondBtnAction:(ClickBlock)rightSecondAction
                                     rightThird:(NSString *)rightThird
                            rightThirdBtnAction:(ClickBlock)rightThirdBtnAction;


@end




@class HBK_NavigationBar;

@interface UIViewController (NavigatiionBar)

@property (nonatomic, strong) HBK_NavigationBar * hbk_navgationBar;

@end









