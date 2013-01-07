//
//  TKRoundedView.h
//  Perfect Gym
//
//  Created by Tomasz Kuźma on 1/6/13.
//  Copyright (c) 2013 Tomasz Kuźma. All rights reserved.
//

typedef NS_OPTIONS(NSUInteger, TKRoundedCorner) {
    TKRoundedCornerNone         = 0,
    TKRoundedCornerTopRight     = 1 <<  0,
    TKRoundedCornerBottomRight  = 1 <<  1,
    TKRoundedCornerBottomLeft   = 1 <<  2,
    TKRoundedCornerTopLeft      = 1 <<  3,
};

typedef NS_OPTIONS(NSUInteger, TKDrawnBorderSides) {
    TKDrawnBorderSidesNone      = 0,
    TKDrawnBorderSidesRight     = 1 <<  0,
    TKDrawnBorderSidesLeft      = 1 <<  1,
    TKDrawnBorderSidesTop       = 1 <<  2,
    TKDrawnBorderSidesBottom    = 1 <<  3,
};

static const TKRoundedCorner TKRoundedCornerAll = TKRoundedCornerTopRight | TKRoundedCornerBottomRight | TKRoundedCornerBottomLeft | TKRoundedCornerTopLeft;

static const TKRoundedCorner TKDrawnBordersSidesAll = TKDrawnBorderSidesRight | TKDrawnBorderSidesLeft | TKDrawnBorderSidesTop | TKDrawnBorderSidesBottom;

@interface TKRoundedView : UIView

/* Which borders should be drawn - default TKDrawnBordersSidesAll - only not rounded borders can *NOT* be drawn atm  */
@property (nonatomic, assign) TKDrawnBorderSides drawnBordersSides;

/* Which corners should be rounded - default TKRoundedCornerAll */
@property (nonatomic, assign) TKRoundedCorner roundedCorners;

/* Fill color of the figure - default white */
@property (nonatomic, strong) UIColor *fillColor;

/* Stroke color for the figure, default is grey */
@property (nonatomic, strong) UIColor *borderColor;

/* Border line width, default 5.0f */
@property (nonatomic, assign) CGFloat borderWidth;

/* Corners radius , default 15.0f */
@property (nonatomic, assign) CGFloat cornerRadius;

@end
