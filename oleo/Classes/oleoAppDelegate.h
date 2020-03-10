//
//  oleoAppDelegate.h
//  oleo
//
//  Created by Moises Swiczar on 5/4/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Reachability.h"
#import "/usr/include/sqlite3.h"
#import "MyTabBarController.h"
#import <CoreLocation/CoreLocation.h>
#import "UChache.h"

@class oleoViewController;
@class MSCercanos;


@interface oleoAppDelegate : NSObject <UIApplicationDelegate,CLLocationManagerDelegate> {
    UIWindow *window;
	sqlite3 *database;
   	NetworkStatus internetConnectionStatus;
	MyTabBarController *mytabview;
	BOOL is_ipod;
	BOOL is_simulator;
	UIAlertView * backAlert2; 
	CLLocationManager *myLM;
    BOOL doget;
	NSTimer* timercancel;
	CLLocationCoordinate2D theLocationActual;
	BOOL loggedin;
	MSCercanos * thecercanos;
	float horizontalAccuracy;
	
	NSString * theIDVotar;
	NSString * theUserNick;
	NSString *tel;

	NSUInteger cocinaID;
	NSUInteger precioD;
	NSUInteger precioH;
	NSString* caractsID;
	NSUInteger zonaID;
	
	NSString * strZona;
	NSString * strCocina;
	BOOL search_str;
	NSString * strsearch;	
	
	
}
@property (nonatomic,copy) NSString * strsearch;
@property (nonatomic) BOOL search_str;
@property (nonatomic,copy) NSString* strZona;
@property (nonatomic,copy) NSString* strCocina;


@property (nonatomic) NSUInteger cocinaID;
@property (nonatomic) NSUInteger precioD;
@property (nonatomic) NSUInteger precioH;
@property (nonatomic,copy) NSString* caractsID;
@property (nonatomic) NSUInteger zonaID;



-(void) getlocation;
@property (nonatomic,copy) NSString *tel;
@property (nonatomic,copy) NSString * theIDVotar;
@property (nonatomic,copy) NSString * theUserNick;


@property (nonatomic) float horizontalAccuracy;
@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic) CLLocationCoordinate2D  theLocationActual;

@property (nonatomic,assign)  MSCercanos * thecercanos;

@property (nonatomic) BOOL is_ipod;
@property (nonatomic) BOOL is_simulator;
@property (nonatomic) BOOL loggedin;


-(void) shownotreacheable;
- (void)updateStatus;
@property (nonatomic)sqlite3 *database ;

@property NetworkStatus internetConnectionStatus;

@property (nonatomic , readonly) MyTabBarController *mytabview;


@end

