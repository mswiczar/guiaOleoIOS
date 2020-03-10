//
//  MSCercanos.m
//  oleo
//
//  Created by Moises Swiczar on 5/5/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "MSCercanos.h"
#import "UICellStoreDist.h"
#import "WSCall.h"
#import "oleoAppDelegate.h"

@implementation MSCercanos



-(void)workOnBackground:(BOOL)background
{
	self.view.userInteractionEnabled = !background;
	if (background)
	{
		[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
		//backAlert.transform = CGAffineTransformTranslate( backAlert.transform, 0.0, -50.0 );
		
		[backAlert show];
		[progressInd startAnimating];
		
	}
	else
	{
/*
		if ([arrayData count] >=5)
		{
			viewtop.alpha=1;
			viewbottom.alpha=1;
			thetable.alpha=1;
			
		}
		else 
		{
			thetable.alpha=0;
			viewtop.alpha=0;
			viewbottom.alpha=0;
		}
*/		
		
		[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
		[progressInd stopAnimating];
		[backAlert dismissWithClickedButtonIndex:0 animated:YES];
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



-(void) loaddata:(id)aobj
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
	
	[WSCall callGetCercanos:thedict thearray:arrayData];
	label_desc.text =[NSString stringWithFormat:@"Mostrando %d Resultados",[arrayData count] ];
	
	if ([arrayData count] >=5)
	{
		viewtop.alpha=1;
		viewbottom.alpha=1;
		thetable.alpha=1;
		
	}
	else 
	{
		thetable.alpha=0;
		viewtop.alpha=0;
		viewbottom.alpha=0;
	}
	label_desc.alpha=1;
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
	
	if ([WSCall callGetCercanos:thedict thearray:arrayData])
	{
	

	}
	label_desc.text =[NSString stringWithFormat:@"Mostrando %d Resultados",[arrayData count] ];
	
	[thetable reloadData];
	self.view.userInteractionEnabled = YES;
	[(CellMore*)thecell stop];
	
}



-(void) showalldata
{

	thetable.alpha=0;
	viewtop.alpha=0;
	viewbottom.alpha=0;
	label_desc.alpha=0;

	[arrayData removeAllObjects];
	actual=1;

	[self workOnBackground:YES];
	atimergetdata = [NSTimer scheduledTimerWithTimeInterval: 0.1
													 target: self
												   selector: @selector (loaddata:)
												   userInfo: self
													repeats: NO];
};

-(void) clickrefresh:(id)aobj
{
	oleoAppDelegate *appDelegate = (oleoAppDelegate *)[[UIApplication sharedApplication] delegate];
	[progressIndGPS startAnimating];
	self.navigationItem.leftBarButtonItem = nil;
	thetable.alpha=0;
	viewtop.alpha=0;
	viewbottom.alpha=0;
	label_desc.alpha=0;
	label_random.text =@"Actualizando GPS";

	[appDelegate getlocation];
	
	//[self showalldata];
}


 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
		tiene_posicion=NO;
		self.title =@"Cercanos";
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
		
		loaded=NO;
		thedet=nil;
		amap=nil;
		thedict= [[NSMutableDictionary alloc]init];
		theInfo2 = [[UIBarButtonItem alloc] initWithTitle:@"Refrescar" style:0 target:self action:@selector(clickrefresh:)];
		oleoAppDelegate *appDelegate = (oleoAppDelegate *)[[UIApplication sharedApplication] delegate];
		appDelegate.thecercanos=self;

		
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

	label_random.textColor = [UIColor colorWithRed:0.85 green:0.97 blue:0.62 alpha:0.99];
	label_random.font = [UIFont fontWithName:@"Arial-BoldMT" size:12];
	
	label_random.text =@"Actualizando GPS";
	
	
}


- (void)viewWillAppear:(BOOL)animated
{
	if (!tiene_posicion)
	{
		thetable.alpha=0;
		viewtop.alpha=0;
		viewbottom.alpha=0;
		label_desc.alpha=0;
		
		oleoAppDelegate *appDelegate = (oleoAppDelegate *)[[UIApplication sharedApplication] delegate];
		[progressIndGPS startAnimating];
		
		self.navigationItem.leftBarButtonItem = nil;

		[appDelegate getlocation];
		return;
	}
	
	
	
	
}


// Override to allow orientations other than the default portrait orientation.
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
	thecell= (CellMore*)cell;
	return cell;
}


- (UITableViewCell *)obtainTableCellForRow:(NSInteger)row
{
	UITableViewCell *cell = nil;
	cell = [thetable dequeueReusableCellWithIdentifier:@"UICellStoreDist"];
	if (cell == nil)
	{
		cell = [[[UICellStoreDist alloc] initWithFrame:CGRectZero reuseIdentifier:@"UICellStoreDist"] autorelease];
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
		
		((UICellStoreDist *)cell).thestore = [arrayData objectAtIndex: row];
		[(UICellStoreDist *)cell showData];
		
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
		//thedet.theobj = [arrayData objectAtIndex: indexPath.row];
		
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
	amap.cercanos=YES;

	[amap show];
	
	
}

-(void) forbiden
{
	self.navigationItem.leftBarButtonItem = theInfo2;

	[progressIndGPS stopAnimating];
	tiene_posicion=NO;

	UIAlertView *myerror = [[UIAlertView alloc]initWithTitle:@"Esta sección necesita utilizar el servicio de posicionamiento" message:@"Favor de permitir el acceso al uso del mismo." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
	[myerror show];
	[myerror release];
	
}

-(void) done
{
	self.navigationItem.leftBarButtonItem = theInfo2;

	[progressIndGPS stopAnimating];

	oleoAppDelegate *appDelegate = (oleoAppDelegate *)[[UIApplication sharedApplication] delegate];
	label_random.text =[NSString stringWithFormat:@"Precisión: %.0f m",appDelegate.horizontalAccuracy];
	tiene_posicion=YES;
	[self showalldata];

}

-(void) timeout
{
	self.navigationItem.leftBarButtonItem = theInfo2;

	[progressIndGPS stopAnimating];

	oleoAppDelegate *appDelegate = (oleoAppDelegate *)[[UIApplication sharedApplication] delegate];
	label_random.text =[NSString stringWithFormat:@"Precisión: %.0f m",appDelegate.horizontalAccuracy];
	tiene_posicion=YES;
	[self showalldata];

	

}






@end
