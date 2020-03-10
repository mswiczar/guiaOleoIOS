//
//  BeerGame.m
//  AMRO
//
//  Created by Moises Swiczar on 8/4/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "BeerGame.h"
#import "AMROAppDelegate.h"
#import "WSCall.h"
#define 	PI_OVER_2  1.57079632679489661923f

static int tiro=1;
@implementation BeerGame


- (void)viewWillAppear:(BOOL)animated
{
	AMROAppDelegate *appDelegate = (AMROAppDelegate *)[[UIApplication sharedApplication] delegate];
	appDelegate.anav_viewcontroller.navigationBarHidden=YES;
	self.navigationController.navigationBar.hidden = NO;
	[WSCall callStatisticsG:Handig_Bottle ];

	
}


 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
		transform = CGAffineTransformIdentity; 
		self.title = @"Wie betaalt?";
		running=NO;
		srand ( time(NULL) );

    }
    return self;
}

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


-(void) doit
{
	[UIView beginAnimations:@"rotatebeer" context:nil];
	if(( tiro % 5 )!=0)
	{
		[UIView setAnimationDuration:1];
		[UIView setAnimationRepeatCount:10];
//		CGAffineTransform transform = CGAffineTransformMakeRotation(PI_OVER_2* tiro );
		
		transform  = CGAffineTransformRotate(CGAffineTransformIdentity,-PI_OVER_2* tiro );
		thebeer.transform = transform;
		[UIView setAnimationDelegate:self];
		[UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:context:)];
		[UIView commitAnimations];
		tiro++;
	}
	
}

 
NSInteger max_time;

-(void) theprocrorate:(id)aobj
{

	
	
	
	
//	CGAffineTransform transform  = CGAffineTransformRotate(CGAffineTransformIdentity,PI_OVER_2/10*tiro );
//	thebeer.transform = transform;
	tiro++;
	if (tiro%max_time==0)
	{
		running=NO;
		[atimerRotate invalidate];
		return;
	}
	if (tiro % max_time < (max_time * 0.10))
	{
		transform  = CGAffineTransformRotate(transform,PI_OVER_2*4/(30/3));
		thebeer.transform = transform;
		return;
	}
	if (tiro % max_time < (max_time * 0.20))
	{
		transform  = CGAffineTransformRotate(transform,PI_OVER_2*4/(30/2));
		thebeer.transform = transform;
		return;
	}
	
	if (tiro % max_time < (max_time * 0.30))
	{
		 transform  = CGAffineTransformRotate(transform,PI_OVER_2*4/30);
		thebeer.transform = transform;
		return;
	}
	if (tiro % max_time < (max_time * 0.40))
	{
		transform  = CGAffineTransformRotate(transform,PI_OVER_2*4/(30*2) );
		thebeer.transform = transform;
		return;
	
	}
	if (tiro % max_time < (max_time * 0.50))
	{
		transform  = CGAffineTransformRotate(transform,PI_OVER_2*4/(30*3) );
		thebeer.transform = transform;
		return;
		
	}
	if (tiro % max_time < (max_time * 0.60))
	{
		transform  = CGAffineTransformRotate(transform,PI_OVER_2*4/(30*4) );
		thebeer.transform = transform;
		return;
		
	}
	
	if (tiro % max_time < (max_time * 0.70))
	{
		transform  = CGAffineTransformRotate(transform,PI_OVER_2*4/(30*5) );
		thebeer.transform = transform;
		return;
		
	}
	if (tiro % max_time < (max_time * 0.80))
	{
		transform  = CGAffineTransformRotate(transform,PI_OVER_2*4/(30*8) );
		thebeer.transform = transform;
		return;
		
	}
	if (tiro % max_time < (max_time * 0.90))
	{
		transform  = CGAffineTransformRotate(transform,PI_OVER_2*4/(30*9) );
		thebeer.transform = transform;
		return;
		
	}
	if (tiro % max_time < max_time )
	{
		transform  = CGAffineTransformRotate(transform,PI_OVER_2*4/(30*10) );
		thebeer.transform = transform;
		return;
		
	}
	

}




-(IBAction) clickRotate:(id)aob
{
	if(		running==NO)
	{
		double r = (   (double)rand() / ((double)(RAND_MAX)+(double)(1)) );
		double z = (r * 5)+1;
		tiro=0;
		
		switch ((int) (z)) 
		{
			case 1:
				max_time=260;
				break;
			case 2:
				max_time=280;
				break;
			case 3:
				max_time=300;
				break;
			case 4:
				max_time=266;
				break;
			default:
				max_time=250;
				break;
		}
		
		atimerRotate = [NSTimer scheduledTimerWithTimeInterval:	.05		// seconds
													 target:		self
												   selector:	@selector (theprocrorate:)
												   userInfo:	self		// makes the currently-active audio queue (record or playback) available to the updateBargraph method

													   repeats:	YES];
		running=YES;
	}

}



-(void)animationDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context
{
	
	if ([animationID isEqualToString:@"rotatebeer"])
	{	
		[self doit];
		return;
	}
	
}

@end
