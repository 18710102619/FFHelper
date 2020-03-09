//
//  NSDate+FFHelper.m
//  ChameleonFramework
//
//  Created by 张玲玉 on 2019/8/5.
//

#import "NSDate+FFHelper.h"

@implementation NSDate (FFHelper)

- (NSCalendarUnit)calendar
{
     NSCalendarUnit calendar = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    return calendar;
}

- (NSDateComponents *)dateComponent
{
    NSDateComponents *dateComponent = [[NSCalendar currentCalendar] components:[self calendar] fromDate:[NSDate date]];
    return dateComponent;
}

- (NSInteger)year
{
    return [[self dateComponent] year];
}

- (NSInteger)month
{
    return [[self dateComponent] month];
}

+ (NSString *)ff_stringFromDate:(NSDate *)date dateFormat:(NSString *)dateFormat
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = dateFormat;
    NSString *dateString = [formatter stringFromDate:date];
    return dateString;
}

+ (NSDate *)ff_dateFromString:(NSString *)dateString dateFormat:(NSString *)dateFormat
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = dateFormat;
    NSDate *date = [formatter dateFromString:dateString];
    return date;
}

- (NSDateComponents *)ff_componentsWithFromDate:(NSDate *)fromData toDate:(NSDate *)toDate;
{
    NSDateComponents *components = [[NSCalendar currentCalendar] components:[self calendar] fromDate:fromData toDate:toDate options:0];
    return components;
}

@end
