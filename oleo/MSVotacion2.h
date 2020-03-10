//
//  MSVotacion2.h
//  oleo
//
//  Created by Moises Swiczar on 5/23/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MSVotacion2 : UIViewController {
	IBOutlet UILabel *label_precio;
	IBOutlet UILabel *label_comentario;
	
	IBOutlet UITextView * text_desc;
	IBOutlet UITextField * text_precio;
	UIViewController * theview;
	
	IBOutlet UILabel * lable1;
	IBOutlet UILabel * lable2;
	IBOutlet UILabel * lable3;
	IBOutlet UILabel * lable4;
	IBOutlet UILabel * lable5;
	
	NSMutableDictionary * thedict ;
	
	UIActivityIndicatorView *progressInd;
	UIAlertView             *backAlert;
	NSTimer	                *atimergetdata;
	
	
	
}

-(IBAction) clicksend:(id)aobj;

@property (nonatomic,assign) NSMutableDictionary * thedict ;
@property (nonatomic,assign) UIViewController * theview;

@end
