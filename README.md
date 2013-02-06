#TKRoundedView

##Features

Simple rounded corners __without__ images

![Screenshot](https://dl.dropbox.com/u/450887/tkroundedview1.png)
![Screenshot](https://dl.dropbox.com/u/450887/tkroundedview2.png)

##Example usage

		NSArray *gradientColorsAndLocations = (@[
                                               @{colorKey: [UIColor blackColor],locationKey: @(0.0f)},
                                               @{colorKey: [UIColor lightGrayColor]  ,locationKey: @(0.5f)},
                                               @{colorKey: [UIColor whiteColor],locationKey: @(1.0f)}
                                               ]);
		
		TKRoundedView *view = [[TKRoundedView alloc] initWithFrame:frame];
		view.roundedCorners = TKRoundedCornerTopLeft
		view.borderColor = [UIColor greenColor];
		view.fillColor = [UIColor whiteColor];
		view.gradientColorsAndLocations = gradientColorsAndLocations;
		view.gradientDirection = TKGradientDirectionDown;
		view.drawnBordersSides = TKDrawnBorderSidesLeft | TKDrawnBorderSidesTop;
		view.borderWidth = 5.0f;
		view.cornerRadius = 15.0f;

##Parameters

- cornerRadius 
- borderWidth
- borderColor
- fillColor
- rounded corners
- drawn borders
- gradient with any number of colors
- gradient location


##Example project

YES


##Contact

- [@mapedd](https://twitter.com/mapedd)
- [mapedd@mapedd.com](mapedd@gmail.com/ "Title")


##License 

Apache


