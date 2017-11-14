//
//  Header.h
//  HBK_JianShuUserPage
//
//  Created by 黄冰珂 on 2017/11/14.
//  Copyright © 2017年 黄冰珂. All rights reserved.
//

#ifndef Header_h
#define Header_h


#define kHeaderViewHeight    kFit(250)
#define kTitleHeight         kFit(40)

#pragma mark --------------------- 尺寸 ----------------------------
//屏幕的宽度
#define kScreenWidth            [[UIScreen mainScreen] bounds].size.width

//屏幕的高度
#define kScreenHeight           [[UIScreen mainScreen] bounds].size.height


//打包和结算的高度
#define kAllBarHeight           40

//导航栏高度
#define kNavBarHeight           (kScreenHeight == 812 ? 88 : 64)

//tabBar高度
#define kTabBarHeight           (kScreenHeight == 812 ? 83 : 49)

//NavigationBar和TabBar的高度
#define kNBarTBarHeight         (kNavBarHeight + kTabBarHeight)

//如果是iPhoneX 底部留空隙34, 如果不是空隙为0
#define kIPhoneXBottomHeight    (kScreenHeight == 812 ? 34 : 0)

//比例 以iPhone6 为基准
#define kRatio kScreenWidth/375

//按比例适配
#define kFit(num)                 kRatio * (num)

//打印api
#define KMyLog(...)               NSLog(__VA_ARGS__)



#pragma mark --------------->>  颜色 <<-------------------
//随机颜色
#define kRandomColor  [UIColor colorWithRed:arc4random() % 256 / 255. green:arc4random() % 256 / 255. blue:arc4random() % 256 / 255. alpha:1]

//自定义颜色
#define kColor(r, g, b)         [UIColor colorWithRed:(r)/256.0 green:(g)/256.0 blue:(b)/256.0 alpha:1.0]

#define RGBColor2(r, g, b, a)   [UIColor colorWithRed:(r) / 255.0 green:(g) / 255.0 blue:(b) / 255.0 alpha:(a)]

//十六进制数 转UIColor
#define kColorFromRGBHexi(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define HexColorInt32_t(rgbValue) \
[UIColor colorWithRed:((float)((0x##rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((0x##rgbValue & 0x00FF00) >> 8))/255.0 blue:((float)(0x##rgbValue & 0x0000FF))/255.0  alpha:1]
//主题颜色
#define kThemeColor  kColorFromRGBHexi(0xe01028)


#pragma mark  -----------------------  Other  ----------------------
//将其他类型转换为字符串
#define kSTR(string)                    [NSString stringWithFormat:@"%@", string]

#define kUserDefaults                   [NSUserDefaults standardUserDefaults]

#define ShareApplicationDelegate        [[UIApplication sharedApplication] delegate]

#define IOS_FSystenVersion              ([[[UIDevice currentDevice] systemVersion] floatValue])

//字号
#define kFont(size)                     [UIFont systemFontOfSize:size]

#define kURL(urlStr)                    [NSURL URLWithString:urlStr]

#define kImage(image)                   [UIImage imageNamed:image]


#define kShowError(message) [MBProgressHUD showError:(message)]
#define kShowSuccess(message)[MBProgressHUD showSuccess:message];


#define WEAK  @weakify(self);

#define STRONG  @strongify(self);

#define kWeakSelf(type)__weak typeof(type)weak##type = type;

#define kStrongSelf(type)__strong typeof(type)type = weak##type;

















#endif /* Header_h */
