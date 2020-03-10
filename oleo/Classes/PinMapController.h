//
//  PinMapController.h
//  AMRO
//
//  Created by Moises Swiczar on 8/28/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <MapKit/MKGeometry.h>
#import <MapKit/MKMapView.h>
#import <MapKit/MKTypes.h>
#import <MapKit/MKAnnotation.h>
#import <MapKit/MKReverseGeocoder.h>

@class MSDetalleRest;

@interface PinMapController : UIViewController {
	IBOutlet MKMapView * themap;
	CLLocationCoordinate2D thecenter;
	MKReverseGeocoder* geoCoder;
	MKPlacemark *mPlacemark;
	NSMutableArray *thearray;
	MSDetalleRest *theinfopin;

	BOOL is_Pin;
	BOOL loaded;
	BOOL cercanos;
}
@property (nonatomic) BOOL cercanos;
@property (nonatomic) BOOL is_Pin;
@property (nonatomic,assign) NSMutableArray *thearray;
-(void) show;
@end


