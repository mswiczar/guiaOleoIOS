//
//  PinController.m
//  AMRO
//
//  Created by Moises Swiczar on 8/8/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "PinController.h"
#import "AMROAppDelegate.h"
#import "UICellPin.h"
#import "WSCall.h"

@implementation PinController
@synthesize is_Pin;
@synthesize thecenter;
//@synthesize viewlist;

- (void)viewWillAppear:(BOOL)animated
{
	AMROAppDelegate *appDelegate = (AMROAppDelegate *)[[UIApplication sharedApplication] delegate];
	appDelegate.anav_viewcontroller.navigationBarHidden=YES;
	self.navigationController.navigationBar.hidden = NO;
	if(loaded==NO) 
	{
		[self show];
	}
	[WSCall callStatisticsG:Handig_PINList];

}






 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
//		AMROAppDelegate *appDelegate = (AMROAppDelegate *)[[UIApplication sharedApplication] delegate];
		thepinmap=nil;
		

		loaded=NO;
		theinfopin=nil;
		thearray= [[NSMutableArray alloc]init];

    }
    return self;
}



-(void) clickKaart:(id) aobj
{
	AMROAppDelegate *appDelegate = (AMROAppDelegate *)[[UIApplication sharedApplication] delegate];
	if (thepinmap==nil)
	{
		thepinmap = [[PinMapController alloc] initWithNibName:@"PinMapController" bundle:nil];
	}
	thepinmap.is_Pin = self.is_Pin;
	appDelegate.anav_viewcontroller.navigationBarHidden= YES;
	self.navigationController.navigationBar.hidden = NO;
	thepinmap.thearray = thearray;
	[self.navigationController pushViewController:thepinmap animated:YES];
	[thepinmap show];
}

	




// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	thetable.alpha=0;
	[theactivity startAnimating];
	loaded=YES;
	UIBarButtonItem * theInfo = [[UIBarButtonItem alloc] initWithTitle:@"Kaart" style:0 target:self action:@selector(clickKaart:)];
	self.navigationItem.rightBarButtonItem = theInfo;
}

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


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return 50;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tv
{
	return 1;
}

- (NSInteger)tableView:(UITableView *)tv numberOfRowsInSection:(NSInteger)section 
{
	
	if (self.is_Pin)
	{
		return [thearray count];
	}
	else
	{
		if([thearray count]==1)
		{
			return 0;
		}
		else
		{
			return [thearray count];
		
		}
	}
}

- (UITableViewCell *)obtainTableCellForRow:(NSInteger)row
{

	UITableViewCell *cell = nil;
	cell = [thetable dequeueReusableCellWithIdentifier:@"UICellPin"];
	if (cell == nil)
	{
		cell = [[[UICellPin alloc] initWithFrame:CGRectZero reuseIdentifier:@"UICellPin"] autorelease];
		cell.selectionStyle = UITableViewCellSelectionStyleGray;
		cell.accessoryType=	UITableViewCellAccessoryDisclosureIndicator;
		
	}
	return cell;
}

- (UITableViewCell *)tableView:(UITableView *)tv cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
	AMROAppDelegate *appDelegate = (AMROAppDelegate *)[[UIApplication sharedApplication] delegate];
	NSInteger row = [indexPath row];
	UITableViewCell *cell;
	cell = [self obtainTableCellForRow:row];

	((UICellPin*)cell).thestore = [thearray objectAtIndex:row];
	((UICellPin*)cell).is_pin =self.is_Pin; 
	((UICellPin*)cell).in_city =appDelegate.incity;
	
	
	[((UICellPin*)cell) showData];
	
	
	return cell;	
}		

- (NSIndexPath *)tableView:(UITableView *)tv didSelectRowAtIndexPath:(NSIndexPath *)indexPath 
{

	
	AMROAppDelegate *appDelegate = (AMROAppDelegate *)[[UIApplication sharedApplication] delegate];
	if(theinfopin==nil)
	{
		theinfopin = [[InfoPin alloc] initWithNibName:@"InfoPin" bundle:nil];
	}
	theinfopin.is_pin = self.is_Pin;
	appDelegate.anav_viewcontroller.navigationBarHidden= YES;
	self.navigationController.navigationBar.hidden = NO;
	theinfopin.thestore = [thearray objectAtIndex:[indexPath row]];
	theinfopin.is_fav=NO;
	[self.navigationController pushViewController:theinfopin animated:YES];
	 
	
	[tv deselectRowAtIndexPath:indexPath	animated:YES];
	return indexPath;
}

-(void) agetdata:(id)aobj
{
	AMROAppDelegate *appDelegate = (AMROAppDelegate *)[[UIApplication sharedApplication] delegate];
	[appDelegate updateStatus];
	if (appDelegate.internetConnectionStatus==NotReachable)
	{
		[theactivity stopAnimating];
		[appDelegate shownotreacheable];
		return;
	}
	[thearray removeAllObjects];
	appDelegate.incity = [WSCall Callincity:appDelegate.currentcity.cityName Latitude:appDelegate.latitude Longitude:appDelegate.longitude];

	if (self.is_Pin)
	{
		if(appDelegate.incity)
		{
			[WSCall callGetPin:appDelegate.latitude Longitude:appDelegate.longitude thearray:thearray];
		}
		else
		{
			[WSCall callGetPin:appDelegate.currentcity.Latitude Longitude:appDelegate.currentcity.Longitude thearray:thearray];
		}
	}
	else
	{
		if(appDelegate.incity)
		{
			[WSCall callGetBranch:appDelegate.latitude Longitude:appDelegate.longitude thearray:thearray thecityid:appDelegate.currentcity.cityId];
		}
		else
		{
			[WSCall callGetBranch:appDelegate.currentcity.Latitude Longitude:appDelegate.currentcity.Longitude thearray:thearray thecityid:appDelegate.currentcity.cityId];
		
		}
	}
	[theactivity stopAnimating];

	[UIView beginAnimations:@"" context:nil];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDuration:.8];
	thetable.alpha=1;
	[UIView commitAnimations];
//	[self fillmap];

	[thetable reloadData];
	

}



-(void) show
{
	if (self.is_Pin)
	{
		self.title =@"Pinautomaten";
	}
	else
	{
		self.title =@"Kantoren";
	
	}
	thetable.alpha=0;
	
	[theactivity startAnimating];

	timerload = [NSTimer scheduledTimerWithTimeInterval:	.3		// seconds
												 target:		self
											   selector:	@selector (agetdata:)
											   userInfo:	self		// makes the currently-active audio queue (record or playback) available to the updateBargraph method
												repeats:	NO];
	
}





@end
