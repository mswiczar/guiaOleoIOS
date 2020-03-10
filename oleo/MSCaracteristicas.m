//
//  MSCaracteristicas.m
//  oleo
//
//  Created by Moises Swiczar on 5/23/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "MSCaracteristicas.h"
#import "oleoAppDelegate.h"
#import "WSCall.h"


@implementation MSCaracteristicas

-(void)workOnBackground:(BOOL)background
{
	self.view.userInteractionEnabled = !background;
	if (background)
	{
		[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
		thetable.alpha=0;
		[backAlert show];
		[progressInd startAnimating];
		
	}
	else
	{
		[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
		[progressInd stopAnimating];
		[backAlert dismissWithClickedButtonIndex:0 animated:YES];
		thetable.alpha=1;
		
	}
}

-(void)showmoredata
{
	[self workOnBackground:YES];
	atimergetdata = [NSTimer scheduledTimerWithTimeInterval: 0.1
													 target: self
												   selector: @selector (loadMoredata:)
												   userInfo: self
													repeats: NO];
	
}




-(void) loadMoredata:(id)aobj
{
	
	oleoAppDelegate *appDelegate = (oleoAppDelegate *)[[UIApplication sharedApplication] delegate];
	
	[appDelegate updateStatus];
	if (appDelegate.internetConnectionStatus==NotReachable)
	{
		[self workOnBackground:NO];
		[appDelegate  shownotreacheable];
		return;
	}
	
	[arrayData removeAllObjects];

	if (appDelegate.internetConnectionStatus==ReachableViaWiFiNetwork)
	{
		[WSCall callGetCaract:arrayData];
		
		
		
	}
	else 
	{
		[WSCall callGetCaractOFFline:arrayData];
		
	}
	
	
	NSMutableArray *arrayDataCheck;

	arrayDataCheck = [[NSMutableArray alloc]init];
	
	NSUInteger thetotla = [arrayData count];
	NSUInteger thi;
	NSMutableDictionary* thedict;
	for (thi=0; thi<thetotla; thi++) {
		thedict = [arrayData objectAtIndex:thi];
		NSMutableDictionary * thedictMut = [[NSMutableDictionary alloc] initWithDictionary:[arrayData objectAtIndex:thi]];
		[thedictMut setObject:@"NO" forKey:@"CHECKED"];
		[arrayDataCheck addObject:thedictMut];
	}
	[arrayData removeAllObjects];
	[arrayData addObjectsFromArray:arrayDataCheck];
	[arrayDataCheck removeAllObjects];
	

	
	[thetable reloadData];

	NSIndexPath * theindex = [ NSIndexPath indexPathForRow:0 inSection:0];
	if([arrayDataCheck count]!=0)
	{
		[thetable scrollToRowAtIndexPath:theindex atScrollPosition:UITableViewScrollPositionTop animated:NO];
	}
	[self workOnBackground:NO];
	
	
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
		self.title =@"Características";
		image1 = [UIImage imageNamed:@"check_bullet.png"];
		arrayData = [[NSMutableArray alloc] init];

		progressInd = [[UIActivityIndicatorView alloc] init];
		progressInd.hidesWhenStopped = YES;
		progressInd.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhite;
		[progressInd sizeToFit];
		progressInd.autoresizingMask = (UIViewAutoresizingFlexibleLeftMargin |
										UIViewAutoresizingFlexibleRightMargin |
										UIViewAutoresizingFlexibleTopMargin |
										UIViewAutoresizingFlexibleBottomMargin);
		
		backAlert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"", @"")
											   message:NSLocalizedString(@"Buscando información.\nPor favor aguarde.", @"") 
											  delegate:nil 
									 cancelButtonTitle:nil
									 otherButtonTitles:nil];
		progressInd.center = CGPointMake(backAlert.frame.size.width / 2.0, -5.0);
		
		[backAlert addSubview:progressInd];
		therestlist=nil;
		loaded=NO;
    }
    return self;
}





