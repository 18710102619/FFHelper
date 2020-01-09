//
//  FFFPSLabel.m
//  FFKit
//
//  Created by 张玲玉 on 2018/9/10.
//

#import "FFFPSLabel.h"

@implementation FFFPSLabel
{
    CADisplayLink *_link;
    NSUInteger _count;
    NSTimeInterval _lastTime;
}

- (void)dealloc
{
    [_link invalidate];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithWhite:0.000 alpha:0.700];
        self.layer.cornerRadius = 5;
        self.clipsToBounds = YES;
        self.textAlignment = NSTextAlignmentCenter;
        self.userInteractionEnabled = NO;
        self.font=[UIFont fontWithName:@"Menlo" size:14];
        self.textColor=[UIColor magentaColor];
        
        _link=[CADisplayLink displayLinkWithTarget:[FFWeakProxy proxyWithTarget:self] selector:@selector(tick:)];
        [_link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    }
    
    return self;
}

- (void)tick:(CADisplayLink *)link
{
    if (_lastTime==0) {
        _lastTime=link.timestamp;
        return;
    }
    _count++;
    NSTimeInterval delta=link.timestamp-_lastTime;
    if (delta<1) {
        return;
    }
    float fps=_count/delta;
    NSString *title = [NSString stringWithFormat:@"%d FPS",(int)round(fps)];
    
    UIColor *color = [UIColor colorWithHue:0.27 * (fps / 60.0 - 0.2) saturation:1 brightness:0.9 alpha:1];
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:title];
    [str addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(0,title.length-3)];
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(title.length-3,3)];
    self.attributedText=str;
    
    _lastTime=link.timestamp;
    _count=0;
}

@end
