//
//  MSDescuentos.m
//  oleo
//
//  Created by Moises Swiczar on 5/5/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "MSDescuentos.h"
#import "UICellStoreDesc.h"

#import "oleoAppDelegate.h"
#import "WSCall.h"
@implementation MSDescuentos




-(void)workOnBackground:(BOOL)background
{
	self.view.userInteractionEnabled = !background;
	if (background)
	{
		label_desc.alpha=0;

		viewTop.alpha=0;
		viewBotom.alpha=0;
		[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
		
		[backAlert show];
		[progressInd startAnimating];
		
	}
	else
	{
		[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
		[progressInd stopAnimating];
		[backAlert dismissWithClickedButtonIndex:0 animated:YES];
//		viewTop.alpha=1;
//		viewBotom.alpha=1;
//		label_desc.alpha=1;


	}
}



-(void)showmoredata
{
	self.view.userInteractionEnabled = NO;
	atimergetdata = [NSTimer scheduledTimerWithTimeInterval: 0.1
													 target: self
												   selector: @selector (loadMoredata:)
												   userInfo: self
													repeats: NO];
	
}



-(void) showalldata
{
	[arrayData removeAllObjects];
	[thetable reloadData];
	[self workOnBackground:YES];
	atimergetdata = [NSTimer scheduledTimerWithTimeInterval: 0.1
													 target: self
												   selector: @selector (loaddata:)
												   userInfo: self
													repeats: NO];
};






-(void) loadFirstData:(id)aobj
{

	oleoAppDelegate *appDelegate = (oleoAppDelegate *)[[UIApplication sharedApplication] delegate];
	[thedict setObject:[NSString stringWithFormat:@"%f",appDelegate.theLocationActual.longitude] forKey:@"longitud"];
	[thedict setObject:[NSString stringWithFormat:@"%f",appDelegate.theLocationActual.latitude] forKey:@"latitud"];
	[thedict setObject:[NSString stringWithFormat:@"%d",actual] forKey:@"inicio"];
	[thedict setObject:@"5" forKey:@"cantidad"];
	actual=1;
	
	[appDelegate updateStatus];
	if (appDelegate.internetConnectionStatus==NotReachable)
	{
		[self workOnBackground:NO];
		[appDelegate  shownotreacheable];
		return;
	}
	
	[WSCall callGetDescuentos:thedict thearray:arrayData];
	label_desc.text =[NSString stringWithFormat:@"Mostrando %d Resultados",[arrayData count] ];
	
	if ([arrayData count] >=5)
	{
		
				viewTop.alpha=1;
				viewBotom.alpha=1;
				label_desc.alpha=1;
		
		thetable.alpha=1;
		
	}
	else 
	{
		label_desc.alpha=0;

		thetable.alpha=0;
		viewTop.alpha=0;
		viewBotom.alpha=0;
	}
	[thetable reloadData];
	
	
	[self workOnBackground:NO];

	
}


-(void) loadMoredata:(id)aobj
{
	actual=[arrayData count] /5;
	
	oleoAppDelegate *appDelegate = (oleoAppDelegate *)[[UIApplication sharedApplication] delegate];
	
	[appDelegate updateStatus];
	if (appDelegate.internetConnectionStatus==NotReachable)
	{
		self.view.userInteractionEnabled = YES;
		[appDelegate  shownotreacheable];
		return;
	}
	actual++;
	[thedict setObject:[NSString stringWithFormat:@"%f",appDelegate.theLocationActual.longitude] forKey:@"longitud"];
	[thedict setObject:[NSString stringWithFormat:@"%f",appDelegate.theLocationActual.latitude] forKey:@"latitud"];
	[thedict setObject:[NSString stringWithFormat:@"%d",actual] forKey:@"inicio"];
	[thedict setObject:@"5" forKey:@"cantidad"];
	
	if ([WSCall callGetDescuentos:thedict thearray:arrayData])
	{
		
		
	}
	label_desc.text =[NSString stringWithFormat:@"Mostrando %d Resultados",[arrayData count] ];
	
	[thetable reloadData];
	self.view.userInteractionEnabled = YES;
	[(CellMore*)thecell stop];
	
}




-(void)showmoredataFirst
{
	[arrayData removeAllObjects];
	actual=0;
	[self workOnBackground:YES];
	atimergetdata = [NSTimer scheduledTimerWithTimeInterval: 0.1
													 target: self
												   selector: @selector (loadFirstData:)
												   userInfo: self
													repeats: NO];
	
}


-(void) clickrefresh:(id)aobj
{
	[self showmoredataFirst];
}


 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
		self.title =@"Descuentos";
		self.tabBarItem.image = [UIImage imageNamed:@"btn_05.png"];
		arrayData = [[NSMutableArray alloc]init];
		
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
		
		thedet=nil;
		amap=nil;
		loaded=NO;
		thedict= [[NSMutableDictionary alloc]init];
		
		UIBarButtonItem * theInfo2 = [[UIBarButtonItem alloc] initWithTitle:@"Refrescar" style:0 target:self action:@selector(clickrefresh:)];
		self.navigationItem.leftBarButtonItem = theInfo2;
	

    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
	if(!loaded)
	{
		[self showmoredataFirst];
		loaded=YES;
	}
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bgcolor.png"]];

	label_desc.textColor = [UIColor colorWithRed:0.85 green:0.97 blue:0.62 alpha:0.99];
	label_desc.font = [UIFont fontWithName:@"Arial-BoldMT" size:15];

	thetable.backgroundColor =[UIColor clearColor];
	UIBarButtonItem * theInfo = [[UIBarButtonItem alloc] initWithTitle:@"Mapa" style:0 target:self action:@selector(clickmap:)];
	self.navigationItem.rightBarButtonItem = theInfo;

}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
	
	if(thedet!=nil)
	{
		[thedet release];
		thedet=nil;
		
	}
	
	if(amap!=nil)
	{
		[amap release];
		amap=nil;
		
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
	
	if(amap!=nil)
	{
		[amap release];
		amap=nil;
		
	}
    [super dealloc];
}




- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	if([arrayData count]==[indexPath row])
	{	
		return 55;
	}
	else
	{
		return 81;
	}
	
}