- (void)viewWillDisappear:(BOOL)animated
{
	oleoAppDelegate *appDelegate = (oleoAppDelegate *)[[UIApplication sharedApplication] delegate];
	appDelegate.caractsID =@"";
	
	NSUInteger thei;
	NSUInteger total= [arrayData count];
	for (thei=0; thei<total; thei++) 
	{
		NSMutableDictionary * thedi = [arrayData objectAtIndex: thei];
		if ([[thedi objectForKey:@"CHECKED"]isEqualToString:@"YES"])
		{
			appDelegate.caractsID = [NSString stringWithFormat:@"%@,%@",appDelegate.caractsID,[thedi objectForKey:@"IDCARACTERISTICA"]];
		}
	}
	
}

- (void)viewWillAppear:(BOOL)animated
{
	self.navigationController.navigationBar.hidden=NO;

	if(!loaded)
	{
		[self showmoredata];
		loaded=YES;
	}
}

- (void)viewDidLoad {
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bgcolor.png"]];
	// 	label_precio.textColor = [UIColor colorWithRed:81.6 green:89.8 blue:49.4 alpha:99];
	thetable.backgroundColor =[UIColor clearColor];

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
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return 40;
	
}

// This table will always only have one section.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tv
{
    return 1;
}

// One row per book, the number of books is the number of rows.
- (NSInteger)tableView:(UITableView *)tv numberOfRowsInSection:(NSInteger)section 
{
	return [arrayData count];
	
}


- (UITableViewCell *)obtainTableCellForRow:(NSInteger)row
{
	UITableViewCell *cell = nil;
	cell = [thetable dequeueReusableCellWithIdentifier:@"UICell"];
	if (cell == nil)
	{
		cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:@"UICell"] autorelease];
		cell.textLabel.font = [UIFont fontWithName:@"Arial-BoldMT" size:14];
		cell.textLabel.textColor = [UIColor colorWithRed:0.4 green:0.4 blue:0.4 alpha:0.99];
		cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"fondocell.png"]];
	}
	return cell;
}

- (UITableViewCell *)tableView:(UITableView *)tv cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
	
	
	UITableViewCell *cell;
	NSInteger row = [indexPath row];
	
	cell = [self obtainTableCellForRow:row];
//	cell.textLabel.text =[arrayData objectAtIndex:row];

	NSMutableDictionary * thedi = [arrayData objectAtIndex:row];
	cell.textLabel.text =[NSString stringWithFormat:@"%@ (%@)", [thedi objectForKey:@"CARACTERISTICA"],[thedi objectForKey:@"TOTALES"]]; ;
	
	//	UStore *thestore = [arrayData objectAtIndex: row];
	//	thestore.arow = row;
	//	((FavRecentCell *)cell).thestore = thestore;
	//[(UICellStore *)cell showData];
	cell.selectionStyle = 	UITableViewCellSelectionStyleGray;
	if ([[thedi objectForKey:@"CHECKED"]isEqualToString:@"NO"])
	{
		cell.accessoryView =nil;

	
	}
	else 
	{
		CGRect arect;
		arect.origin.x=0;
		arect.origin.y=0;
		arect.size.height = image1.size.height;
		arect.size.width = image1.size.width;
		
		UIImageView *acc = [[UIImageView alloc] initWithFrame:arect];
		acc.image = image1;
		cell.accessoryView =acc;
		[acc release];
		
		
	}

	
	
	
	return cell;
}




- (NSIndexPath *)tableView:(UITableView *)tv didSelectRowAtIndexPath:(NSIndexPath *)indexPath 
{
	/*
	 if(therestlist==nil)
	 {
	 therestlist = [[MSResultSearch alloc] initWithNibName:@"MSResultSearch" bundle:nil];
	 }
	// therestlist.theobj = [arrayData objectAtIndex: indexPath.row];
	 
	 [self.navigationController pushViewController:therestlist animated:YES];
//	 [therestlist show];
	 */
	[thetable deselectRowAtIndexPath:indexPath	animated:YES];
	NSMutableDictionary * thedi = [arrayData objectAtIndex: indexPath.row];
	if ([[thedi objectForKey:@"CHECKED"]isEqualToString:@"NO"])
	{
		[thedi setObject:@"YES" forKey:@"CHECKED"];
	}
	else 
	{
		[thedi setObject:@"NO" forKey:@"CHECKED"];
	}

	

	
//	[self.navigationController popViewControllerAnimated:YES];
	[thetable reloadData];
	return indexPath;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
	return 37.0;
}

@end
