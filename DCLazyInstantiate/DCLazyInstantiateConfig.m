//
//  DCLazyInstantiateConfig.m
//  DCLazyInstantiate
//
//  Created by Youwei Teng on 9/8/15.
//  Copyright (c) 2015 dcard. All rights reserved.
//

#import "DCLazyInstantiateConfig.h"
#import "DCLazyInstantiate.h"
#import "DCSettingsWindowController.h"

static NSString *const kDCLazyInstantiateShortcut      = @"kDCLazyInstantiate.shortcut";
static NSString *const selectorGenerateLazyInstantiate = @"generateLazyInstantiate:";
static NSString *const selectorShowSetting             = @"showSetting:";

@interface DCLazyInstantiateConfig ()

@end

@implementation DCLazyInstantiateConfig

DEF_SINGLETON( DCLazyInstantiateConfig );

+ (void)setShortcut:(NSDictionary *)shortcut menuItem:(NSMenuItem *)menuItem {
	NSString *skey = shortcut[kMenuShortcutKey];
	NSUInteger sMask = [self sMaskWthShortcut:shortcut];
	
	if (skey && sMask) {
		[menuItem setKeyEquivalent:skey];
		[menuItem setKeyEquivalentModifierMask:sMask];
	}
}

+ (NSUInteger)sMaskWthShortcut:(NSDictionary *)shortcut {
	NSString *sMask = shortcut[kMenuShortcutMask];
	
	NSUInteger keyMask = 0;
	
	if (NSNotFound != [sMask rangeOfString:kMenuShortcutMaskAlt].location)
		keyMask |= NSAlternateKeyMask;
	if (NSNotFound != [sMask rangeOfString:kMenuShortcutMaskCmd].location)
		keyMask |= NSCommandKeyMask;
	if (NSNotFound != [sMask rangeOfString:kMenuShortcutMaskCtrl].location)
		keyMask |= NSControlKeyMask;
	if (NSNotFound != [sMask rangeOfString:kMenuShortcutMaskShift].location)
		keyMask |= NSShiftKeyMask;
	
	return keyMask;
}

+ (NSDictionary *)keyShortcut {
	NSDictionary *shortcut = [[NSUserDefaults standardUserDefaults] dictionaryForKey:kDCLazyInstantiateShortcut];
	if (nil == shortcut) {
		//default is shift + cmd + l
		shortcut = @{ @"mask" : @"shift+cmd",
					  @"key" : @"-" };
		[[NSUserDefaults standardUserDefaults] setObject:shortcut forKey:kDCLazyInstantiateShortcut];
		[[NSUserDefaults standardUserDefaults] synchronize];
	}
	
	return shortcut;
}

+ (void)setKeyShortcut:(NSDictionary *)keyShortcut {
	[self setShortcut:keyShortcut menuItem:[DCLazyInstantiateConfig sharedInstance].keyMenuItem];
	[[NSUserDefaults standardUserDefaults] setObject:keyShortcut forKey:kDCLazyInstantiateShortcut];
	[[NSUserDefaults standardUserDefaults] synchronize];
}

+ (void)setupMenu {
	NSMenuItem *menuItem = [[NSApp mainMenu] itemWithTitle:@"Edit"];
	if (menuItem) {
		[[menuItem submenu] addItem:[NSMenuItem separatorItem]];
		
		NSMenuItem *dc_lazyInstantiateMenuItem  = [[NSMenuItem alloc] initWithTitle:@"DCLazyInstantiate" action:nil keyEquivalent:@""];
		
		//Items
		NSMenuItem *dc_generateMenuItem = [[NSMenuItem alloc] init];
        dc_generateMenuItem.title  = @"Generate";
        dc_generateMenuItem.target = [DCLazyInstantiate sharedInstance];
        dc_generateMenuItem.action = NSSelectorFromString(selectorGenerateLazyInstantiate);
		[self setShortcut:[self keyShortcut] menuItem:dc_generateMenuItem];
		[DCLazyInstantiateConfig sharedInstance].keyMenuItem = dc_generateMenuItem;
		
		NSMenuItem *dc_settingMenuItem = [[NSMenuItem alloc] init];
        dc_settingMenuItem.title  = @"Settings";
        dc_settingMenuItem.target = [DCLazyInstantiate sharedInstance];
        dc_settingMenuItem.action = NSSelectorFromString(selectorShowSetting);
		
		NSMenu *dc_lazyInstantiateMenu = [[NSMenu alloc] init];
		[dc_lazyInstantiateMenuItem setSubmenu:dc_lazyInstantiateMenu];
		[dc_lazyInstantiateMenu addItem:dc_generateMenuItem];
		[dc_lazyInstantiateMenu addItem:dc_settingMenuItem];
		[[menuItem submenu] addItem:dc_lazyInstantiateMenuItem];
	}
}

@end
