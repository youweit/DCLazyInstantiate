//
//  DCLazyInstantiateConfig.h
//  DCLazyInstantiate
//
//  Created by Youwei Teng on 9/8/15.
//  Copyright (c) 2015 dcard. All rights reserved.
//

#import <Foundation/Foundation.h>

//dictionary key for user settings
#define kMenuShortcutKey       @"key"
#define kMenuShortcutMask      @"mask"

//shortcut masks
#define kMenuShortcutMaskAlt   @"alt"
#define kMenuShortcutMaskCmd   @"cmd"
#define kMenuShortcutMaskCtrl  @"ctrl"
#define kMenuShortcutMaskShift @"shift"

@interface DCLazyInstantiateConfig : NSObject

AS_SINGLETON( DCLazyInstantiateConfig );

/**
 *  the generate lazy instantiate item
 */
@property (nonatomic, strong) NSMenuItem *keyMenuItem;


+ (void)setupMenu;

/**
 *  Set shortcut key for generate option
 *
 *  @param keyShortcut mask: cmd, ctrl, shift, alt connected with '+' or '-'. key: [a - z]
 */
+ (void)setKeyShortcut:(NSDictionary *)keyShortcut;

/**
 *  Get the shortcut key binding from NSUserDefaults, if no set it default.
 *
 *  @return NSDictionary { mask: value, key: [a-z]}
 */
+ (NSDictionary *)keyShortcut;

@end
