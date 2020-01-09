//
//  YCGMacros.h
//  YCGMacrosKit
//
//  Created by 58mac on 2018/4/2.
//

#ifndef YCGMacros_h
#define YCGMacros_h

// 修改系统 NSLog
#ifdef DEBUG
#define NSLog(...) printf("[%s] %s [第%d行]: %s\n", __TIME__, __PRETTY_FUNCTION__, __LINE__, [[NSString stringWithFormat:__VA_ARGS__] UTF8String])
#else
#define NSLog(...)
#endif

// 判断系统版本
#define kSystemVersion ([UIDevice currentDevice].systemVersion.floatValue)
#define kIS_iOS8 (kSystemVersion >= 8.0 && kSystemVersion < 9.0)
#define kIS_iOS9 (kSystemVersion >= 9.0 && kSystemVersion < 10.0)
#define kIS_iOS10 (kSystemVersion >= 10.0 && kSystemVersion < 11.0)
#define kIS_iOS11 (kSystemVersion >= 11.0 && kSystemVersion < 12.0)
#define kIS_iOS12 (kSystemVersion >= 12.0)

// 获取屏幕宽度
#define kMainScreenWidth ([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)] ? ([UIScreen mainScreen].nativeBounds.size.width / [UIScreen mainScreen].nativeScale) : [UIScreen mainScreen].bounds.size.width)
// 获取屏幕高度
#define kMainScreenHeight ([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)] ? ([UIScreen mainScreen].nativeBounds.size.height / [UIScreen mainScreen].nativeScale) : [UIScreen mainScreen].bounds.size.height)
// 获取屏幕尺寸
#define kMainScreenSize ([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)] ? CGSizeMake([UIScreen mainScreen].nativeBounds.size.width / [UIScreen mainScreen].nativeScale, [UIScreen mainScreen].nativeBounds.size.height / [UIScreen mainScreen].nativeScale) : [UIScreen mainScreen].bounds.size)

// 获取 状态栏 高度
#define kStatusBarHeight (kIS_iPhoneX ? 44.0f : 20.0f)
// 获取 导航栏 高度
#define kNavigationBarHeight 44.0f
// 获取 状态栏+导航栏 高度
#define kStatusBarAndNavigationBarHeight (kIS_iPhoneX ? 88.0f : 64.0f)
// 获取 Tabbar 高度
#define kTabbarHeight (kIS_iPhoneX ? (49.0f+34.0f) : 49.0f)
// 获取 BottonBar 高度
#define kBottonBarHeight 49.0f
// 获取底部 Margin 高度
#define kTabbarSafeBottomMargin (kIS_iPhoneX ? 34.0f : 0.0f)

// 获取随机颜色
#define kRandomColor [UIColor colorWithRed:arc4random_uniform(256) / 255.0f green:arc4random_uniform(256) / 255.0f blue:arc4random_uniform(256) / 255.0f alpha:1.0f]

// 获取 RGB 颜色
#define kRGBColor(red, green, blue) [UIColor colorWithRed:(red) / 255.0f green:(green) / 255.0f blue:(blue) / 255.0f alpha:1.0f]
// 获取 RGBA 颜色
#define kRGBAColor(red, green, blue, alpha) [UIColor colorWithRed:(red) / 255.0f green:(green) / 255.0f blue:(blue) / 255.0f alpha:alpha]

// 从 rgbValue Hex 获取颜色 16进制->10进制
#define kColorFromRGBValue(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0f green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0f blue:((float)(rgbValue & 0xFF)) / 255.0f alpha:1.0f]
// 从 rgbaValue Hex 获取颜色 16进制->10进制
#define kColorFromRGBAValue(rgbaValue, alpha) [UIColor colorWithRed:((float)((rgbaValue & 0xFF0000) >> 16)) / 255.0f green:((float)((rgbaValue & 0xFF00) >> 8)) / 255.0f blue:((float)(rgbaValue & 0xFF)) / 255.0f alpha:alpha]

// iPhone 4 或 iPhone 4s
#define kIS_iPhone4 (fabs((double)[[UIScreen mainScreen] bounds].size.height - (double)480.0f) < DBL_EPSILON)
// iPhone 5 或 iPhone 5s 或 iPhone 5c 或 iPhone SE
#define kIS_iPhone5 (fabs((double)[[UIScreen mainScreen] bounds].size.height - (double)568.0f) < DBL_EPSILON)
// iPhone 6 或 iPhone 6s 或 iPhone 7 或 iPhone 8
#define kIS_iPhone6 (fabs((double)[[UIScreen mainScreen] bounds].size.height - (double)667.0f) < DBL_EPSILON)
// iPhone 6 Plus 或 iPhone 6s Plus 或 iPhone 7Plus 或 iPhone 8Plus
#define kIS_iPhonePlus (fabs((double)[[UIScreen mainScreen] bounds].size.height - (double)736.0f) < DBL_EPSILON)
// iPhone X 或 iPhone Xs 或 iPhone Xs Max
#define kIS_iPhoneX ((([[UIScreen mainScreen] bounds].size.height) == 812.0f || ([[UIScreen mainScreen] bounds].size.height) == 896.0f) ? 1 : 0)

// weakifySelf
#define kWeakSelf @weakify(self)
// strongifySelf
#define kStrongSelf @strongify(self)

// weakifyObject
#define kWeakObject(...) @weakify(__VA_ARGS__)
// strongifyObject
#define kStrongObject(...) @strongify(__VA_ARGS__)

//主线程安全切换
#ifndef dispatch_main_async_safe
#define dispatch_main_async_safe(block)\
    if (strcmp(dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL), dispatch_queue_get_label(dispatch_get_main_queue())) == 0) {\
        block();\
    } else {\
        dispatch_async(dispatch_get_main_queue(), block);\
    }
#endif

#endif /* YCGMacros_h */
