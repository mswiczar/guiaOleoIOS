//
//  oleoAppDelegate.m
//  oleo
//
//  Created by Moises Swiczar on 5/4/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#define SQLDATABASENAME @"favorites.sql"
#import "oleoAppDelegate.h"
#import "MSCercanos.h"



@implementation oleoAppDelegate
@synthesize window;
@synthesize internetConnectionStatus;
@synthesize database;
@synthesize mytabview;
@synthesize loggedin;
@synthesize thecercanos;

@synthesize is_ipod,is_simulator;
@synthesize theLocationActual;
@synthesize horizontalAccuracy;

@synthesize theIDVotar;
@synthesize theUserNick;
@synthesize tel;

@synthesize cocinaID;
@synthesize precioD;
@synthesize precioH;
@synthesize caractsID;
@synthesize zonaID;

@synthesize strZona;
@synthesize strCocina;
@synthesize search_str;
@synthesize strsearch;



-(void)createEditableCopyOfDatabaseIfNeeded 
{
	BOOL success;
	NSFileManager *fileManager = [NSFileManager defaultManager];
	NSError *error;
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	NSString *writableDBPath = [documentsDirectory stringByAppendingPathComponent:SQLDATABASENAME];
	success = [fileManager fileExistsAtPath:writableDBPath];
	if (success) return;
	// The writable database does not exist, so copy the default to the appropriate location.
	NSString *defaultDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:SQLDATABASENAME];
	success = [fileManager copyItemAtPath:defaultDBPath toPath:writableDBPath error:&error];
	if (!success) 
	{
		NSAssert1(0, @"Failed to create writable database file with message '%@'.", [error localizedDescription]);
	}
}


-(void) copyofflinedbCaract
{
	BOOL success;
	NSFileManager *fileManager = [NSFileManager defaultManager];
	NSError *error;
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	NSString *writableDBPath = [documentsDirectory stringByAppendingPathComponent:@"caracteristicas.txt"];
	success = [fileManager fileExistsAtPath:writableDBPath];
	if (success) return;
	// The writable database does not exist, so copy the default to the appropriate location.
	NSString *defaultDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"caracteristicas.txt"];
	success = [fileManager copyItemAtPath:defaultDBPath toPath:writableDBPath error:&error];
	if (!success) 
	{
		NSAssert1(0, @"Failed to create writable caracteristicas file with message '%@'.", [error localizedDescription]);
	}
}


-(void) copyofflinedbCocinas
{
	BOOL success;
	NSFileManager *fileManager = [NSFileManager defaultManager];
	NSError *error;
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	NSString *writableDBPath = [documentsDirectory stringByAppendingPathComponent:@"cocinas.txt"];
	success = [fileManager fileExistsAtPath:writableDBPath];
	if (success) return;
	// The writable database does not exist, so copy the default to the appropriate location.
	NSString *defaultDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"cocinas.txt"];
	success = [fileManager copyItemAtPath:defaultDBPath toPath:writableDBPath error:&error];
	if (!success) 
	{
		NSAssert1(0, @"Failed to create writable cocinas file with message '%@'.", [error localizedDescription]);
	}
}

-(void) copyofflinedbZonas
{
	BOOL success;
	NSFileManager *fileManager = [NSFileManager defaultManager];
	NSError *error;
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	NSString *writableDBPath = [documentsDirectory stringByAppendingPathComponent:@"zonas.txt"];
	success = [fileManager fileExistsAtPath:writableDBPath];
	if (success) return;
	// The writable database does not exist, so copy the default to the appropriate location.
	NSString *defaultDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"zonas.txt"];
	success = [fileManager copyItemAtPath:defaultDBPath toPath:writableDBPath error:&error];
	if (!success) 
	{
		NSAssert1(0, @"Failed to create writable zonas file with message '%@'.", [error localizedDescription]);
	}
}



-(void) copyofflinedb
{
	[self copyofflinedbZonas];
	[self copyofflinedbCocinas];
	[self copyofflinedbCaract];
	
	
}


