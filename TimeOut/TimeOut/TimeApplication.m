//
//  TimeApplication.m
//  TimeOut
//
//  Created by Tolecen on 13-10-11.
//  Copyright (c) 2013年 yooyee. All rights reserved.
//

#import "TimeApplication.h"
#import "AppDelegate.h"
@implementation TimeApplication

-(void)sendEvent:(UIEvent *)event
{
    [super sendEvent:event];
    if (!_idleTimer) {
        [self resetIdleTimer];
    }
    
    NSSet *allTouches = [event allTouches];
    if ([allTouches count]>0) {
        UITouchPhase phase = ((UITouch *)[allTouches anyObject]).phase;
        if (phase == UITouchPhaseBegan) {
            [self resetIdleTimer];
        }
    }
}

-(void)resetIdleTimer
{
    if (_idleTimer) {
        //执行此函数后，NSTime会释放掉
        [_idleTimer invalidate];
    }
    int timeOut = kApplicationTimeOutInMinutes;
    _idleTimer = [NSTimer scheduledTimerWithTimeInterval:timeOut target:self selector:@selector(idleTimerExceeded) userInfo:nil repeats:NO];
}

-(void)idleTimerExceeded
{
    /*出现问题的解决方案
     
     在appDelegate 中声明一个Bool类型的成员idle，当你想侦测用户在
     响应的视图中是否有动作的时候，就将其设置为Yes
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    if (appDelegate.idle) {
        //执行通知中心的动作
    }
    */
    [[NSNotificationCenter defaultCenter]postNotificationName:kApplicationDidTimeOut object:nil];
}
@end
