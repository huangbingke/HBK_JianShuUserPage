//
//  UIVew+SL.h
//  SPAHOME
//
//  Created by 吕超 on 15/4/7.
//  Copyright (c) 2015年 TooCMS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGSize  size;
@property (nonatomic, assign) CGPoint origin;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;

@property (nonatomic, assign, readonly) CGFloat halfHeight;
@property (nonatomic, assign, readonly) CGFloat halfWidth;
@property (nonatomic, assign) IBInspectable CGFloat cornerRadius;

/** 边框颜色 */
@property (nonatomic, strong) IBInspectable UIColor * borderColor;
/** 边框宽度 */
@property (nonatomic, assign) IBInspectable CGFloat borderWidth;
/** 最大 X */
@property (nonatomic, assign) CGFloat maxX;
/** 最大 Y */
@property (nonatomic, assign) CGFloat maxY;

- (void)setBorderWidth:(CGFloat)bWidth
           borderColor:(UIColor *)bColor;

- (void)setCornerRadius:(CGFloat)cornerRadius
            borderWidth:(CGFloat)bWidth
            borderColor:(UIColor *)bColor;

+ (instancetype)viewWithBgColor:(UIColor *)bgColor
                          frame:(CGRect)frame;

///  由子控件获取cell，只是cell的子控件才能调用
- (UITableViewCell *)getTableViewCellIfExsited;

///  创建很细分隔线
///
///  @param width 宽度
extern UIView * sl_makeDevider(CGFloat width);
extern UIView * sl_makeDeviderWithRGB  (CGFloat width,
                                        CGFloat rgb); // rgb一样的值（0 - 256）
extern UIView * sl_makeDeviderWithColor(CGFloat width,
                                        UIColor *color); // 传颜色
extern UIView * sl_makeDeviderWithRGB2 (CGFloat width,
                                        CGFloat red,
                                        CGFloat green,
                                        CGFloat blue); // 传rgb的色值（0 - 256）

///  创建view
///  由子类实现
+ (instancetype)creatView;

///  从xib中加载和类名一样的xib
+ (instancetype)creatViewFromNib;
///  从xib中加载view
///  @param aName xib名字
///  @param index 在xib数组中的索引
+ (instancetype)creatViewFromNibName:(NSString *)aName atIndex:(NSInteger)index;
@end