- (void)initializeDatabase
{
	// The database is stored in the application bundle. 
	/*

	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	NSString *path = [documentsDirectory stringByAppendingPathComponent:SQLDATABASENAME];
	// Open the database. The database was prepared outside the application.
	if (sqlite3_open([path UTF8String], &database) == SQLITE_OK) 
	{
	} 
	else 
	{
		// Even though the open failed, call close to properly clean up resources.
		//sqlite3_close(database);
		NSAssert1(0, @"Failed to open database with message '%s'.", sqlite3_errmsg(database));
		// Additional error handling, as appropriate...
	}
	 */
}

-(void)startdatabase
{
	[self createEditableCopyOfDatabaseIfNeeded];
	[self initializeDatabase];
}



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
	is_ipod =(([[[UIDevice currentDevice]model]isEqualToString:@"iPod touch"]) || ([[[UIDevice currentDevice]model]isEqualToString:@"iPad"]));
	cocinaID=0;
	precioD=0;
	precioH=1000;
	zonaID=0;
	caractsID=@"";
	
	is_simulator = [[[UIDevice currentDevice]model]isEqualToString:@"iPhone Simulator"];
	loggedin=NO;
	timercancel=nil;
    // Override point for customization after app launch    
	//    [window addSubview:viewController.view];
	
	backAlert2 = [[UIAlertView alloc]initWithTitle:@"Guía Oleo" message:@"No hay coneccion a internet." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
	

	[self copyofflinedb];

	//[self startdatabase];
	theLocationActual.latitude= -34.56802;
	theLocationActual.longitude=-58.43083;

	horizontalAccuracy=0;

	[[Reachability sharedReachability] setHostName: @"www.apple.com"];
	[[Reachability sharedReachability] setNetworkStatusNotificationsEnabled:YES];
	mytabview = [[MyTabBarController alloc] init];
	
    [window makeKeyAndVisible];
	window.backgroundColor =[UIColor colorWithPatternImage:[UIImage imageNamed:@"BGMAIN.png"]];
	[window addSubview:[mytabview view]];
	if (is_simulator) 
	{
		theLocationActual.latitude= -34.56802;
		theLocationActual.longitude=-58.43083;
		horizontalAccuracy=90;

	}

	return YES;
}



- (void)applicationWillTerminate:(UIApplication *)application {
	// Save data if appropriate
	//sqlite3_close(database);
//	[UChache saveImages];
}



- (void)dealloc {
    [mytabview release];
    [window release];
    [super dealloc];
}


- (void)updateStatus
{
	// Query the SystemConfiguration framework for the state of the device's network connections.
	self.internetConnectionStatus	= [[Reachability sharedReachability] internetConnectionStatus];
	
}
- (void)reachabilityChanged:(NSNotification *)note
{
    [self updateStatus];
}



-(void) shownotreacheable
{
	[backAlert2 show];
}




-(void) cancell:(id)aobj
{
	[myLM stopUpdatingLocation];
	if (is_simulator) 
	{
		theLocationActual.latitude= -34.56802;
		theLocationActual.longitude=-58.43083;
		horizontalAccuracy=90;
		
	}
	[thecercanos timeout];
}	



-(void)getlocation
{
	if (is_simulator) 
	{
	//	return;
	}
	horizontalAccuracy=-1;


	
	if(myLM)
	{
		[myLM release];
		myLM=nil;
	}
	
	myLM = [[CLLocationManager alloc] init];
	myLM.desiredAccuracy = kCLLocationAccuracyKilometer;
	myLM.distanceFilter = kCLDistanceFilterNone;
	myLM.delegate = self;
	
	doget=YES;
	if (timercancel!=nil)
	{
		[timercancel invalidate];
		[timercancel release];
		timercancel=nil;
	}
	timercancel = [NSTimer scheduledTimerWithTimeInterval:	10		// seconds
												   target:		self
												 selector:	@selector (cancell:)
												 userInfo:	self		// makes the currently-active audio queue (record or playback) available to the updateBargraph method
												  repeats:	NO];
	[timercancel retain];
	[myLM startUpdatingLocation]; // get the coords
	
	
}



- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
	[myLM stopUpdatingLocation]; // stop the subsequent events
	[timercancel invalidate];
	if (is_simulator) 
	{
		theLocationActual.latitude= -34.56802;
		theLocationActual.longitude=-58.43083;
		horizontalAccuracy=90;
		
	}
	
	[thecercanos forbiden];
	
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
	
	
	NSMutableString *update = [[[NSMutableString alloc] init] autorelease];
	
	self.theLocationActual=newLocation.coordinate;
	
	// Timestamp	
	NSDateFormatter *dateFormatter = [[[NSDateFormatter alloc] init]  autorelease];
	[dateFormatter setDateStyle:NSDateFormatterMediumStyle];
	[dateFormatter setTimeStyle:NSDateFormatterMediumStyle];
	[update appendFormat:@"%@\n\n", [dateFormatter stringFromDate:newLocation.timestamp]];
	
	// Horizontal coordinates
	if (signbit(newLocation.horizontalAccuracy)) {
		// Negative accuracy means an invalid or unavailable measurement
		[update appendString:@"LatLongUnavailable"];
	} else {
		// CoreLocation returns positive for North & East, negative for South & West
		[update appendFormat:@"LatLongFormat %f %f", // This format takes 4 args: 2 pairs of the form coordinate + compass direction
		 fabs(newLocation.coordinate.latitude), signbit(newLocation.coordinate.latitude) ?@"South" : @"North",
		 fabs(newLocation.coordinate.longitude),	signbit(newLocation.coordinate.longitude) ? @"West" : @"East"];
		[update appendString:@"\n"];
		[update appendFormat:@"MeterAccuracyFormat %f", newLocation.horizontalAccuracy];
		horizontalAccuracy = newLocation.horizontalAccuracy ;
		if (newLocation.horizontalAccuracy <= 100)
		{
			[myLM stopUpdatingLocation]; // stop the subsequent events
			[timercancel invalidate];
			horizontalAccuracy=newLocation.horizontalAccuracy;
			doget=NO;
			if (is_simulator) 
			{
				theLocationActual.latitude= -34.56802;
				theLocationActual.longitude=-58.43083;
				horizontalAccuracy=90;
				
			}
			[thecercanos done];
		}
		
		
	}
	[update appendString:@"\n\n"];
	
	// Altitude
	if (signbit(newLocation.verticalAccuracy)) {
		// Negative accuracy means an invalid or unavailable measurement
		[update appendString:@"AltUnavailable"];
	} else {
		// Positive and negative in altitude denote above & below sea level, respectively
		[update appendFormat:@"AltitudeFormat %f %@", fabs(newLocation.altitude),	(signbit(newLocation.altitude)) ? @"BelowSeaLevel" : @"AboveSeaLevel"];
		[update appendString:@"\n"];
		[update appendFormat:@"MeterAccuracyFormat %f", newLocation.verticalAccuracy];
	}
	[update appendString:@"\n\n"];
	
	// Calculate disatance moved and time elapsed, but only if we have an "old" location
	//
	// NOTE: Timestamps are based on when queries start, not when they return. CoreLocation will query your
	// location based on several methods. Sometimes, queries can come back in a different order from which
	// they were placed, which means the timestamp on the "old" location can sometimes be newer than on the
	// "new" location. For the example, we will clamp the timeElapsed to zero to avoid showing negative times
	// in the UI.
	//
	if (oldLocation != nil) {
		CLLocationDistance distanceMoved = [newLocation getDistanceFrom:oldLocation];
		NSTimeInterval timeElapsed = [newLocation.timestamp timeIntervalSinceDate:oldLocation.timestamp];
		
		[update appendFormat:(@"LocationChangedFormat"), distanceMoved];
		if (signbit(timeElapsed)) {
			[update appendString:(@"FromPreviousMeasurement")];
		} else {
			[update appendFormat:(@"TimeElapsedFormat"), timeElapsed];
		}
		[update appendString:@"\n\n"];
		
	}
	
	// Send the update to our delegate
	//[self.delegate newLocationUpdate:update];
//	NSLog(update);
	
	
	
}




@end
