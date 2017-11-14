//
//  HBK_SliderTitleView.m
//  HBK_JianShuUserPage
//
//  Created by 黄冰珂 on 2017/11/14.
//  Copyright © 2017年 黄冰珂. All rights reserved.
//

#import "HBK_SliderTitleView.h"
@interface HBK_SliderTitleView ()

@property (nonatomic, strong) UIView *sliderView;
@property (nonatomic, weak) UIButton *selectedButton;

@end
@implementation HBK_SliderTitleView

- (void)titleButtonClicked:(UIButton *)button {
    _selectedIndex = button.tag;
    if (self.selectedButton) {
        self.selectedButton.selected = YES;
    }
    button.selected = NO;
    self.selectedButton = button;
    
    if (self.buttonSelected) {
        self.buttonSelected(button.tag);
    }
    
    NSString* title = self.titles[button.tag];
    CGFloat sliderWidth = button.titleLabel.font.pointSize * title.length;
    [self.sliderView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(sliderWidth);
        make.height.mas_equalTo(2);
        make.centerX.equalTo(button);
        make.bottom.equalTo(self).offset(-2);
    }];
    [UIView animateWithDuration:0.25 animations:^{
        [self layoutIfNeeded];
    }];
}

- (void)setSelectedIndex:(NSInteger)selectedIndex {
    _selectedIndex = selectedIndex;
    UIButton* button = self.subviews[selectedIndex];
    [self titleButtonClicked:button];
}

- (void)setTitles:(NSArray *)titles {
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    _titles = titles;
    CGFloat width = [UIScreen mainScreen].bounds.size.width / titles.count;
    
    for ( int i = 0; i<titles.count; i++ ) {
        UIButton* titleButton = [self titleButton:titles[i]];
        titleButton.tag = i;
        [self addSubview:titleButton];
        [titleButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.equalTo(self);
            make.left.equalTo(self).offset(width * i);
            make.width.mas_equalTo(width);
        }];
        if (i != 0) {
            titleButton.selected = YES;
        } else {
            self.selectedButton = titleButton;
        }
    }
    UIButton *button = self.subviews[0];
    NSString *title = titles[0];
    CGFloat sliderWidth = button.titleLabel.font.pointSize * title.length;
    [self addSubview:self.sliderView];
    [self.sliderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(sliderWidth);
        make.height.mas_equalTo(4);
        make.centerX.equalTo(button);
        make.bottom.equalTo(self).offset(-3);
    }];
    [self layoutIfNeeded];
    
}

- (UIButton *)titleButton:(NSString *)title {
    UIButton* titleButton = [[UIButton alloc] init];
    [titleButton addTarget:self action:@selector(titleButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    titleButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [titleButton setTitleColor:kThemeColor forState:UIControlStateNormal];
    [titleButton setTitleColor:[UIColor grayColor] forState:UIControlStateSelected];
    [titleButton setTitle:title forState:UIControlStateNormal];
    return titleButton;
}

- (void)drawRect:(CGRect)rect {
    [self makelineStartPoint:self.sliderView.maxY+2 andEndPoint:self.sliderView.maxY+2];
    //    [self makelineStartPoint:self.selectedButton.y+2 andEndPoint:self.selectedButton.y+2];
}

- (void)makelineStartPoint:(CGFloat)statPoint andEndPoint:(CGFloat)endPoint {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextSetLineWidth(context, 0.5);  //线宽
    CGContextSetAllowsAntialiasing(context, true);
    CGContextSetStrokeColorWithColor(context, [UIColor grayColor].CGColor);
    CGContextBeginPath(context);
    
    CGContextMoveToPoint(context, 0, statPoint);  //起点坐标
    CGContextAddLineToPoint(context, self.frame.size.width, endPoint);   //终点坐标
    CGContextStrokePath(context);
}

- (UIView *)sliderView {
    if (!_sliderView) {
        UIView* sliderView = [[UIView alloc] init];
        sliderView.backgroundColor = kThemeColor;
        sliderView.layer.cornerRadius = 2;
        sliderView.clipsToBounds = YES;
        _sliderView = sliderView;
    }
    return _sliderView;
}


@end
