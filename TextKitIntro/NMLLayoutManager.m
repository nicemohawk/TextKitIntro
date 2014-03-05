//
//  NMLLayoutManager.m
//  TextKitIntro
//
//  Created by Ben Lachman on 2/20/14.
//  Copyright (c) 2014 Ben Lachman. All rights reserved.
//

#import "NMLLayoutManager.h"

@implementation NMLLayoutManager

- (void)drawGlyphsForGlyphRange:(NSRange)glyphsToShow atPoint:(CGPoint)textContainerOrigin {
	for( NSInteger i = glyphsToShow.location ; i < NSMaxRange(glyphsToShow) ; i++ ) {
		if (i % 2 == 0 ) {
			[super drawGlyphsForGlyphRange:NSMakeRange(i, 1) atPoint:textContainerOrigin];
		}
	}
}

@end
