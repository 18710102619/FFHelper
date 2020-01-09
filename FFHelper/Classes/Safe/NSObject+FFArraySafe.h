//
//  NSObject+FFArraySafe.h
//  ChameleonFramework
//
//  Created by 张玲玉 on 2019/8/5.
//

#import <Foundation/Foundation.h>

@interface NSObject (FFArraySafe)

- (id _Nullable )ff_objectAtIndex:(NSUInteger)index;

- (void)ff_addObject:(id _Nullable )anObject;

- (void)ff_addObjectsFromArray:(NSArray *_Nullable)otherArray;

@end

