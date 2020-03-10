//
//  MSVotacion1.h
//  oleo
//
//  Created by Moises Swiczar on 5/23/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MSVotacion2.h"

@interface MSVotacion1 : UIViewController {

	UIBarButtonItem* theInfo2;
	IBOutlet UILabel *label_fecha;
	IBOutlet UILabel *label_horario;
	IBOutlet UILabel *label_valorizacion;
	IBOutlet UITextField * text_fecha;
	
	
	
	IBOutlet UIImageView *image_comida;
	IBOutlet UIImageView *image_servicio;
	IBOutlet UIImageView *image_amb;
	IBOutlet UIImageView *image_vino;
	
	
	IBOutlet UIImageView *view_mov_noche_dia_selector;
	
	
	
	MSVotacion2 * thevotacion2;
	
	NSUInteger comida;
	NSUInteger servicio;
	NSUInteger ambiente;
	NSUInteger vino;
	BOOL noche;
	UIViewController * theview;

	IBOutlet UIDatePicker * thepicker;
	
	NSMutableDictionary * thedictvotar;
	NSString * theid;
}

@property (nonatomic,assign) UIViewController * theview;

@property (nonatomic,copy) NSString * theid;

-(IBAction) clickvote:(id)aobj;
-(IBAction) clickCont:(id)aobj;
-(IBAction) clickNoche:(id)aobj;


@end
