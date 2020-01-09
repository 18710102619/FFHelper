//
//  NSObject+FFDictionarySafe.h
//  ChameleonFramework
//
//  Created by 张玲玉 on 2019/8/5.
//

#import <Foundation/Foundation.h>

@interface NSObject (FFDictionarySafe)

- (id _Nullable )ff_objectForKey:(NSString *_Nullable)aKey;

- (void)ff_setObject:(id _Nullable )anObject forKey:(id _Nullable )aKey;

- (NSString *_Nullable)ff_stringForKey:(NSString *_Nullable)key;

@end


