//
//  FaceBook.m
//  CAS
//
//  Created by Moises Swiczar on 12/7/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "FaceBook.h"F



//#import "WSCall.h"
#import "UChache.h"
//#import "mobiMakeupAppDelegate.h"


@implementation FaceBook
@synthesize  astr;

NSMutableDictionary* alogin;



// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
		static NSString* kApiKey = @"3357071aa88b8c8e36133c99b7c8879c";
		
		// Enter either your API secret or a callback URL (as described in documentation):
		static NSString* kApiSecret = @"ab1380ea7e3c1578d3e389e7089449d6"; // @"<YOUR SECRET KEY>";
		_session = [[FBSession sessionForApplication:kApiKey secret:kApiSecret delegate:self] retain];
		self.title =@"Facebook";
		
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
	
	NSFileManager *fileManager = [NSFileManager defaultManager];
	//NSError *error;
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	NSString *writableDBPath = [documentsDirectory stringByAppendingPathComponent:@"facebook.txt"];
	BOOL success = [fileManager fileExistsAtPath:writableDBPath];
	if (success) 
	{
		alogin = [[NSMutableDictionary alloc]initWithContentsOfFile:writableDBPath];
		textUser.text=[alogin objectForKey:@"username"];
		textpass.text =  [alogin objectForKey:@"password"];
	};
	texttosubmit.text =  astr;
	self.view.backgroundColor = [UIColor clearColor];
	texttosubmit.font = [UIFont fontWithName:@"Helvetica" size:14];
	//dimmerAction(nil);
	labelloginForm.text =  [NSString stringWithFormat:@"Informacion Sesion"];
	labelloginoutCaption.text =@"Iniciar";
	self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bgcolor.png"]];
	
	label1.textColor = [UIColor colorWithRed:0.85 green:0.97 blue:0.62 alpha:0.99];
	label1.font = [UIFont fontWithName:@"Arial-BoldMT" size:15];
	
	label2.textColor = [UIColor colorWithRed:0.85 green:0.97 blue:0.62 alpha:0.99];
	label2.font = [UIFont fontWithName:@"Arial-BoldMT" size:15];
	
	

}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (void)dealloc {
	[_session release];
    [super dealloc];
}


-(BOOL) saveTwitter
{
	//dimmerAction(nil);

	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	NSString *writableDBPath = [documentsDirectory stringByAppendingPathComponent:@"facebook.txt"];
	
	if ([alogin writeToFile:writableDBPath atomically:YES])
	{
		
	}
	else
	{
		
	}
	return YES;
	
}



-(void) agetdata2:(id)aobj
{
	//dimmerAction(nil);

	if(alogin==nil)
	{
		alogin = [[NSMutableDictionary alloc]init];
	}
	
	[alogin setObject:textUser.text forKey:@"username"];
	[alogin setObject:textpass.text forKey:@"password"];

	UIAlertView *theerror  = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Credenciales erroneas!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
	[theerror show];
	[theerror release];
	
	[progressIndTable stopAnimating];
	
}





-(IBAction) clicklogin:(id)aobj
{
	//dimmerAction(nil);

	[texttosubmit resignFirstResponder];
	
	if(loged==NO)
	{
		FBLoginDialog* dialog = [[[FBLoginDialog alloc] initWithSession:_session] autorelease];
		[dialog show];
	}
	else
	{
		loged=NO;
		[_session logout];
	}
	
}





-(IBAction) clickForget:(id)aobj
{

	[texttosubmit resignFirstResponder];

	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.facebook.com/reset.php"]];
}



- (BOOL)textFieldShouldReturn:(UITextField *)textField     
{


	if ([textField isEqual:textUser])
	{
		[textpass becomeFirstResponder];
	}
	
	if ([textField isEqual:textpass])
	{
		[textField endEditing:TRUE];
		[self clicklogin:self];
	}
	[textField endEditing:TRUE];
	return YES;
}


-(void) clearaldata
{

	textpass.text=@"";
	textUser.text=@"";
}
	
-(IBAction) clickReturn:(id)aobj
{
		[texttosubmit resignFirstResponder];
		[self.navigationController popViewControllerAnimated:YES];
}
	
-(IBAction) clickPost:(id)aobj
{

	NSString *statusString =astr;
		NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:
								statusString, @"status",
								@"true", @"status_includes_verb",
								nil];
	[[FBRequest requestWithDelegate:self] call:@"facebook.users.setStatus" params:params];
		
}
	
	
-(void) show 
{
		texttosubmit.text =  astr;
	if (loged) {
		butonpost.alpha=1;
	}
	else {
		butonpost.alpha=0;
	}

	
}
	

- (void)setStatus:(id)target {
	NSString *statusString =astr;
	NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:
							statusString, @"status",
							@"true", @"status_includes_verb",
							nil];
	[[FBRequest requestWithDelegate:self] call:@"facebook.users.setStatus" params:params];
}

- (void)dialog:(FBDialog*)dialog didFailWithError:(NSError*)error {
	UIAlertView *theerror  = [[UIAlertView alloc]initWithTitle:@"Guía Oleo" message:[NSString stringWithFormat:@"Error(%d) %@", error.code,
																						error.localizedDescription]
													  delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
	[theerror show];
	[theerror release];
	
}

- (void)session:(FBSession*)session didLogin:(FBUID)uid {
	NSString* fql = [NSString stringWithFormat:
					 @"select uid,name from user where uid == %lld", session.uid];
	
	NSDictionary* params = [NSDictionary dictionaryWithObject:fql forKey:@"query"];
	[[FBRequest requestWithDelegate:self] call:@"facebook.fql.query" params:params];
}


- (void)sessionDidLogout:(FBSession*)session {
	loged=NO;

	labelloginForm.text =  [NSString stringWithFormat:@"Login Info"];
	labelloginoutCaption.text =@"LOGIN";

}

- (void)request:(FBRequest*)request didLoad:(id)result {
	if ([request.method isEqualToString:@"facebook.fql.query"]) {
		NSArray* users = result;
		NSDictionary* user = [users objectAtIndex:0];
		NSString* name = [user objectForKey:@"name"];
		loged=YES;
		if (loged) {
			butonpost.alpha=1;
		}
		else {
			butonpost.alpha=0;
		}
		
		
		labelloginForm.text =  [NSString stringWithFormat:@"Logged in as %@", name];
		labelloginoutCaption.text =@"LOGOUT";
		FBPermissionDialog* dialog = [[[FBPermissionDialog alloc] init] autorelease];
		dialog.delegate = self;
		dialog.permission = @"status_update";
		[dialog show];
		
		
		
	} else if ([request.method isEqualToString:@"facebook.users.setStatus"]) {
		NSString* success = result;
		if ([success isEqualToString:@"1"]) {
			UIAlertView *theerror  = [[UIAlertView alloc]initWithTitle:@"Guía Oleo" message:@"Estado modificado" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
			[theerror show];
			[theerror release];

			
		} else {
			UIAlertView *theerror  = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Problemas" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
			[theerror show];
			[theerror release];
		}
		[self.navigationController popViewControllerAnimated:YES];

	}
}

@end
