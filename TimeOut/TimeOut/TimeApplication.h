//
//  TimeApplication.h
//  TimeOut
//
//  Created by Tolecen on 13-10-11.
//  Copyright (c) 2013年 yooyee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

//响应事件的时间 秒数
#define kApplicationTimeOutInMinutes 5

//通知中心的事件
#define kApplicationDidTimeOut @"kApplicationDidTimeOut"

@interface TimeApplication : UIApplication
{
    NSTimer *_idleTimer;
}

-(void)resetIdleTimer;

@end
