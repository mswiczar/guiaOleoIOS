//
//  MSLogin.h
//  oleo
//
//  Created by Moises Swiczar on 5/23/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MSRegistracion.h"
#import "MSVotacion1.h"

@interface MSLogin : UIViewController {
	
	IBOutlet  UITextField *textUsername;
	IBOutlet  UITextField *textPass;
	MSRegistracion * theregistracion;
	MSVotacion1* thevbotacion;
	UIViewController * theview;
	
	UIActivityIndicatorView *progressInd;
	UIAlertView             *backAlert;
	NSTimer	                *atimergetdata;
	
	NSString* theid;
	
}
@property (nonatomic,copy) NSString * theid;
@property (nonatomic,assign) UIViewController * theview;

-(IBAction) clickLogin:(id)aobj;
-(IBAction) clickRegister:(id)aobj;

@end
