//
//  UIView+FFHelper.h
//  ChameleonFramework
//
//  Created by 张玲玉 on 2019/8/2.
//

#import <UIKit/UIKit.h>

@interface UIView (FFHelper)

#pragma mark - 扩展属性

@property(nonatomic,assign)CGSize size;
@property(nonatomic,assign)CGPoint origin;

@property(nonatomic,assign)CGFloat x;
@property(nonatomic,assign)CGFloat y;

@property(nonatomic,assign)CGFloat width;
@property(nonatomic,assign)CGFloat height;

@property(nonatomic,assign)CGFloat centerX;
@property(nonatomic,assign)CGFloat centerY;

@property(nonatomic,assign,readonly)CGFloat maxX;
@property(nonatomic,assign,readonly)CGFloat maxY;

@property(nonatomic,strong,readonly)UIViewController *viewController;
@property(nonatomic,strong,readonly)UINavigationController *navigationController;

#pragma mark - SET

/**
 设置数字颜色
 */
- (void)ff_setNumColor:(UIColor *)color;
/**
 设置文本颜色
 */
- (void)ff_setTextColor:(UIColor *)color subtext:(NSString *)subtext;
/**
 设置字体间距
 */
- (void)ff_setLabelSpace:(CGFloat)lineSpacing;
/*
 设置正常字体间距
 */
- (void)ff_setNormalLabelSpace:(CGFloat)lineSpacing;
/**
 给顶部bar设置阴影
 */
- (void)ff_setTopBarShadow;
/**
 给底部bar设置阴影
 */
- (void)ff_setBottomBarShadow;
/**
 给底部btn设置阴影
 */
- (void)ff_setButtonShadow;
/**
 设置水平渐变颜色
 */
- (void)ff_setHorizontalGradientColors:(NSArray *)colors;
/**
 设置垂直渐变颜色
 */
- (void)ff_setVerticalGradientColors:(NSArray *)colors;
/**
 设置默认水平渐变颜色
 */
- (void)ff_setDefaultHorizontalGradientColor;

@end

