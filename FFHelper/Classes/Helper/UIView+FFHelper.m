//
//  UIView+FFHelper.m
//  ChameleonFramework
//
//  Created by 张玲玉 on 2019/8/2.
//

#import "UIView+FFHelper.h"
#import "UIColor+FFHelper.h"

@implementation UIView (FFHelper)

#pragma mark - 扩展属性

- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)size
{
    return self.frame.size;
}

- (void)setOrigin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGPoint)origin
{
    return self.frame.origin;
}

- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)x
{
    return self.origin.x;
}

- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)y
{
    return self.origin.y;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)width
{
    return self.size.width;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height
{
    return self.size.height;
}

- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (CGFloat)centerX
{
    return self.center.x;
}

- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)centerY
{
    return self.center.y;
}

- (CGFloat)maxX
{
    return self.frame.origin.x+self.size.width;
}

- (CGFloat)maxY
{
    return self.frame.origin.y+self.size.height;
}

- (UIViewController *)viewController
{
    UIResponder *responder = self.nextResponder;
    do {
        if ([responder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)responder;
        }
        responder = responder.nextResponder;
    }
    while (responder);
    return nil;
}

- (UINavigationController *)navigationController
{
    UIViewController *vc=self.viewController;
    if (vc) {
        return vc.navigationController;
    }
    return nil;
}

#pragma mark - SET

- (void)ff_setNumColor:(UIColor *)color
{
    if ([self isKindOfClass:[UILabel class]]) {
        UILabel *label=(UILabel *)self;
        NSString *text=label.text;
        if (text==nil||text.length==0) {
            return;
        }
        NSMutableAttributedString *str=[[NSMutableAttributedString alloc]initWithString:text];
        
        NSArray *number = @[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"+"];
        for (int i = 0; i < text.length; i ++) {
            NSString *num = [text substringWithRange:NSMakeRange(i, 1)];
            if ([number containsObject:num]) {
                [str setAttributes:@{NSForegroundColorAttributeName:color}range:NSMakeRange(i, 1)];
            }
        }
        label.attributedText = str;
    }
}

- (void)ff_setTextColor:(UIColor *)color subtext:(NSString *)subtext
{
    NSString *text=nil;
    if ([self isKindOfClass:[UILabel class]]) {
        UILabel *label=(UILabel *)self;
        text=label.text;
    }
    if ([self isKindOfClass:[UIButton class]]) {
        UIButton *btn=(UIButton *)self;
        text=btn.titleLabel.text;
    }
    if (text==nil || text.length==0) {
        return;
    }
    
    NSMutableAttributedString *str=[[NSMutableAttributedString alloc]initWithString:text];
    NSRange range1=[[str string]rangeOfString:subtext];
    [str addAttribute:NSForegroundColorAttributeName value:color range:range1];
    
    if ([self isKindOfClass:[UILabel class]]) {
        UILabel *label=(UILabel *)self;
        label.attributedText=str;
    }
    if ([self isKindOfClass:[UIButton class]]) {
        UIButton *btn=(UIButton *)self;
        btn.titleLabel.attributedText=str;
    }
}

- (void)ff_setLabelSpace:(CGFloat)lineSpacing
{
    if ([self isKindOfClass:[UILabel class]]) {
        UILabel *label=(UILabel *)self;
        NSString *text=label.text;
        if (text==nil||text.length==0) {
            return;
        }
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        [paragraphStyle setLineSpacing:lineSpacing];
        [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [text length])];
        label.attributedText = attributedString;
        label.lineBreakMode = NSLineBreakByTruncatingTail;
        [label sizeToFit];
    }
}
- (void)ff_setNormalLabelSpace:(CGFloat)lineSpacing
{
    if ([self isKindOfClass:[UILabel class]]) {
        UILabel *label=(UILabel *)self;
        NSString *text=label.text;
        if (text==nil||text.length==0) {
            return;
        }
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        [paragraphStyle setLineSpacing:lineSpacing];
        [paragraphStyle setAlignment:NSTextAlignmentCenter];
        [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [text length])];
        label.attributedText = attributedString;
        label.lineBreakMode = NSLineBreakByTruncatingTail;
        [label sizeToFit];
    }
}

- (void)ff_setTopBarShadow
{
    if (self.backgroundColor==nil) {
        self.backgroundColor=[UIColor whiteColor];
    }
    self.layer.shadowColor=[UIColor blackColor].CGColor;
    self.layer.shadowOffset=CGSizeMake(0,2);
    self.layer.shadowOpacity=0.04;
}

- (void)ff_setBottomBarShadow
{
    if (self.backgroundColor==nil) {
        self.backgroundColor=[UIColor whiteColor];
    }
    self.layer.shadowColor=[UIColor blackColor].CGColor;
    self.layer.shadowOffset=CGSizeMake(0,-2);
    self.layer.shadowOpacity=0.04;
}

- (void)ff_setButtonShadow;
{
    if (self.backgroundColor==nil) {
        self.backgroundColor=[UIColor whiteColor];
    }
    self.layer.shadowColor=[UIColor colorWithHex:0xff4153].CGColor;
    self.layer.shadowOffset=CGSizeMake(0,7);
    self.layer.shadowOpacity=0.3;
}

- (void)ff_setHorizontalGradientColors:(NSArray *)colors
{
    CAGradientLayer *gradient=[CAGradientLayer layer];
    gradient.frame=self.bounds;
    gradient.colors= colors;
    gradient.startPoint = CGPointMake(0, 0);
    gradient.endPoint = CGPointMake(1, 0);
    [self.layer addSublayer:gradient];
}

- (void)ff_setVerticalGradientColors:(NSArray *)colors
{
    CAGradientLayer *gradient=[CAGradientLayer layer];
    gradient.frame=self.bounds;
    gradient.colors= colors;
    gradient.startPoint = CGPointMake(0, 0);
    gradient.endPoint = CGPointMake(0, 1);
    [self.layer addSublayer:gradient];
}

- (void)ff_setDefaultHorizontalGradientColor
{
    [self ff_setHorizontalGradientColors:@[(id)[UIColor colorWithHex:0xff995c].CGColor,(id)[UIColor colorWithHex:0xff1b3d].CGColor]];
}

@end
