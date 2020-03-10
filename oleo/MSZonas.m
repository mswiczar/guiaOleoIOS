//
//  MSZonas.m
//  oleo
//
//  Created by Moises Swiczar on 5/23/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "MSZonas.h"
#import "oleoAppDelegate.h"
#import "WSCall.h"

@implementation MSZonas


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
	
	if (appDelegate.internetConnectionStatus==ReachableViaWiFiNetwork)
	{
		[WSCall callGetZona:arrayData];
	}
	else 
	{
		[WSCall callGetZonaOFFline:arrayData];
		
	}

	
	
	
	[thetable reloadData];
	NSIndexPath * theindex = [ NSIndexPath indexPathForRow:0 inSection:0];
	[thetable scrollToRowAtIndexPath:theindex atScrollPosition:UITableViewScrollPositionTop animated:NO];
	[self workOnBackground:NO];
	
	
}


 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
		arrayData = [[NSMutableArray alloc] init];
		self.title =@"Zonas";
		image1 = [UIImage imageNamed:@"disclosure.png"];
		
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
		loaded=NO;
		
    }
    return self;
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



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	thetable.backgroundColor =[UIColor clearColor];

	self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bgcolor.png"]];
// 	label_precio.textColor = [UIColor colorWithRed:81.6 green:89.8 blue:49.4 alpha:99];

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
/*	
	if(arrayData !=nil)
	{
		[arrayData removeAllObjects];
		[arrayData release];
		arrayData=nil;
		
	}
 */
	[super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
	
	
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	/*
	if(arrayData !=nil)
	{
		[arrayData removeAllObjects];
		[arrayData release];
		arrayData=nil;
	
	}
	*/
	
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
	return [arrayData count]+1;
	
}


- (UITableViewCell *)obtainTableCellForRow:(NSInteger)row
{
	UITableViewCell *cell = nil;
	cell = [thetable dequeueReusableCellWithIdentifier:@"UICell"];
	if (cell == nil)
	{
		cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:@"UICell"] autorelease];
		//cell.textLabel.font =[UIFont systemFontOfSize:14];
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
	
	if (row==0) {
		cell.textLabel.text =[NSString stringWithFormat:@"%@", @"Todas"] ;
	}
	else {
		NSMutableDictionary * thedi = [arrayData objectAtIndex:row-1];
		cell.textLabel.text =[NSString stringWithFormat:@"%@ (%@)", [thedi objectForKey:@"nombreZona"],[thedi objectForKey:@"cantidadRestosZona"]]; ;
		
	}
	cell.selectionStyle = 	UITableViewCellSelectionStyleGray;

	
	return cell;
}

- (NSIndexPath *)tableView:(UITableView *)tv didSelectRowAtIndexPath:(NSIndexPath *)indexPath 
{
	oleoAppDelegate *appDelegate = (oleoAppDelegate *)[[UIApplication sharedApplication] delegate];
	
	NSInteger row = [indexPath row];

	if (row==0)
	{
		appDelegate.zonaID  = 0;
		appDelegate.strZona = @"";

	}
	else {
		NSMutableDictionary * thedi = [arrayData objectAtIndex:row-1];
		appDelegate.zonaID  = [[thedi objectForKey:@"idZona"]intValue];
		appDelegate.strZona = [[thedi objectForKey:@"nombreZona"] uppercaseString];
		
	}

	
		
	[thetable deselectRowAtIndexPath:indexPath	animated:YES];
	[self.navigationController popViewControllerAnimated:YES];
	return indexPath;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
	return 37.0;
}





@end
