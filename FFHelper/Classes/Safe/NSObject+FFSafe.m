//
//  NSObject+FFSafe.m
//  Pods
//
//  Created by 张玲玉 on 2017/2/22.
//
//

#import "NSObject+FFSafe.h"

@implementation NSObject (FFSafe)

- (NSUInteger)ff_count
{
    if ([self isKindOfClass:[NSArray class]]) {
        NSArray *array=(NSArray *)self;
        return array.count;
    }
    else if ([self isKindOfClass:[NSDictionary class]]) {
        NSDictionary *dict=(NSDictionary *)self;
        return dict.count;
    }
    return 0;
}

- (NSUInteger)ff_length
{
    if ([self isKindOfClass:[NSString class]]) {
        NSString *str=(NSString *)self;
        return str.length;
    }
    return 0;
}
- (NSString *)ff_stringValue
{
    if (self==nil) {
        return @"";
    }
    else {
        return [NSString stringWithFormat:@"%@",self];
    }
}

- (id)ff_valueForKey:(NSString *)key
{
    if (key) {
        return [self valueForKey:key];
    }
    return nil;
}

- (void)ff_setValue:(id)value forKey:(NSString *)key
{
    if (value && key) {
        [self setValue:value forKey:key];
    }
}

- (void)ff_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(void *)context
{
    if (!observer || !keyPath.length) {
        return;
    }
    @try {
        [self addObserver:observer forKeyPath:keyPath options:options context:context];
    }
    @catch (NSException *exception) {
        NSLog(@"ff_addObserver ex: %@", [exception callStackSymbols]);
    }
}

- (void)ff_removeObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath
{
    if (!observer || !keyPath.length) {
        return;
    }
    @try {
        [self removeObserver:observer forKeyPath:keyPath];
    }
    @catch (NSException *exception) {
        NSLog(@"ff_RemoveObserver ex: %@", [exception callStackSymbols]);
    }
}

@end
