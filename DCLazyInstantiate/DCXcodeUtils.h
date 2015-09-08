//
//  DCXcodeUtils.h
//  DCLazyInstantiate
//
//  Created by Youwei Teng on 7/15/15.
//  Copyright (c) 2015 dcard. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DCXcodeHeader.h"

@interface DCXcodeUtils : NSObject

+ (NSWindow*)currentWindow;
+ (NSResponder*)currentWindowResponder;
+ (NSMenu*)mainMenu;
+ (IDEWorkspaceWindowController*)currentWorkspaceWindowController;
+ (IDEEditorArea*)currentEditorArea;
+ (IDEEditorContext*)currentEditorContext;
+ (IDEEditor*)currentEditor;
+ (IDESourceCodeDocument*)currentSourceCodeDocument;
+ (DVTSourceTextView*)currentSourceTextView;
+ (DVTTextStorage*)currentTextStorage;
+ (NSScrollView*)currentScrollView;
+ (NSMenuItem*)getMainMenuItemWithTitle:(NSString*)title;

@end
