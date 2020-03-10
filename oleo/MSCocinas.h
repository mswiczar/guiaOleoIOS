//
//  MSCocinas.h
//  oleo
//
//  Created by Moises Swiczar on 5/23/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MSResultSearch.h"


@interface MSCocinas : UIViewController {
	IBOutlet UITableView * thetable;
	
	NSMutableArray *arrayData;
	UIActivityIndicatorView *progressInd;
	UIAlertView             *backAlert;
	NSTimer	                *atimergetdata;
	UIImage * image1;
	BOOL loaded;
	
	MSResultSearch *therestlist;
}

@end
