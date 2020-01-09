//
//  NSObject+FFStringSafe.m
//  ChameleonFramework
//
//  Created by 张玲玉 on 2019/8/5.
//

#import "NSObject+FFStringSafe.h"

@implementation NSObject (FFStringSafe)

- (void)ff_insertString:(NSString *)aString atIndex:(NSUInteger)loc
{
    if ([self isKindOfClass:[NSMutableString class]]) {
        NSMutableString *str=(NSMutableString *)self;
        if (loc<str.length) {
            [str insertString:aString atIndex:loc];
        }
    }
}

- (NSString *)ff_substringWithRange:(NSRange)range
{
    if ([self isKindOfClass:[NSString class]]) {
        NSString *str=(NSString *)self;
        if (range.location+range.length<=str.length) {
            return [str substringWithRange:range];
        }
    }
    return nil;
}

- (NSString *)ff_substringToIndex:(NSUInteger)to
{
    if ([self isKindOfClass:[NSString class]]) {
        NSString *str=(NSString *)self;
        if (str.length>to) {
            return [str substringToIndex:to];
        }
        else {
            return str;
        }
    }
    return nil;
}

- (NSRange)ff_rangeOfString:(NSString *)searchString
{
    if ([self isKindOfClass:[NSString class]]) {
        NSString *str=(NSString *)self;
        return [str rangeOfString:searchString];
    }
    NSRange range = {0, 0};
    return range;
}

@end
