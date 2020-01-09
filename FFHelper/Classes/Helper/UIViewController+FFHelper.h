//
//  UIViewController+FFHelper.h
//  ChameleonFramework
//
//  Created by 张玲玉 on 2019/8/9.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (FFHelper)

/**
 获取当前控制器
 */
+ (UIViewController *)ff_currentViewController;

/**
 调到指定页面
 */
- (void)ff_popToViewController:(NSString *)vc;

/**
 从导航菜单栏中移除
 */
- (void)ff_removeFromNavigationController;
- (void)ff_removeFromNavigationController:(NSString *)vc;


@end

NS_ASSUME_NONNULL_END
