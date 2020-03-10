//
//  MSRegistracion.h
//  oleo
//
//  Created by Moises Swiczar on 5/23/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MSVotacion1.h"

@interface MSRegistracion : UIViewController {
	IBOutlet UITextField *nombre;
	IBOutlet UITextField *apellido;
	IBOutlet UITextField *email;
	IBOutlet UITextField *email2;
	IBOutlet UITextField *pass;
	IBOutlet UITextField *pass2;
	IBOutlet UITextField *apodo;
	IBOutlet UITextField *telefono;

	UIViewController * theview;
	MSVotacion1* thevot;
	
	IBOutlet UILabel * label1terms;
	IBOutlet UILabel * label2terms;
	NSMutableDictionary * thedict;
	
	
	UIActivityIndicatorView *progressInd;
	UIAlertView             *backAlert;
	NSTimer	                *atimergetdata;
	
	NSString * theid;
	
	
	
}

@property (nonatomic,copy) NSString * theid;

@property (nonatomic,assign) UIViewController * theview;

	
	

-(IBAction) clickenviar:(id)aobj;

@end
