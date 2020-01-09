//
//  FFWeakProxy.h
//  FFKit
//
//  Created by 张玲玉 on 2018/9/10.
//

#import <Foundation/Foundation.h>

@interface FFWeakProxy : NSProxy

@property (nonatomic, weak, readonly, nullable) id target;

+ (instancetype)proxyWithTarget:(id)target;

@end
