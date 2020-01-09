//
//  UIColor+Hex.h
//  AFNetworking
//
//  Created by 张玲玉 on 2019/4/17.
//

#import <UIKit/UIKit.h>

@interface UIColor (FFHelper)

+ (UIColor *)colorWithHex:(long)hexColor;
+ (UIColor *)colorWithHex:(long)hexColor alpha:(float)alpha;

+ (UIColor *)colorWithHexString:(NSString *)color;
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

@end
