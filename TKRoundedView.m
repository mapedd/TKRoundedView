//
//  TKRoundedView.m
//  Perfect Gym
//
//  Created by Tomasz Kuźma on 1/6/13.
//  Copyright (c) 2013 Tomasz Kuźma. All rights reserved.
//

#import "TKRoundedView.h"

@implementation TKRoundedView

#pragma mark - Initialization

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (!self)return nil;
    
    [self commonInit];
    
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (!self)return nil;
    
    [self commonInit];
    
    return self;
}

- (void)commonInit{
    
    self.opaque = NO;
    self.backgroundColor = [UIColor clearColor];
    self.contentMode = UIViewContentModeRedraw;
    
    _fillColor = [UIColor whiteColor];
    _borderColor = [UIColor grayColor];
    _cornerRadius = 15.0f;
    _borderWidth = 1.0f;
    _roundedCorners = TKRoundedCornerTopLeft | TKRoundedCornerBottomRight;
    
}

#pragma mark - Drawing

- (void)drawRect:(CGRect)rect{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    
    CGRect properRect = CGRectInset(rect, _borderWidth/2.0f, _borderWidth/2.0f);
    
    /* Setup colors and line width */
    CGContextSetFillColorWithColor(ctx, _fillColor.CGColor);
    CGContextSetStrokeColorWithColor(ctx, _borderColor.CGColor);
    CGContextSetLineWidth(ctx, _borderWidth);
    
    CGFloat minx = CGRectGetMinX(properRect);
    CGFloat midx = CGRectGetMidX(properRect);
    CGFloat maxx = CGRectGetMaxX(properRect);
    
    CGFloat miny = CGRectGetMinY(properRect);
    CGFloat midy = CGRectGetMidY(properRect);
    CGFloat maxy = CGRectGetMaxY(properRect);
    
    // Next, we will go around the rectangle in the order given by the figure below.
    //       minx    midx    maxx
    // miny    2       3       4
    // midy   1 9              5
    // maxy    8       7       6
    // Which gives us a coincident start and end point, which is incidental to this technique, but still doesn't
    // form a closed path, so we still need to close the path to connect the ends correctly.
    // Thus we start by moving to point 1, then adding arcs through each pair of points that follows.
    // You could use a similar tecgnique to create any shape with rounded corners.
    
    // Start at 1
    CGContextMoveToPoint(ctx, minx, midy);
    
    if (_roundedCorners & TKRoundedCornerTopLeft) {
        // Add an arc through 2 to 3
        CGContextAddArcToPoint(ctx, minx, miny, midx, miny, _cornerRadius);
    }
    else{
        CGContextAddLineToPoint(ctx, minx, miny);
        CGContextAddLineToPoint(ctx, midx, miny);
    }
    
    if (_roundedCorners & TKRoundedCornerTopRight) {
        // Add an arc through 4 to 5
        CGContextAddArcToPoint(ctx, maxx, miny, maxx, midy, _cornerRadius);
    }
    else{
        CGContextAddLineToPoint(ctx, maxx, miny);
        CGContextAddLineToPoint(ctx, maxx, midy);
    }
    
    if (_roundedCorners & TKRoundedCornerBottomRight) {
        // Add an arc through 6 to 7
        CGContextAddArcToPoint(ctx, maxx, maxy, midx, maxy, _cornerRadius);
    }
    else{
        CGContextAddLineToPoint(ctx, maxx, maxy);
        CGContextAddLineToPoint(ctx, midx, maxy);
    }
    
    if (_roundedCorners & TKRoundedCornerBottomLeft) {
        // Add an arc through 8 to 9
        CGContextAddArcToPoint(ctx, minx, maxy, minx, midy, _cornerRadius);
    }
    else{
        CGContextAddLineToPoint(ctx, minx, maxy);
        CGContextAddLineToPoint(ctx, minx, midy);
    }
    
    // Close the path
    CGContextClosePath(ctx);
    
    // Fill and Stroke path
    CGContextDrawPath(ctx, kCGPathFillStroke);
    
}

#pragma mark - Setters

- (void)setRoundedCorners:(TKRoundedCorner)roundedCorners{
    _roundedCorners = roundedCorners;
    [self setNeedsDisplay];
}

- (void)setBorderColor:(UIColor *)borderColor{
    if (_borderColor != borderColor) {
        _borderColor = borderColor;
        [self setNeedsDisplay];
    }
}

- (void)setFillColor:(UIColor *)fillColor{
    if (_fillColor != fillColor) {
        _fillColor = fillColor;
        [self setNeedsDisplay];
    }
}

- (void)setBorderWidth:(CGFloat)borderWidth{
    _borderWidth = borderWidth;
    [self setNeedsDisplay];
}

- (void)setCornerRadius:(CGFloat)cornerRadius{
    _cornerRadius = cornerRadius;
    [self setNeedsDisplay];
}

@end
