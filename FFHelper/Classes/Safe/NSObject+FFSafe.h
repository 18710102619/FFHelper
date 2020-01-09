//
//  NSObject+FFSafe.h
//  Pods
//
//  Created by 张玲玉 on 2017/2/22.
//
//

#import <Foundation/Foundation.h>

@interface NSObject (FFSafe)

@property (readonly) NSUInteger ff_count;
@property (readonly) NSUInteger ff_length;
@property (readonly, copy) NSString *ff_stringValue;

- (id _Nullable )ff_valueForKey:(NSString *_Nullable)key;

- (void)ff_setValue:(id _Nullable )value forKey:(NSString *_Nullable)key;

- (void)ff_addObserver:(NSObject *_Nullable)observer forKeyPath:(NSString *_Nullable)keyPath options:(NSKeyValueObservingOptions)options context:(void *_Nullable)context;

- (void)ff_removeObserver:(NSObject *_Nullable)observer forKeyPath:(NSString *_Nullable)keyPath;

@end




