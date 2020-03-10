//
//  PinMapController.m
//  AMRO
//
//  Created by Moises Swiczar on 8/28/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "PinMapController.h"
#import "oleoAppDelegate.h"
#import "StorePick.h"
#import "MSDetalleRest.h"

@implementation PinMapController
@synthesize is_Pin;
@synthesize thearray;
@synthesize cercanos;


- (void)viewWillAppear:(BOOL)animated
{
	/*
	oleoAppDelegate *appDelegate = (oleoAppDelegate *)[[UIApplication sharedApplication] delegate];
	appDelegate.anav_viewcontroller.navigationBarHidden=YES;
	self.navigationController.navigationBar.hidden = NO;
	if(loaded==NO) 
	{
		[self show];
	}
	*/
}
-(void) clickPosition:(id)aobl
{
	oleoAppDelegate *appDelegate = (oleoAppDelegate *)[[UIApplication sharedApplication] delegate];
	MKCoordinateRegion region;
	
	MKCoordinateSpan span;
	span.latitudeDelta=0.03;
	span.longitudeDelta=0.03;
	region.span=span;
		
	CLLocationCoordinate2D location;
	
	if (appDelegate.theLocationActual.latitude==0)
	{
		location.latitude=appDelegate.theLocationActual.latitude;
		location.longitude=appDelegate.theLocationActual.longitude;
	}
	else 
	{
		if (themap.userLocation.location.coordinate.latitude!=0)
		{
			location.latitude=themap.userLocation.location.coordinate.latitude;
			location.longitude=themap.userLocation.location.coordinate.longitude;
		}
		else {
			return;
		}

	}
	
	
	region.center=location;
	[themap setRegion:region animated:YES];
	[themap regionThatFits:region];	
	
	

	
	
}


 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
		loaded=NO;
		self.title =@"Mapa";
		self.tabBarItem.image = [UIImage imageNamed:@"btn_04.png"];

    }
    return self;
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	cercanos=NO;
	UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
	[btn addTarget:self action:@selector(clickPosition:) forControlEvents:UIControlEventTouchUpInside];
	btn.frame = CGRectMake(0, 0, 31, 31);
	[btn setImage:[UIImage imageNamed:@"Compass.png"] forState:UIControlStateNormal];
	UIBarButtonItem * thecompass = [[UIBarButtonItem alloc] initWithCustomView:btn];
	self.navigationItem.rightBarButtonItem = thecompass;

	loaded=YES;
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




-(void) fillmap
{
	[themap removeAnnotations:themap.annotations];
	
	MKCoordinateRegion region;
	MKCoordinateSpan span;

	if (cercanos) {
		span.latitudeDelta=0.02;
		span.longitudeDelta=0.02;

	}
	else {
		span.latitudeDelta=0.1;
		span.longitudeDelta=0.1;
		
	}

	
	region.span=span;
	
	//NSMutableDictionary* aux =  [thearray objectAtIndex:0];
	CLLocationCoordinate2D aloc;

	oleoAppDelegate *appDelegate = (oleoAppDelegate *)[[UIApplication sharedApplication] delegate];
	
	if (appDelegate.theLocationActual.latitude!=0)
	{
		aloc.latitude=appDelegate.theLocationActual.latitude;
		aloc.longitude=appDelegate.theLocationActual.longitude;
	}
	else 
	{
		
		if (themap.userLocation.location.coordinate.latitude!=0)
		{
			aloc.latitude=themap.userLocation.location.coordinate.latitude;
			aloc.longitude=themap.userLocation.location.coordinate.longitude;
		}
		else {
			
			if ([thearray count]!= 0)
			{
				NSMutableDictionary* aux =  [thearray objectAtIndex:0];
				if ([aux objectForKey:@"LAT"]!=nil )
				{
					aloc.latitude=[[aux objectForKey:@"LAT"] floatValue];
					aloc.longitude=[[aux objectForKey:@"LONG"] floatValue];
				}
			}
		}
	}

	region.center=aloc;
	
	
	[themap setRegion:region animated:TRUE];
	[themap regionThatFits:region];	
	
	NSUInteger theocount =	[thearray count];
	NSUInteger i;
	
	
	for (i=0;i<theocount ;i++)
	{
		NSMutableDictionary* aux =  [thearray objectAtIndex:i];
		
		CLLocationCoordinate2D aloc;
		
		if ([aux objectForKey:@"LAT"]!=nil )
		{
			aloc.latitude=[[aux objectForKey:@"LAT"] floatValue];
			aloc.longitude=[[aux objectForKey:@"LONG"] floatValue];
		}
		StorePick *sp=[[StorePick alloc] initWithCoordinate:aloc];
		sp.thestore = aux;
		sp.thepos = i;
		[themap addAnnotation:sp];	
	}
}



- (void)reverseGeocoder:(MKReverseGeocoder *)geocoder didFindPlacemark:(MKPlacemark *)placemark{
	mPlacemark=placemark;
	[themap addAnnotation:placemark];
}

- (void)reverseGeocoder:(MKReverseGeocoder *)geocoder didFailWithError:(NSError *)error{
	
}

-(void) cliconstore:(id)obj
{
	if ([thearray count]!=1)
	{
		if(theinfopin==nil)
		{
			theinfopin = [[MSDetalleRest alloc] initWithNibName:@"MSDetalleRest" bundle:nil];
		}
		theinfopin.theid = [[	thearray  objectAtIndex:((UIButton*) obj).tag] objectForKey:@"ID"];
		[self.navigationController pushViewController:theinfopin animated:YES];
		[theinfopin show];
	}
	else 
	{
		[self.navigationController popViewControllerAnimated:YES];	
	}

	
	
}

- (MKAnnotationView *) mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>) annotation
{
	if (annotation ==themap.userLocation)
	{
		
		MKPinAnnotationView* view = (MKPinAnnotationView *) [mapView dequeueReusableAnnotationViewWithIdentifier:@"LOCAL"];
		if(nil == view) 
		{
			view = [[[MKPinAnnotationView alloc]
					 initWithAnnotation:annotation reuseIdentifier:@"LOCAL"]
					autorelease];
		}
		
		[view setPinColor:MKPinAnnotationColorPurple];
		[view setCanShowCallout:YES];
		[view setAnimatesDrop:YES];	
		return view;
		
		
	}
	else
	{
		MKPinAnnotationView* view = (MKPinAnnotationView *) [mapView dequeueReusableAnnotationViewWithIdentifier:@"identifier"];
		if(nil == view) 
		{
			view = [[[MKPinAnnotationView alloc]
					 initWithAnnotation:annotation reuseIdentifier:@"identifier"]
					autorelease];
		}
		UIButton * thebutton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
		StorePick *sp=(StorePick *) annotation;
		thebutton.tag =  sp.thepos;
	
		
		[thebutton addTarget:self action:@selector(cliconstore:) forControlEvents:UIControlEventTouchUpInside];
			
		
		
		
		view.leftCalloutAccessoryView=thebutton;
		[view setPinColor:MKPinAnnotationColorRed];
		[view setCanShowCallout:YES];
		[view setAnimatesDrop:YES];	
		return view;
		
	}
	
}


-(void) show
{
	oleoAppDelegate *appDelegate = (oleoAppDelegate *)[[UIApplication sharedApplication] delegate];

	if (!appDelegate.is_simulator)
	{
		themap.showsUserLocation = YES;
	}
	
	[self fillmap];

}	

@end
