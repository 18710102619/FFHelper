//
//  NSDate+FFHelper.h
//  ChameleonFramework
//
//  Created by 张玲玉 on 2019/8/5.
//

#import <Foundation/Foundation.h>

#define FFDate [NSDate date]

#define kDateFormat_s @"yyyy-MM-dd HH:mm:ss"
#define kDateFormat_h @"yyyy-MM-dd HH"
#define kDateFormat_d @"yyyy-MM-dd"

@interface NSDate (FFHelper)
@property(nonatomic,assign)NSCalendarUnit calendar;
@property(nonatomic,strong)NSDateComponents *dateComponent;
@property(nonatomic,assign)NSInteger year;
@property(nonatomic,assign)NSInteger month;

/**
 时间转字符串
 */
+ (NSString *)ff_stringFromDate:(NSDate *)date dateFormat:(NSString *)dateFormat;
/**
 字符串转时间
 */
+ (NSDate *)ff_dateFromString:(NSString *)dateString dateFormat:(NSString *)dateFormat;
/**
 获取时间戳
 */
- (NSDateComponents *)ff_componentsWithFromDate:(NSDate *)fromData toDate:(NSDate *)toDate;

@end


