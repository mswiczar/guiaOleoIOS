//
//  RobtwitterViewController.m
//  Robtwitter
//
//  Created by Moises Swiczar on 5/19/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "RobtwitterViewController.h"
#import "WSCallTwitt.h"
#import "UChache.h"
//#import "mobiMakeupAppDelegate.h"

@implementation RobtwitterViewController
@synthesize  astr;;

NSMutableDictionary* alogin;

// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
		self.title =@"Compartir en Twitter";
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
	buttonsubmit.alpha=0;
	NSFileManager *fileManager = [NSFileManager defaultManager];
	//NSError *error;
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	NSString *writableDBPath = [documentsDirectory stringByAppendingPathComponent:@"twitter.txt"];
	BOOL success = [fileManager fileExistsAtPath:writableDBPath];
	if (success) 
	{
		alogin = [[NSMutableDictionary alloc]initWithContentsOfFile:writableDBPath];
		textUser.text=[alogin objectForKey:@"username"];
		textpass.text =  [alogin objectForKey:@"password"];
	};
	texttosubmit.text =  astr;
	self.view.backgroundColor = [UIColor clearColor];
//	dimmerAction(nil);
	texttosubmit.font = [UIFont fontWithName:@"Helvetica" size:14];
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
    [super dealloc];
}


-(BOOL) saveTwitter
{
//	dimmerAction(nil);
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	NSString *writableDBPath = [documentsDirectory stringByAppendingPathComponent:@"twitter.txt"];
	

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
	if(alogin==nil)
	{
		alogin = [[NSMutableDictionary alloc]init];
	}
	
	[alogin setObject:textUser.text forKey:@"username"];
	[alogin setObject:textpass.text forKey:@"password"];
	
	NSInteger aint = [WSCallTwitt DoLogin:alogin];

  if (aint==1)
	{
		[self saveTwitter];
		UIAlertView *theerror  = [[UIAlertView alloc]initWithTitle:@"Guía Oleo" message:@"Sesion iniciada" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
		[theerror show];
		[theerror release];
		buttonsubmit.alpha=1;

		[progressIndTable stopAnimating];
		return;
	}
	else
	{
		UIAlertView *theerror  = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Credenciales erroneas!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
		[theerror show];
		[theerror release];
		buttonsubmit.alpha=0;

	}
	[progressIndTable stopAnimating];
	
}





-(IBAction) clicklogin:(id)aobj
{
//	Ca *appDelegate = (RobtwitterAppDelegate *)[[UIApplication sharedApplication] delegate];
	//[appDelegate updateStatus];
	
//	if (appDelegate.internetConnectionStatus!=NotReachable)
	//dimmerAction(nil);
		[textpass endEditing:TRUE];
		[textUser endEditing:TRUE];

		[progressIndTable startAnimating];
		atimergetdata = [NSTimer scheduledTimerWithTimeInterval:	1		// seconds
													 target:		self
												   selector:	@selector (agetdata2:)
												   userInfo:	self		// makes the currently-active audio queue (record or playback) available to the updateBargraph method
													repeats:	NO];
/*
	else
	{
		UIAlertView * backAlert2 = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"No Internet Connection", @"")
															  message:NSLocalizedString(@"This application needs internet connection\nDo you want to work offline?", @"")
															 delegate:self 
													cancelButtonTitle:@"YES"
													otherButtonTitles:@"NO",nil];
		
		[backAlert2 show];
		[backAlert2 release];
	
	}
 */
}





-(IBAction) clickForget:(id)aobj
{
//	dimmerAction(nil);
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://twitter.com/account/resend_password"]];
}



- (BOOL)textFieldShouldReturn:(UITextField *)textField     
{
//	dimmerAction(nil);
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
	//dimmerAction(nil);
	textpass.text=@"";
	textUser.text=@"";
}

-(IBAction) clickReturn:(id)aobj
{
	//dimmerAction(nil);
	[self.navigationController popViewControllerAnimated:YES];

}

-(IBAction) clickPost:(id)aobj
{
	//dimmerAction(nil);
	if([WSCallTwitt DoUpdateStatus:alogin theid:nil themessage:texttosubmit.text inreplyofstatus:nil])
	{
		UIAlertView *theerror  = [[UIAlertView alloc]initWithTitle:@"Guía Oleo" message:@"Twit agregado." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
		[theerror show];
		[theerror release];

	}
	else
	{
		UIAlertView *theerror  = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Error al enviar datos" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
		[theerror show];
		[theerror release];
		
	}
	[self.navigationController popViewControllerAnimated:YES];

}


-(void) show 
{
//	dimmerAction(nil);
	texttosubmit.text =  astr;
}


@end
