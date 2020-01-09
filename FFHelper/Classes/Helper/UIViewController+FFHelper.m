//
//  UIViewController+FFHelper.m
//  ChameleonFramework
//
//  Created by 张玲玉 on 2019/8/9.
//

#import "UIViewController+FFHelper.h"

@implementation UIViewController (FFHelper)

+ (UIViewController *)ff_currentViewController
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    UIViewController *rootVC = window.rootViewController;
    UIViewController *curVC = nil;
    do {
        if ([rootVC isKindOfClass:[UINavigationController class]])
        {
            UINavigationController * nav = (UINavigationController *)rootVC;
            UIViewController * vc = [nav.viewControllers lastObject];
            curVC = vc;
            rootVC = vc.presentedViewController;
            continue;
        }
        else if([rootVC isKindOfClass:[UITabBarController class]])
        {
            UITabBarController *tabVC = (UITabBarController *)rootVC;
            curVC = tabVC;
            rootVC = [tabVC.viewControllers objectAtIndex:tabVC.selectedIndex];
            continue;
        }
    }
    while (rootVC!=nil);
    
    return curVC;
}

- (void)ff_popToViewController:(NSString *)vc
{
    Class class=NSClassFromString(vc);
    for (UIViewController *item in self.navigationController.viewControllers) {
        if ([item isKindOfClass:class]) {
            [self.navigationController popToViewController:item animated:YES];
            return;
        }
    }
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)ff_removeFromNavigationController
{
    NSString *vc=NSStringFromClass([self class]);
    [self ff_removeFromNavigationController:vc];
}
- (void)ff_removeFromNavigationController:(NSString *)vc
{
    Class class=NSClassFromString(vc);
    NSMutableArray *array=[[NSMutableArray alloc]initWithArray:self.navigationController.viewControllers];
    for (int i=0;i<array.count;i++) {
        UIViewController *vc = [array objectAtIndex:i];
        if (vc!=self && [vc isKindOfClass:class]) {
            [array removeObject:vc];
            self.navigationController.viewControllers=array;
            break;
        }
    }
}

@end
