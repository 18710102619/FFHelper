//
//  NSObject+FFStringSafe.h
//  ChameleonFramework
//
//  Created by 张玲玉 on 2019/8/5.
//

#import <Foundation/Foundation.h>

@interface NSObject (FFStringSafe)

- (void)ff_insertString:(NSString *_Nullable)aString atIndex:(NSUInteger)loc;

- (NSString *_Nullable)ff_substringWithRange:(NSRange)range;

- (NSString *_Nullable)ff_substringToIndex:(NSUInteger)to;

- (NSRange)ff_rangeOfString:(NSString *)searchString;

@end

