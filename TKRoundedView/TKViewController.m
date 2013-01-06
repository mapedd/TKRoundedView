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
    
    TKRoundedCorner cornerOptions[10] = {
                                        TKRoundedCornerAll,
                                        TKRoundedCornerTopLeft,
                                        TKRoundedCornerTopRight,
                                        TKRoundedCornerBottomRight,
                                        TKRoundedCornerBottomLeft,
                                        TKRoundedCornerTopLeft | TKRoundedCornerTopRight,
                                        TKRoundedCornerBottomLeft | TKRoundedCornerBottomRight,
                                        TKRoundedCornerTopLeft | TKRoundedCornerBottomRight,
                                        TKRoundedCornerBottomLeft | TKRoundedCornerTopRight,
                                        TKRoundedCornerTopLeft | TKRoundedCornerTopRight
                                        };
    
    CGRect frame = CGRectMake(10.0f, 10.0f, 100.0f, 100.0f);
    
    for (int i = 0; i < 10; i++) {
        
        
        
        TKRoundedView *view1 = [[TKRoundedView alloc] initWithFrame:frame];
        view1.roundedCorners = cornerOptions[i];
        [self.view addSubview:view1];
        
        frame.origin.y += 110.0f;
        
        if (i%4 == 0 && i != 0) {
            frame.origin.y = 10.0f;
            frame.origin.x += 110.0f;
        }

    }
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

@end
