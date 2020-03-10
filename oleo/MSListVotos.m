//
//  MSListVotos.m
//  oleo
//
//  Created by Moises Swiczar on 5/23/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "MSListVotos.h"
#import "oleoAppDelegate.h"
#import "UICellRate1.h"
#import "UICellRate2.h"
#import "UICellRate3.h"
#import "WSCall.h"


@implementation MSListVotos
@synthesize thedict,theid;

-(void)workOnBackground:(BOOL)background
{
	self.view.userInteractionEnabled = !background;
	if (background)
	{
		[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
		label_desc.alpha=0;
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
	if ([WSCall callGetComentarios:self.theid thearray:arrayData])
	{
		if([arrayData count]>0)
		{
			[self workOnBackground:NO];
			[thetable reloadData];
			NSIndexPath * theindex = [ NSIndexPath indexPathForRow:0 inSection:0];
			[thetable scrollToRowAtIndexPath:theindex atScrollPosition:UITableViewScrollPositionTop animated:NO];
			thetable.alpha=1;
			label_desc.alpha=1;
			label_desc.text =  [NSString stringWithFormat:@"Mostrando ultimos %d comentarios" ,[arrayData count]];
		}
		else 
		{
			[self workOnBackground:NO];
			UIAlertView * theale = [[UIAlertView alloc]initWithTitle:@"Guía Oleo" message:@"Error de Servidor" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
			[theale show];
			[theale release];
		}
	}
	else 
	{
		[self workOnBackground:NO];
		
		UIAlertView * theale = [[UIAlertView alloc]initWithTitle:@"Guía Oleo" message:@"Error de Servidor" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
		[theale show];
		[theale release];
	}

	

	
}


 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
		self.title=@"Comentarios";
		image1 = [UIImage imageNamed:@"disclosure.png"];
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
		loaded=NO;
		
    }
    return self;
}


- (void)viewWillAppear:(BOOL)animated
{
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


-(void) show
{
	self.title =[thedict objectForKey:@"NOMBRE"];
	[self showmoredata];
	loaded=YES;

}



- (void)viewDidLoad {
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bgcolor.png"]];
	thetable.backgroundColor =[UIColor clearColor];
//	label_desc.textColor = [UIColor colorWithRed:81.6 green:89.8 blue:49.4 alpha:99];
	
	
	label_desc.textColor = [UIColor colorWithRed:0.85 green:0.97 blue:0.62 alpha:0.99];
	label_desc.font = [UIFont fontWithName:@"Arial-BoldMT" size:15];
	
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
	switch (indexPath.row) {
		case 0:
			return 40;
			break;
		case 1:
			return 87;
			break;
		case 2:
			return 35;
			break;
	}
	return 35;
	
}

// This table will always only have one section.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tv
{
    return [arrayData count];
}

// One row per book, the number of books is the number of rows.
- (NSInteger)tableView:(UITableView *)tv numberOfRowsInSection:(NSInteger)section 
{
	return 3;
}



- (UITableViewCell *)obtainTableCellForRow1:(NSInteger)row
{
	UITableViewCell *cell = nil;
	cell = [thetable dequeueReusableCellWithIdentifier:@"UICellRate1"];
	if (cell == nil)
	{
		cell = [[[UICellRate1 alloc] initWithFrame:CGRectZero reuseIdentifier:@"UICellRate1"] autorelease];
	}
	return cell;
}

- (UITableViewCell *)obtainTableCellForRow2:(NSInteger)row
{
	UITableViewCell *cell = nil;
	cell = [thetable dequeueReusableCellWithIdentifier:@"UICellRate2"];
	if (cell == nil)
	{
		cell = [[[UICellRate2 alloc] initWithFrame:CGRectZero reuseIdentifier:@"UICellRate2"] autorelease];
	}
	return cell;
}

- (UITableViewCell *)obtainTableCellForRow3:(NSInteger)row
{
	UITableViewCell *cell = nil;
	cell = [thetable dequeueReusableCellWithIdentifier:@"UICellRate3"];
	if (cell == nil)
	{
		cell = [[[UICellRate3 alloc] initWithFrame:CGRectZero reuseIdentifier:@"UICellRate3"] autorelease];
	}
	return cell;
}






- (UITableViewCell *)tableView:(UITableView *)tv cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
	UITableViewCell *cell;
	NSInteger row = [indexPath row];
	
	switch (row) {
		case 0:
			cell = [self obtainTableCellForRow1:row];
			((UICellRate1*)cell).thestore = [arrayData objectAtIndex:indexPath.section];
			[((UICellRate1*)cell) showData];
			
			break;
		case 1:
			cell = [self obtainTableCellForRow2:row];
			((UICellRate2*)cell).thestore = [arrayData objectAtIndex:indexPath.section];
			[((UICellRate2*)cell) showData];
			break;
		case 2:
			cell = [self obtainTableCellForRow3:row];
			((UICellRate3*)cell).thestore = [arrayData objectAtIndex:indexPath.section];
			[((UICellRate3*)cell) showData];
			break;
	}
	cell.selectionStyle = 	UITableViewCellSelectionStyleNone;
	cell.accessoryType=UITableViewCellAccessoryNone;
	return cell;
}

- (NSIndexPath *)tableView:(UITableView *)tv didSelectRowAtIndexPath:(NSIndexPath *)indexPath 
{
	return indexPath;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
	return 10.0;
}



@end
