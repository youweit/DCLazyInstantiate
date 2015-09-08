//
//  DCSettingWindowController.m
//  DCLazyInstantiate
//
//  Created by Youwei Teng on 9/7/15.
//  Copyright (c) 2015 dcard. All rights reserved.
//

#import "DCLazyInstantiateConfig.h"
#import "DCSettingsWindowController.h"

@interface DCSettingsWindowController ()

@end

@implementation DCSettingsWindowController

- (void)windowDidLoad {
    [super windowDidLoad];

    NSDictionary *shortcut = [DCLazyInstantiateConfig keyShortcut];
    self.key.stringValue = shortcut[kMenuShortcutKey];
    self.mask.stringValue = shortcut[kMenuShortcutMask];
}

#pragma mark -
#pragma mark NSControlTextEditingDelegate

- (BOOL)control:(NSControl *)control textShouldEndEditing:(NSText *)fieldEditor {

    NSString *key = self.key.stringValue;
    NSString *mask = self.mask.stringValue;

    if (key && mask) {
        NSDictionary *shortcut = @{ @"mask" : mask,
                                    @"key" : key };
        [DCLazyInstantiateConfig setKeyShortcut:shortcut];
    }

    return YES;
}

@end
