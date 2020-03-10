//
//  MSListVotos.h
//  oleo
//
//  Created by Moises Swiczar on 5/23/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MSListVotos : UIViewController {

	IBOutlet UITableView * thetable;
	NSMutableArray *arrayData;

	UIActivityIndicatorView *progressInd;
	UIAlertView             *backAlert;
	NSTimer	                *atimergetdata;
	UIImage * image1;
	BOOL loaded;
	IBOutlet UILabel *label_desc;
	NSMutableDictionary * thedict;
	NSString * theid;
	
}
-(void) show;
@property (nonatomic,assign) NSMutableDictionary * thedict;
@property (nonatomic, copy) NSString * theid;

@end
