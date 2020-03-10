//
//  MSResultSearch.m
//  oleo
//
//  Created by Moises Swiczar on 5/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "MSResultSearch.h"
#import "UICellStore.h"
#import "oleoAppDelegate.h"
#import "WSCall.h"


@implementation MSResultSearch
@synthesize loaded;

-(void)workOnBackground:(BOOL)background
{
	self.view.userInteractionEnabled = !background;
	if (background)
	{
		[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
		viewImage1.alpha=0;
		viewImage2.alpha=0;
		thetable.alpha=0;
		label_desc.alpha=0;

		[backAlert show];
		[progressInd startAnimating];
		
	}
	else
	{
		label_desc.alpha=1;

		[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
		if ([arrayData count] >=5)
		{
//			viewImage1.alpha=1;
//			viewImage2.alpha=1;
//			thetable.alpha=1;

		}
		else {
			thetable.alpha=0;
			viewImage1.alpha=0;
			viewImage2.alpha=0;
		}
		[progressInd stopAnimating];
		[backAlert dismissWithClickedButtonIndex:0 animated:YES];
	}
}



-(void) loaddata:(id)aobj
{
	
	oleoAppDelegate *appDelegate = (oleoAppDelegate *)[[UIApplication sharedApplication] delegate];
	[arrayData removeAllObjects];

	[appDelegate updateStatus];
	if (appDelegate.internetConnectionStatus==NotReachable)
	{
		[self workOnBackground:NO];
		[appDelegate  shownotreacheable];
		return;
	}
	[thedict removeAllObjects];
	[thedict setObject:[NSString stringWithFormat:@"%f",appDelegate.theLocationActual.longitude] forKey:@"longitud"];
	[thedict setObject:[NSString stringWithFormat:@"%f",appDelegate.theLocationActual.latitude] forKey:@"latitud"];
	[thedict setObject:[NSString stringWithFormat:@"%d",actual] forKey:@"inicio"];
	[thedict setObject:@"5" forKey:@"cantidad"];
	actual=1;

	
	if(appDelegate.search_str==NO)
	{
	
		[thedict setObject:[NSString stringWithFormat:@"%d,%d", appDelegate.precioD , appDelegate.precioH] forKey:@"precios"];
		if (appDelegate.zonaID==0)
		{
			[thedict setObject:@"" forKey:@"zonas"];
		}
		else 
		{
			[thedict setObject:[NSString stringWithFormat:@"%d",appDelegate.zonaID] forKey:@"zonas"];
		
		}
	
		if (appDelegate.cocinaID==0)
		{
			[thedict setObject:@"" forKey:@"cocinas"];
		}
		else 
		{
			[thedict setObject:[NSString stringWithFormat:@"%d",appDelegate.cocinaID] forKey:@"cocinas"];
		
		}
	
	
		[thedict setObject:appDelegate.caractsID forKey:@"caracteristicas"];
	
		[WSCall callGetSearch:thedict thearray:arrayData];
	}
	else 
	{
		
		[thedict setObject:appDelegate.strsearch forKey:@"strsch"];
		
		[WSCall callGetSearchSTR:thedict thearray:arrayData];
		
	}


	[self workOnBackground:NO];

	if ([arrayData count] >=5)
	{
		
		viewImage1.alpha=1;
		viewImage2.alpha=1;
		label_desc.alpha=1;
		thetable.alpha=1;
		
	}
	else 
	{
		if ([arrayData count]>0)
		{
			label_desc.alpha=1;
			thetable.alpha=1;
			viewImage1.alpha=0;
			viewImage2.alpha=0;
		}
		else {
			label_desc.alpha=0;
			thetable.alpha=0;
			viewImage1.alpha=0;
			viewImage2.alpha=0;
			
		}

	}
	loaded=YES;
	[thetable reloadData];
	label_desc.text =[NSString stringWithFormat:@"Mostrando %d Resultados",[arrayData count] ];
	
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
	
	actual++;

		[thedict removeAllObjects];

	
	[thedict setObject:[NSString stringWithFormat:@"%f",appDelegate.theLocationActual.longitude] forKey:@"longitud"];
		[thedict setObject:[NSString stringWithFormat:@"%f",appDelegate.theLocationActual.latitude] forKey:@"latitud"];
		[thedict setObject:[NSString stringWithFormat:@"%d",actual] forKey:@"inicio"];
		[thedict setObject:@"5" forKey:@"cantidad"];

	
	
	if(appDelegate.search_str==NO)
	{

	
		[thedict setObject:[NSString stringWithFormat:@"%d,%d", appDelegate.precioD , appDelegate.precioH] forKey:@"precios"];
		if (appDelegate.zonaID==0)
		{
			[thedict setObject:@"" forKey:@"zonas"];
		}
		else 
		{
			[thedict setObject:[NSString stringWithFormat:@"%d",appDelegate.zonaID] forKey:@"zonas"];
		
		}

		if (appDelegate.cocinaID==0)
		{
			[thedict setObject:@"" forKey:@"cocinas"];
		}
		else 
		{
			[thedict setObject:[NSString stringWithFormat:@"%d",appDelegate.cocinaID] forKey:@"cocinas"];
		
		}
	
	
		[thedict setObject:appDelegate.caractsID forKey:@"caracteristicas"];

		[WSCall callGetSearch:thedict thearray:arrayData];
	}
	
	else 
	{
		
		[thedict setObject:appDelegate.strsearch forKey:@"strsch"];
		
		[WSCall callGetSearchSTR:thedict thearray:arrayData];
		
	}
	
	
	
	label_desc.text =[NSString stringWithFormat:@"Mostrando %d Resultados",[arrayData count] ];
	
	[thetable reloadData];
	
	self.view.userInteractionEnabled = YES;
	[(CellMore*)thecell stop];

	
	
}



-(void)showmoredata
{

	atimergetdata = [NSTimer scheduledTimerWithTimeInterval: 0.1
													 target: self
												   selector: @selector (loadMoredata:)
												   userInfo: self
													repeats: NO];
	
}



-(void) showalldata
{
	[self workOnBackground:YES];
	atimergetdata = [NSTimer scheduledTimerWithTimeInterval: 0.1
													 target: self
												   selector: @selector (loaddata:)
												   userInfo: self
													repeats: NO];
};




// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
		self.title =@"Resultados";
		self.tabBarItem.image = [UIImage imageNamed:@"btn_03.png"];
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
		
		thedet = nil;
		thedict= [[NSMutableDictionary alloc]init];

		
		
    }
    return self;
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bgcolor.png"]];
	thetable.backgroundColor =[UIColor clearColor];
	
	UIBarButtonItem * theInfo = [[UIBarButtonItem alloc] initWithTitle:@"Mapa" style:0 target:self action:@selector(clickmap:)];
	self.navigationItem.rightBarButtonItem = theInfo;
	
	label_desc.textColor = [UIColor colorWithRed:0.85 green:0.97 blue:0.62 alpha:0.99];
	label_desc.font = [UIFont fontWithName:@"Arial-BoldMT" size:15];
	viewImage1.alpha=0;
	viewImage2.alpha=0;
	thetable.alpha=0;


}

-(void) show
{
	loaded=NO;
}


- (void)viewWillAppear:(BOOL)animated
{
	self.navigationController.navigationBar.hidden=NO;
	if(!loaded)
	{
		thetable.alpha=0;
		[self showalldata];
		loaded=YES;
	}
}


// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
	loaded=NO;
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
		return 61;
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
	thecell= (CellMore* )cell;
	return cell;
}


- (UITableViewCell *)obtainTableCellForRow:(NSInteger)row
{
	UITableViewCell *cell = nil;
	cell = [thetable dequeueReusableCellWithIdentifier:@"UICellStore"];
	if (cell == nil)
	{
		cell = [[[UICellStore alloc] initWithFrame:CGRectZero reuseIdentifier:@"UICellStore"] autorelease];
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
		
		
		((UICellStore *)cell).thestore = [arrayData objectAtIndex: row];
		[(UICellStore *)cell showData];
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
