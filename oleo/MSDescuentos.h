//
//  MSDescuentos.h
//  oleo
//
//  Created by Moises Swiczar on 5/5/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CellMore.h"
#import "MSDetalleRest.h"
#import "PinMapController.h"


@interface MSDescuentos : UIViewController {

	IBOutlet UILabel *label_desc;
	IBOutlet UITableView * thetable;
	NSMutableArray *arrayData;
	UIImage *image1;
	UIActivityIndicatorView *progressInd;
	UIAlertView             *backAlert;
	NSTimer	                *atimergetdata;
	
	CellMore* thecell;
	MSDetalleRest* thedet;
	PinMapController * amap;
	BOOL loaded;
	IBOutlet UIImageView *viewTop;
	IBOutlet UIImageView *viewBotom;
	NSUInteger actual;
	NSMutableDictionary * thedict;


}

@end
