//
//  DCLazyInstantiate.m
//  DCLazyInstantiate
//
//  Created by Youwei Teng on 7/15/15.
//  Copyright (c) 2015 dcard. All rights reserved.
//

#import "DCLazyInstantiate.h"
#import "DCLazyInstantiateConfig.h"
#import "DCSettingsWindowController.h"

@interface DCLazyInstantiate ()

@property (nonatomic, strong, readwrite) NSBundle *bundle;
@property (nonatomic, strong) DCSettingsWindowController *settingWindow;

@end

@implementation DCLazyInstantiate

DEF_SINGLETON(DCLazyInstantiate);

+ (void)pluginDidLoad:(NSBundle *)plugin {
    static dispatch_once_t onceToken;
    NSString *currentApplicationName = [[NSBundle mainBundle] infoDictionary][@"CFBundleName"];
    if ([currentApplicationName isEqual:@"Xcode"]) {
        dispatch_once(&onceToken, ^{
          sharedPlugin = [[self alloc] initWithBundle:plugin];
        });
    }
}

- (id)initWithBundle:(NSBundle *)plugin {
    if (self = [super init]) {
        // reference to plugin's bundle, for resource access
        self.bundle = plugin;
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(didApplicationFinishLaunchingNotification:)
                                                     name:NSApplicationDidFinishLaunchingNotification
                                                   object:nil];
    }
    return self;
}

- (void)didApplicationFinishLaunchingNotification:(NSNotification *)notification {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:NSApplicationDidFinishLaunchingNotification object:nil];
    [DCLazyInstantiateConfig setupMenu];
}

- (void)generateLazyInstantiate:(id)sender {
    DVTSourceTextView *sourceTextView = [DCXcodeUtils currentSourceTextView];
	
    //Get the cursor line range
    NSString *viewContent = [sourceTextView string];
    NSRange lineRange = [viewContent lineRangeForRange:NSMakeRange([sourceTextView selectedRange].location, 0)];

    // Get the selected text using the range from above.
    NSString *selectedString = [sourceTextView.textStorage.string substringWithRange:lineRange];
    NSString *lazyInstantiation = [self lazyInstantiationWithSelectedString:selectedString];

    if (lazyInstantiation != nil && lazyInstantiation.length > 0) {
        [[DCXcodeUtils currentTextStorage] beginEditing];
        [[DCXcodeUtils currentTextStorage] replaceCharactersInRange:NSMakeRange((sourceTextView.string.length - 5), 0) withString:lazyInstantiation withUndoManager:[[DCXcodeUtils currentSourceCodeDocument] undoManager]];
        [[DCXcodeUtils currentTextStorage] endEditing];
    }
}

- (NSString *)lazyInstantiationWithSelectedString:(NSString *)selectedString {
    if (selectedString) {
        NSString *result = @"";
        @try {
            NSString *searchedString = selectedString;
            NSRange searchedRange;
            searchedRange = NSMakeRange(0, [searchedString length]);
            NSString *pattern = @"\\)\\s?(.*?)\\s?\\*([^\\*]+);";
            NSError *error = nil;
            NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern options:0 error:&error];
            NSArray *matches = [regex matchesInString:searchedString options:0 range:searchedRange];

            for (NSTextCheckingResult *match in matches) {

                NSString *class = [searchedString substringWithRange:[match rangeAtIndex:1]];
                NSString *varName = [searchedString substringWithRange:[match rangeAtIndex:2]];
                //TODO: custom code style
                result = [NSString stringWithFormat:@"- (%@ *)%@ {\n\tif(_%@ == nil) {\n\t\t_%@ = [[%@ alloc] init];\n\t}\n\treturn _%@;\n}\n\n", class, varName, varName, varName, class, varName];
            }
            return result;
        } @catch (NSException *exception) {
            NSLog(@"%@", exception.reason);
            return nil;
        }
    }
}

- (void)showSetting:(id)sender {
    if (nil == self.settingWindow) {
        self.settingWindow = [[DCSettingsWindowController alloc] initWithWindowNibName:NSStringFromClass([DCSettingsWindowController class])];
    }
    [self.settingWindow showWindow:self.settingWindow];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


@end
