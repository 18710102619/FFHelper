//
//  NSObject+FFArraySafe.m
//  ChameleonFramework
//
//  Created by 张玲玉 on 2019/8/5.
//

#import "NSObject+FFArraySafe.h"

@implementation NSObject (FFArraySafe)

- (id)ff_objectAtIndex:(NSUInteger)index
{
    if ([self isKindOfClass:[NSArray class]]) {
        NSArray *array=(NSArray *)self;
        if (index < array.count) {
            return [array objectAtIndex:index];
        }
    }
    return nil;
}

- (void)ff_addObject:(id)anObject
{
    if ([self isKindOfClass:[NSMutableArray class]]) {
        NSMutableArray *array=(NSMutableArray *)self;
        if (anObject) {
            [array addObject:anObject];
        }
    }
}

- (void)ff_addObjectsFromArray:(NSArray *)otherArray
{
    if ([self isKindOfClass:[NSMutableArray class]]) {
        NSMutableArray *array=(NSMutableArray *)self;
        if (otherArray && [otherArray isKindOfClass:[NSArray class]] && otherArray.count>0) {
            [array addObjectsFromArray:otherArray];
        }
    }
}

@end
