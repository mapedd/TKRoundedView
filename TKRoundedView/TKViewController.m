//
//  TKViewController.m
//  TKRoundedView
//
//  Created by Tomasz Kuźma on 1/6/13.
//  Copyright (c) 2013 mapedd. All rights reserved.
//

#import "TKViewController.h"
#import "TKRoundedView.h"

@interface TKViewController ()

@end

@implementation TKViewController

- (id)init{
    self = [super initWithNibName:nil bundle:nil];
    if(!self)return nil;
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
//    TKRoundedCorner cornerOptions[12] = {
//                                        TKRoundedCornerAll,
//                                        TKRoundedCornerTopLeft,
//                                        TKRoundedCornerTopRight,
//                                        TKRoundedCornerBottomRight,
//                                        TKRoundedCornerBottomLeft,
//                                        TKRoundedCornerTopLeft | TKRoundedCornerTopRight,
//                                        TKRoundedCornerBottomLeft | TKRoundedCornerBottomRight,
//                                        TKRoundedCornerTopLeft | TKRoundedCornerBottomRight,
//                                        TKRoundedCornerBottomLeft | TKRoundedCornerTopRight,
//                                        TKRoundedCornerTopLeft | TKRoundedCornerTopRight,
//                                        TKRoundedCornerTopLeft | TKRoundedCornerTopRight | TKRoundedCornerBottomRight,
//                                        TKRoundedCornerTopLeft | TKRoundedCornerTopRight | TKRoundedCornerBottomLeft,
//                                        };
//    CGFloat offset = 10.0f;
//    
//    CGFloat side = (self.view.frame.size.width - 4 * offset)/ 3.0f ;
//    
//    CGRect frame = CGRectMake(offset, offset, side, side);
//    
//    for (int i = 0; i < 12; i++) {
//        
//        TKRoundedView *view1 = [[TKRoundedView alloc] initWithFrame:CGRectInset(frame, 10, 10)];
//        view1.roundedCorners = cornerOptions[i];
//        view1.borderColor = [UIColor colorWithRed:0.123 green:0.435 blue:0.52 alpha:1.0];
//        view1.fillColor = [UIColor colorWithWhite:0.6 alpha:0.1];
//        view1.borderWidth = 5.0f;
//        view1.cornerRadius = side/4;
//        [self.view addSubview:view1];
//        
//        frame.origin.y += side + offset;
//        
//        if (i == 3 || i == 7 || i == 11) {
//            frame.origin.y = offset;
//            frame.origin.x += offset + side;
//        }
//
//    }
    
    
    BOOL top = NO;
    BOOL bottom = NO; // <<< NOT WORKING
    BOOL middle = NO;
    BOOL topAndBottom = YES;
    
    TKRoundedView *view1 = [[TKRoundedView alloc] initWithFrame:CGRectMake(10, 10, 200, 200)];
    

    if (top) {
        view1.roundedCorners = TKRoundedCornerTopLeft | TKRoundedCornerTopRight;
        view1.drawnBordersSides = TKDrawnBorderSidesLeft | TKDrawnBorderSidesTop | TKDrawnBorderSidesRight;
    }
    else if(bottom){
        view1.roundedCorners = TKRoundedCornerBottomLeft | TKRoundedCornerBottomRight;
        view1.drawnBordersSides = TKDrawnBorderSidesLeft | TKDrawnBorderSidesBottom | TKDrawnBorderSidesRight;
    }
    else if(middle){
        view1.roundedCorners = TKRoundedCornerNone;
        view1.drawnBordersSides = TKDrawnBorderSidesLeft | TKDrawnBorderSidesRight;
    }
    else if(topAndBottom){
        view1.roundedCorners = TKRoundedCornerAll;
        view1.drawnBordersSides = TKDrawnBordersSidesAll;
    }
    
    view1.borderColor = [UIColor colorWithRed:0.123 green:0.435 blue:0.52 alpha:1.0];
    view1.fillColor = [UIColor redColor];;
    view1.borderWidth = 5.0f;
    view1.cornerRadius = 15.0f;
    [self.view addSubview:view1];
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

@end
