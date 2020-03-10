//
//  FaceBook.h
//  CAS
//
//  Created by Moises Swiczar on 12/7/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "./FB/FBConnect/FBConnect.h"
#import "./FB/FBConnect/FBRequest.h"

@interface FaceBook : UIViewController <FBDialogDelegate, FBSessionDelegate, FBRequestDelegate>{
	IBOutlet UITextField *textUser;
	IBOutlet UITextField *textpass;
	IBOutlet UIActivityIndicatorView* progressIndTable;
	NSTimer* atimergetdata;
	IBOutlet UILabel* labeltext;
	IBOutlet UITextView* texttosubmit;
	NSString* astr;
	FBSession* _session;
	FBRequest* _getSessionRequest;
	BOOL loged;
	IBOutlet UILabel * labelloginForm;
	IBOutlet UILabel * labelloginoutCaption;
	
	IBOutlet UIButton *butonpost;
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

/*
- (void)askPermission:(id)target;
- (void)publishFeed:(id)target;
- (void)setStatus:(id)target;
- (void)uploadPhoto:(id)target;
*/
@end
