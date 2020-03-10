//
//  MSRanking.h
//  oleo
//
//  Created by Moises Swiczar on 5/5/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MSDetalleRest.h"

@interface MSRanking : UIViewController {

	IBOutlet UIImageView * viewTab;
	IBOutlet UILabel *label_desc;
	IBOutlet UITableView * thetable;
	MSDetalleRest* thedet;

	NSMutableArray *arrayData;
	UIActivityIndicatorView *progressInd;
	UIAlertView             *backAlert;
	NSTimer	                *atimergetdata;
	UIImage * image1;
	BOOL loaded;
	NSMutableDictionary * thedict;
	
	IBOutlet UIImageView *theview1;
	IBOutlet UIImageView *theview2;
	IBOutlet UIImageView *theview3;
	IBOutlet UIImageView *theview4;
	
	

	IBOutlet UILabel *labelview1;
	IBOutlet UILabel *labelview2;
	IBOutlet UILabel *labelview3;
	IBOutlet UILabel *labelview4;
	

	IBOutlet UIView  *theview1M;
	IBOutlet UIView *theview2M;
	IBOutlet UIView *theview3M;
	IBOutlet UIView *theview4M;
	
	

	

}

-(IBAction) clickontab:(id)aob;


@end
