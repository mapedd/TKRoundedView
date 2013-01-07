//
//  TKRoundedView.m
//  Tomasz Kuźma
//
//  Created by Tomasz Kuźma on 1/6/13.
//  Copyright (c) 2013 Tomasz Kuźma. All rights reserved.
//

#import "TKRoundedView.h"

const TKRoundedCorner TKRoundedCornerAll = TKRoundedCornerTopRight | TKRoundedCornerBottomRight | TKRoundedCornerBottomLeft | TKRoundedCornerTopLeft;

const TKDrawnBorderSides TKDrawnBordersSidesAll = TKDrawnBorderSidesRight | TKDrawnBorderSidesLeft | TKDrawnBorderSidesTop | TKDrawnBorderSidesBottom;

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
    _roundedCorners = TKRoundedCornerAll;
    _drawnBordersSides = TKDrawnBordersSidesAll;
    
}

#pragma mark - Drawing

- (void)drawRect:(CGRect)rect{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    
    CGRect properRect = CGRectInset(rect, _borderWidth/2.0f, _borderWidth/2.0f);
    
    /* Setup colors and line width */
    CGContextSetFillColorWithColor(ctx, _fillColor.CGColor);
    CGContextSetLineWidth(ctx, 0.0f);
    
    
    // Add and fill rect
    [self addPathToContext:ctx inRect:properRect respectDrawnBorder:NO];
    
    // Close the path
    CGContextClosePath(ctx);
    
    // Fill and Stroke path
    CGContextDrawPath(ctx, kCGPathFill);
    
    /* Setup colors and line width */
    CGContextSetStrokeColorWithColor(ctx, _borderColor.CGColor);
    CGContextSetLineWidth(ctx, _borderWidth);
    
    // Add and stroke rect
    [self addPathToContext:ctx inRect:properRect respectDrawnBorder:YES];
    
    // Close the path
    CGContextClosePath(ctx);
    
    // Fill and Stroke path
    CGContextDrawPath(ctx, kCGPathStroke);
    
}

- (void)addPathToContext:(CGContextRef)ctx inRect:(CGRect)rect respectDrawnBorder:(BOOL)respectDrawnBorders{
    
    CGFloat minx = CGRectGetMinX(rect);
    CGFloat midx = CGRectGetMidX(rect);
    CGFloat maxx = CGRectGetMaxX(rect);
    
    CGFloat miny = CGRectGetMinY(rect);
    CGFloat midy = CGRectGetMidY(rect);
    CGFloat maxy = CGRectGetMaxY(rect);
    
    // Start at 1
    CGContextMoveToPoint(ctx, minx, midy);
    
    if (_roundedCorners & TKRoundedCornerTopLeft) {
        // Add an arc through 2 to 3
        CGContextAddArcToPoint(ctx, minx, miny, midx, miny, _cornerRadius);
    }
    else{
        
        if (_drawnBordersSides & TKDrawnBorderSidesLeft || !respectDrawnBorders){
            CGContextAddLineToPoint(ctx, minx, miny);
        }
        else{
            CGContextDrawPath(ctx, kCGPathStroke);
            CGContextMoveToPoint(ctx, minx, miny);
        }
        
        if (_drawnBordersSides & TKDrawnBorderSidesTop  || !respectDrawnBorders){
            CGContextAddLineToPoint(ctx, midx, miny);
        }
        else{
            CGContextDrawPath(ctx, kCGPathStroke);
            CGContextMoveToPoint(ctx, midx, miny);
        }
    }
    
    if (_roundedCorners & TKRoundedCornerTopRight) {
        // Add an arc through 4 to 5
        CGContextAddArcToPoint(ctx, maxx, miny, maxx, midy, _cornerRadius);
    }
    else{
        
        if (_drawnBordersSides & TKDrawnBorderSidesTop  || !respectDrawnBorders){
            CGContextAddLineToPoint(ctx, maxx, miny);
        }
        else{
            CGContextDrawPath(ctx, kCGPathStroke);
            CGContextMoveToPoint(ctx, maxx, miny);
        }
        
        if (_drawnBordersSides & TKDrawnBorderSidesRight  || !respectDrawnBorders){
            CGContextAddLineToPoint(ctx, maxx, midy);
        }
        else{
            CGContextDrawPath(ctx, kCGPathStroke);
            CGContextMoveToPoint(ctx, maxx, midy);
        }
    }
    
    if (_roundedCorners & TKRoundedCornerBottomRight) {
        // Add an arc through 6 to 7
        CGContextAddArcToPoint(ctx, maxx, maxy, midx, maxy, _cornerRadius);
    }
    else{
        
        if (_drawnBordersSides & TKDrawnBorderSidesRight  || !respectDrawnBorders){
            CGContextAddLineToPoint(ctx, maxx, maxy);
        }
        else{
            CGContextDrawPath(ctx, kCGPathStroke);
            CGContextMoveToPoint(ctx, maxx, maxy);
        }
        
        if (_drawnBordersSides & TKDrawnBorderSidesBottom  || !respectDrawnBorders){
            CGContextAddLineToPoint(ctx, midx, maxy);
        }
        else{
            CGContextDrawPath(ctx, kCGPathStroke);
            CGContextMoveToPoint(ctx, midx, maxy);
        }
    }
    
    if (_roundedCorners & TKRoundedCornerBottomLeft) {
        // Add an arc through 8 to 9
        CGContextAddArcToPoint(ctx, minx, maxy, minx, midy, _cornerRadius);
    }
    else{
        
        if (_drawnBordersSides & TKDrawnBorderSidesBottom  || !respectDrawnBorders){
            CGContextAddLineToPoint(ctx, minx, maxy);
        }
        else{
            CGContextDrawPath(ctx, kCGPathStroke);
            CGContextMoveToPoint(ctx, minx, maxy);
        }
        
        if (_drawnBordersSides & TKDrawnBorderSidesLeft  || !respectDrawnBorders){
            CGContextAddLineToPoint(ctx, minx, midy);
        }
        else{
            CGContextDrawPath(ctx, kCGPathStroke);
            CGContextMoveToPoint(ctx, minx, midy);
        }
        
    }
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
