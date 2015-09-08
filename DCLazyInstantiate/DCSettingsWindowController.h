//
//  DCSettingWindowController.h
//  DCLazyInstantiate
//
//  Created by Youwei Teng on 9/8/15.
//  Copyright (c) 2015 dcard. All rights reserved.
//

@interface DCSettingsWindowController : NSWindowController<NSTextFieldDelegate>

@property (nonatomic, strong) IBOutlet NSTextField * mask;
@property (nonatomic, strong) IBOutlet NSTextField * key;

@end
