//
//  NSObject+FFDictionarySafe.m
//  ChameleonFramework
//
//  Created by 张玲玉 on 2019/8/5.
//

#import "NSObject+FFDictionarySafe.h"

@implementation NSObject (FFDictionarySafe)

- (id)ff_objectForKey:(NSString *)aKey
{
    if ([self isKindOfClass:[NSDictionary class]]) {
        NSDictionary *dict=(NSDictionary *)self;
        return [dict objectForKey:aKey];
    }
    return nil;
}

- (void)ff_setObject:(id)anObject forKey:(id)aKey
{
    if (anObject && aKey) {
        if ([self isKindOfClass:[NSMutableDictionary class]]) {
            NSMutableDictionary *dict=(NSMutableDictionary *)self;
            [dict setObject:anObject forKey:aKey];
        }
    }
}

- (NSString *)ff_stringForKey:(NSString *)key
{
    id value=[self ff_objectForKey:key];
    if (value==nil) {
        return @"";
    }
    else {
        return [NSString stringWithFormat:@"%@", value];
    }
}

@end