// This table will always only have one section.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tv
{
    return 1;
}

// One row per book, the number of books is the number of rows.
- (NSInteger)tableView:(UITableView *)tv numberOfRowsInSection:(NSInteger)section 
{
	
	if([arrayData count]==0)
	{
		return 0;
	}
	else
	{
		if(([arrayData count] % 5)==0  )
		{
			return	[arrayData count]+1;
		}
		else
		{
			return	[arrayData count];
		}
	}
	
}


- (UITableViewCell *)obtainTableCellForRowMore:(NSInteger)row
{
	UITableViewCell *cell = nil;
	cell = [thetable dequeueReusableCellWithIdentifier:@"CellMore"];
	if (cell == nil)
	{
		cell = [[[CellMore alloc] initWithFrame:CGRectZero reuseIdentifier:@"CellMore"] autorelease];
	}
	thecell= (CellMore*)cell;
	return cell;
}


- (UITableViewCell *)obtainTableCellForRow:(NSInteger)row
{
	UITableViewCell *cell = nil;
	cell = [thetable dequeueReusableCellWithIdentifier:@"UICellStoreDesc"];
	if (cell == nil)
	{
		cell = [[[UICellStoreDesc alloc] initWithFrame:CGRectZero reuseIdentifier:@"UICellStoreDesc"] autorelease];
		cell.textLabel.font =[UIFont systemFontOfSize:10];
	}
	return cell;
}

- (UITableViewCell *)tableView:(UITableView *)tv cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
	
	
	UITableViewCell *cell;
	NSInteger row = [indexPath row];
	
	if(row == [arrayData count])
	{
		cell = [self obtainTableCellForRowMore:row];
		cell.accessoryView =nil;
		cell.selectionStyle = 	UITableViewCellSelectionStyleGray;
		
	}
	else
	{
		
		NSInteger row = [indexPath row];
		cell = [self obtainTableCellForRow:row];
		//	UStore *thestore = [arrayData objectAtIndex: row];
		//	thestore.arow = row;
		//	((FavRecentCell *)cell).thestore = thestore;
		
		((UICellStoreDesc *)cell).thestore = [arrayData objectAtIndex: row];

		
		[(UICellStoreDesc *)cell showData];
		cell.selectionStyle = 	UITableViewCellSelectionStyleGray;
		
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
	
	if(indexPath.row!=[arrayData count])
	{
		if(thedet==nil)
		{
			thedet = [[MSDetalleRest alloc] initWithNibName:@"MSDetalleRest" bundle:nil];
		}
		thedet.theid = [[arrayData objectAtIndex: indexPath.row] objectForKey:@"ID"];

		[self.navigationController pushViewController:thedet animated:YES];
		[thedet show];
	}
	else
	{
		[(CellMore*)thecell start];
		[self showmoredata];
	}
	
	
	[thetable deselectRowAtIndexPath:indexPath	animated:YES];
	
	return indexPath;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
	return 37.0;
}

/*
 - (void)tableView:(UITableView *)tv commitEditingStyle:(UITableViewCellEditingStyle)editingStyle 
 forRowAtIndexPath:(NSIndexPath *)indexPath 
 {
 NSInteger row = [indexPath row];
 UStore *thestore = [arrayData objectAtIndex: row];
 [thestore deletefromdb];
 if (editingStyle == UITableViewCellEditingStyleDelete) 
 {
 [thestore deletefromdb];
 [arrayData removeObjectAtIndex:row];
 [mytable reloadData];
 }
 }
 */




-(void) clickmap:(id)aobj
{
	if(amap==nil)
	{
		amap = [[PinMapController alloc] initWithNibName:@"PinMapController" bundle:nil];
	}		
	amap.thearray = arrayData;
	
	[self.navigationController pushViewController:amap animated:YES];
	[amap show];
	
	
}

@end
