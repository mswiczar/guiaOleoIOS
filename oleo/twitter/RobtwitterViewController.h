//
//  RobtwitterViewController.h
//  Robtwitter
//
//  Created by Moises Swiczar on 5/19/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RobtwitterViewController : UIViewController {
	IBOutlet UITextField *textUser;
	IBOutlet UITextField *textpass;
	IBOutlet UIActivityIndicatorView* progressIndTable;
	NSTimer* atimergetdata;
	IBOutlet UILabel* labeltext;
	IBOutlet UITextView* texttosubmit;

	IBOutlet UIButton * buttonsubmit;

	NSString* astr;
	IBOutlet UILabel * label1;
	IBOutlet UILabel * label2;
	
	
}
@property (nonatomic,copy) NSString* astr;
-(IBAction) clicklogin:(id)aobj;
-(IBAction) clickForget:(id)aobj;
-(IBAction) clickReturn:(id)aobj;
-(IBAction) clickPost:(id)aobj;

-(void) show ;



-(void) clearaldata;


@end

