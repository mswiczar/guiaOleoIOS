//
//  PinController.h
//  AMRO
//
//  Created by Moises Swiczar on 8/8/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InfoPin.h"
#import "PinMapController.h"


@interface PinController : UIViewController {
	IBOutlet UITableView * thetable;
	InfoPin * theinfopin;
	BOOL is_Pin;
	NSMutableArray * thearray;
	IBOutlet UIActivityIndicatorView* theactivity;
	NSTimer* timerload;
	BOOL loaded;
	CLLocationCoordinate2D thecenter;
	PinMapController * thepinmap;
}

@property (nonatomic) BOOL is_Pin;
@property (nonatomic) CLLocationCoordinate2D thecenter;

	-(void) show;

@end


