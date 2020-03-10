//
//  MSPrecio.h
//  oleo
//
//  Created by Moises Swiczar on 5/18/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MSPrecio : UIViewController {

	IBOutlet UILabel *label_first;
	IBOutlet UILabel *label_min;
	IBOutlet UILabel *label_max;
	
	IBOutlet UISlider *slider_min;
	IBOutlet UISlider *slider_max;
	

	
}

-(IBAction) movePrecioDesde:(id)aob;
-(IBAction) movePrecioHasta:(id)aob;
-(IBAction) clickcont:(id)aob;


@end
