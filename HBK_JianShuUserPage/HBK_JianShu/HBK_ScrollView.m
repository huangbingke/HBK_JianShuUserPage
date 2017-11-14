//
//  HBK_ScrollView.m
//  HBK_JianShuUserPage
//
//  Created by 黄冰珂 on 2017/11/14.
//  Copyright © 2017年 黄冰珂. All rights reserved.
//

#import "HBK_ScrollView.h"

@implementation HBK_ScrollView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)setOffset:(CGPoint)offset {
    _offset = offset;
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    UIView *view = [super hitTest:point withEvent:event];
    BOOL hitHead = point.y < (kHeaderViewHeight - self.offset.y);
    if (hitHead || !view) {
        self.scrollEnabled = NO;
        if (!view) {
            for (UIView* subView in self.subviews) {
                if (subView.frame.origin.x == self.contentOffset.x) {
                    view = subView;
                }
            }
        }
        return view;
    } else {
        self.scrollEnabled = YES;
        return view;
    }
}

@end
