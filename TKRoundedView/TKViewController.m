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
    
    TKRoundedCorner cornerOptions[12] = {
                                        TKRoundedCornerAll,
                                        TKRoundedCornerTopLeft,
                                        TKRoundedCornerTopRight,
                                        TKRoundedCornerBottomRight,
                                        TKRoundedCornerBottomLeft,
                                        TKRoundedCornerTopLeft | TKRoundedCornerTopRight,
                                        TKRoundedCornerBottomLeft | TKRoundedCornerBottomRight,
                                        TKRoundedCornerTopLeft | TKRoundedCornerBottomRight,
                                        TKRoundedCornerBottomLeft | TKRoundedCornerTopRight,
                                        TKRoundedCornerTopLeft | TKRoundedCornerTopRight,
                                        TKRoundedCornerTopLeft | TKRoundedCornerTopRight | TKRoundedCornerBottomRight,
                                        TKRoundedCornerTopLeft | TKRoundedCornerTopRight | TKRoundedCornerBottomLeft,
                                        };
    
    CGFloat side = self.view.frame.size.width / 3 - 30;
    
    CGRect frame = CGRectMake(10.0f, 10.0f, side, side);
    
    for (int i = 0; i < 12; i++) {
        
        TKRoundedView *view1 = [[TKRoundedView alloc] initWithFrame:frame];
        view1.roundedCorners = cornerOptions[i];
        view1.borderColor = [UIColor colorWithRed:0.123 green:0.435 blue:0.52 alpha:1.0];
        view1.fillColor = [UIColor colorWithWhite:1 alpha:1];
        view1.borderWidth = 5.0f;
        [self.view addSubview:view1];
        
        frame.origin.y += 110.0f;
        
        if (i == 3 || i == 7 || i == 11) {
            frame.origin.y = 10.0f;
            frame.origin.x += 10.0f + side;
        }

    }
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

@end
