//
//  MSCercanos.h
//  oleo
//
//  Created by Moises Swiczar on 5/5/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CellMore.h"
#import "MSDetalleRest.h"
#import "PinMapController.h"


@interface MSCercanos : UIViewController {

	IBOutlet UILabel *label_random;

	IBOutlet UILabel *label_desc;
	IBOutlet UITableView * thetable;
	UIImage *image1;
	NSMutableArray *arrayData;
	UIActivityIndicatorView *progressInd;
	UIAlertView             *backAlert;
	NSTimer	                *atimergetdata;
	
	CellMore* thecell;
	MSDetalleRest* thedet;
	PinMapController * amap;
	BOOL tiene_posicion;
	
	IBOutlet UIImageView * viewtop;
	IBOutlet UIImageView * viewbottom;
	BOOL loaded;
	NSMutableDictionary * thedict;
	NSUInteger actual;
	IBOutlet UIActivityIndicatorView *progressIndGPS;
	UIBarButtonItem * theInfo2;
	
}

-(void) forbiden;
-(void) done;
-(void) timeout;


@end
