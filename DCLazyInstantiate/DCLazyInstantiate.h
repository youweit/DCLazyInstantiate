//
//  DCLazyInstantiate.h
//  DCLazyInstantiate
//
//  Created by Youwei Teng on 7/15/15.
//  Copyright (c) 2015 dcard. All rights reserved.
//

#import <AppKit/AppKit.h>
#import "DCXcodeUtils.h"

@class DCLazyInstantiate;

static DCLazyInstantiate *sharedPlugin;

@interface DCLazyInstantiate : NSObject

AS_SINGLETON( DCLazyInstantiate );

- (id)initWithBundle:(NSBundle *)plugin;

@end