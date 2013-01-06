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

static const TKRoundedCorner TKRoundedCornerAll = TKRoundedCornerTopRight | TKRoundedCornerBottomRight | TKRoundedCornerBottomLeft | TKRoundedCornerTopLeft;

@interface TKRoundedView : UIView

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
