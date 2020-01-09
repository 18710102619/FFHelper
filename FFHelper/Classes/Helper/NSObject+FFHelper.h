//
//  NSObject+FFHelper.h
//  ChameleonFramework
//
//  Created by 张玲玉 on 2019/9/11.
//

#import <Foundation/Foundation.h>

@interface NSObject (FFHelper)

/**
 json字符串转字典
 */
+ (NSDictionary *)ff_dictionaryWithString:(NSString *)json;

/**
 字典转json字符串
 */
+ (NSString *)ff_stringWithDictionary:(NSDictionary *)dict;

@end


