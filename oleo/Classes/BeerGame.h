//
//  BeerGame.h
//  AMRO
//
//  Created by Moises Swiczar on 8/4/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface BeerGame : UIViewController {

	IBOutlet UIImageView *thebeer;
	NSTimer*  atimerRotate;
	CGAffineTransform transform;
	BOOL running;
}

-(IBAction) clickRotate:(id)aob;



@end
