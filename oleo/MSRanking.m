//
//  MSRanking.m
//  oleo
//
//  Created by Moises Swiczar on 5/5/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "MSRanking.h"
#import "oleoAppDelegate.h"
#import "WSCall.h"
#import "UICellRanking.h"

@implementation MSRanking




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

	if ([WSCall callGetRankings:thedict thearray:arrayData])
	{
		[self workOnBackground:NO];

		thetable.alpha=1;
		[thetable reloadData];
		NSIndexPath * theindex = [ NSIndexPath indexPathForRow:0 inSection:0];
		[thetable scrollToRowAtIndexPath:theindex atScrollPosition:UITableViewScrollPositionTop animated:NO];
	}
	else {
		[self workOnBackground:NO];
		thetable.alpha=0;
		
	}

	
	
	
}


 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
		self.title =@"Rankings";
		self.tabBarItem.image = [UIImage imageNamed:@"btn_02.png"];
		
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
		arrayData = [[NSMutableArray alloc]init];
		thedict= [[NSMutableDictionary alloc]init];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
	if(!loaded)
	{
		[self showmoredata];
		loaded=YES;
	}
}

- (void)viewDidLoad {
    [super viewDidLoad];

	labelview4.text = @"Mas de 150 pesos";
	labelview3.text =@"De 100 a 150 pesos";
	labelview2.text =@"De 50 a 100 pesos";
	labelview1.text =@"Hasta 50 pesos";

	
	

	
	
	theview1M.opaque =NO;
	theview2M.opaque =NO;
	theview3M.opaque =NO;
	theview4M.opaque =NO;
	
	
	labelview1.textColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:0.99];
	labelview1.font = [UIFont fontWithName:@"Arial-BoldMT" size:14];

	labelview2.textColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:0.99];
	labelview2.font = [UIFont fontWithName:@"Arial-BoldMT" size:14];

	labelview3.textColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:0.99];
	labelview3.font = [UIFont fontWithName:@"Arial-BoldMT" size:14];

	labelview4.textColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:0.99];
	labelview4.font = [UIFont fontWithName:@"Arial-BoldMT" size:14];

	
	self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bgcolor.png"]];
	label_desc.text =@"Ranking por comida";
	[thedict setObject:@"Comida" forKey:@"ponderar"];

	thetable.alpha=0;
	label_desc.textColor = [UIColor colorWithRed:0.85 green:0.97 blue:0.62 alpha:0.99];
	label_desc.font = [UIFont fontWithName:@"Arial-BoldMT" size:15];
	
	
//	thetable.backgroundColor = [UIColor clearColor];
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
	if(thedet!=nil)
	{
		[thedet release];
		thedet=nil;
		
	}
	
	
	
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	if(thedet!=nil)
	{
		[thedet release];
		thedet=nil;
		
	}
	
    [super dealloc];
}

-(IBAction) clickontab:(id)aob
{
	
	//Comida, Servicio o Ambiente 
	UIButton * theaction = (UIButton *) aob;
	switch (theaction.tag) 
	{
		case 0:
			viewTab.image = [UIImage imageNamed:@"ranking_filter_1.png"];
			label_desc.text =@"Ranking por comida";
			[thedict setObject:@"Comida" forKey:@"ponderar"];
			
			break;
		case 1:
			viewTab.image = [UIImage imageNamed:@"ranking_filter_2.png"];
			label_desc.text =@"Ranking por servicio";
			[thedict setObject:@"Servicio" forKey:@"ponderar"];
			break;
		case 2:
			viewTab.image = [UIImage imageNamed:@"ranking_filter_3.png"];
			label_desc.text =@"Ranking por ambiente";
			[thedict setObject:@"Ambiente" forKey:@"ponderar"];
			break;
	
		default:
			break;
	}
	
	[self showmoredata];
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
		return 48;
	
}

// This table will always only have one section.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tv
{
    return 4;
}

// One row per book, the number of books is the number of rows.
- (NSInteger)tableView:(UITableView *)tv numberOfRowsInSection:(NSInteger)section 
{
	return 5;
	
}






- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
	return @"";
}



- (UITableViewCell *)obtainTableCellForRow:(NSInteger)row
{
	UITableViewCell *cell = nil;
	cell = [thetable dequeueReusableCellWithIdentifier:@"UICellRanking"];
	if (cell == nil)
	{
		cell = [[[UICellRanking alloc] initWithFrame:CGRectZero reuseIdentifier:@"UICellRanking"] autorelease];
	}

	return cell;
}

- (UITableViewCell *)tableView:(UITableView *)tv cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
	
	
	UITableViewCell *cell;
	NSInteger row = [indexPath row];
	NSInteger section = [indexPath section];
	cell = [self obtainTableCellForRow:row];

	if([arrayData count]!=0)
	{
		NSInteger po = (row+(section*5));
//		NSLog(@"%d ,%d ",po,section );
		NSMutableDictionary * thedi = [arrayData objectAtIndex:po];
		if(thedi!=nil)
		{
			((UICellRanking*) cell).itemName.text =[NSString stringWithFormat:@"%@ (%@)",[thedi objectForKey:@"Nombre"],[thedi objectForKey:@"MVotos"]];
			((UICellRanking*) cell).selectionStyle = 	UITableViewCellSelectionStyleGray;
			
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
	
	}
		
	
	return cell;
}

- (NSIndexPath *)tableView:(UITableView *)tv didSelectRowAtIndexPath:(NSIndexPath *)indexPath 
{
		NSInteger section = [indexPath section];

		if(thedet==nil)
		{
			thedet = [[MSDetalleRest alloc] initWithNibName:@"MSDetalleRest" bundle:nil];
		}
		
		thedet.theid = [[arrayData objectAtIndex: indexPath.row + (section*5)] objectForKey:@"ID"];
		[self.navigationController pushViewController:thedet animated:YES];
		[thedet show];
	
	[thetable deselectRowAtIndexPath:indexPath	animated:YES];
	return indexPath;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
	return 37.0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
switch (section) {
	case 0:
		return theview1M;
		break;
	case 1:
		return theview2M;
		break;
	case 2:
		return theview3M;
		break;
	case 3:
		return theview4M;
		break;

	}
	return labelview1;
}




@end
