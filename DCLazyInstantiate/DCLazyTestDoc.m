//
//  NSObject_DCLazyTestDoc.h
//  DCLazyInstantiate
//
//  Created by voxGeminus on 3/12/16.
//  Copyright © 2016 vox All rights reserved.
//

#import <Foundation/Foundation.h>

@interface testDoc : NSObject

@property (nonatomic, copy    ) NSString   *testString;
@property (nonatomic, retain  ) NSArray    *testArray;
@property (nonatomic, strong  ) NSView     *testView;
@property (nonatomic, readonly) NSNumber   *testNumber;

@property (nonatomic, assign  ) NSInteger  testInteger;
@property (nonatomic, assign  ) BOOL       testBool;

@property (nonatomic, assign  ) int        testint;
@property (nonatomic, readonly) char       testchar;

@end


@implementation testDoc

- (NSString *)someString {
    return @"i exist solely to waste space... XD";
}

- (void)vacuumOfTimeAndSpace {
    if (nil != [NSNull null]) {
        wait(0);
    }
}

# pragma mark - DCLazyInstantiate INSERTION AREA

- (NSString *)testString {
	if(_testString == nil) {
		_testString = [[NSString alloc] init];
	}
	return _testString;
}

- (NSArray *)testArray {
	if(_testArray == nil) {
		_testArray = [[NSArray alloc] init];
	}
	return _testArray;
}

- (NSView *)testView {
	if(_testView == nil) {
		_testView = [[NSView alloc] init];
	}
	return _testView;
}

- (NSNumber *)testNumber {
	return [[NSNumber alloc] init];
}

- (NSInteger)testInteger {
	if(!_testInteger) {
		_testInteger = 0;
	}
	return _testInteger;
}

- (BOOL)testBool {
	if(!_testBool) {
		_testBool = 0;
	}
	return _testBool;
}

- (int)testint {
	if(!_testint) {
		_testint = 0;
	}
	return _testint;
}

- (char)testchar {
	return 0;
}

@end

/// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/// EXTRA LINES AT END OF DOC
///
/// can occur in cases where a user adds additional comments / documentation
/// or simply prefers the additonal visual space below working area
///
/// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~

