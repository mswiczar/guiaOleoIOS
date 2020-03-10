//
//  MSLogin.m
//  oleo
//
//  Created by Moises Swiczar on 5/23/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "MSLogin.h"
#import "WSCall.h"
#import "oleoAppDelegate.h"


@implementation MSLogin
@synthesize theview,theid;

NSMutableDictionary* alogin;


-(void)workOnBackground:(BOOL)background
{
	self.view.userInteractionEnabled = !background;
	if (background)
	{
		[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
		[backAlert show];
		[progressInd startAnimating];
		
	}
	else
	{
		[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
		[progressInd stopAnimating];
		[backAlert dismissWithClickedButtonIndex:0 animated:YES];
	}
}



 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
		self.title =@"Iniciar sesión";
		theregistracion = nil;
		thevbotacion=nil;
		progressInd = [[UIActivityIndicatorView alloc] init];
		progressInd.hidesWhenStopped = YES;
		progressInd.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhite;
		[progressInd sizeToFit];
		progressInd.autoresizingMask = (UIViewAutoresizingFlexibleLeftMargin |
										UIViewAutoresizingFlexibleRightMargin |
										UIViewAutoresizingFlexibleTopMargin |
										UIViewAutoresizingFlexibleBottomMargin);
		
		backAlert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"", @"")
											   message:NSLocalizedString(@"Buscando información.\nPor favor aguarde.", @"") 
											  delegate:nil 
									 cancelButtonTitle:nil
									 otherButtonTitles:nil];
		progressInd.center = CGPointMake(backAlert.frame.size.width / 2.0, -5.0);
		
		[backAlert addSubview:progressInd];
		


    }
    return self;
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bgcolor.png"]];

	[textUsername becomeFirstResponder];
	
	NSFileManager *fileManager = [NSFileManager defaultManager];
	//NSError *error;
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	NSString *writableDBPath = [documentsDirectory stringByAppendingPathComponent:@"oleo.txt"];
	BOOL success = [fileManager fileExistsAtPath:writableDBPath];
	alogin=nil;
	if (success) 
	{
		alogin = [[NSMutableDictionary alloc]initWithContentsOfFile:writableDBPath];
		textUsername.text=[alogin objectForKey:@"username"];
		textPass.text =  [alogin objectForKey:@"password"];
	};
	
	
	
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


-(void) loaddata:(id)aobj
{
	if(alogin==nil)
	{
		alogin = [[NSMutableDictionary alloc]init];
	}
	[alogin removeAllObjects];
	[alogin setObject:textUsername.text forKey:@"username"];
	[alogin setObject:textPass.text forKey:@"password"];
	
	if ([WSCall initSession:alogin])
	{
		[self workOnBackground:NO];

		NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
		NSString *documentsDirectory = [paths objectAtIndex:0];
		NSString *writableDBPath = [documentsDirectory stringByAppendingPathComponent:@"oleo.txt"];
 
 
		oleoAppDelegate *appDelegate = (oleoAppDelegate *)[[UIApplication sharedApplication] delegate];
		appDelegate.loggedin =YES;

		if ([alogin writeToFile:writableDBPath atomically:YES])
		{
 
		}
		else
		{
 
		}
		if(thevbotacion==nil)
		{
			thevbotacion = [[MSVotacion1 alloc] initWithNibName:@"MSVotacion1" bundle:nil];
		}	
		thevbotacion.theid = self.theid;

		thevbotacion.theview = self.theview;
		[self.navigationController pushViewController:thevbotacion animated:YES];
	}
	else 
	{
		[self workOnBackground:NO];
		UIAlertView * aler = [[UIAlertView alloc] initWithTitle:@"Guía Oleo" message:@"Usuario o password incorrectos." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
		[aler show];
		[aler release];
	}


}


-(IBAction) clickLogin:(id)aobj
{
	oleoAppDelegate *appDelegate = (oleoAppDelegate *)[[UIApplication sharedApplication] delegate];
	[appDelegate updateStatus];
	
	if (appDelegate.internetConnectionStatus!=NotReachable)
	{
		[self workOnBackground:YES];
		atimergetdata = [NSTimer scheduledTimerWithTimeInterval: 0.1
														 target: self
													   selector: @selector (loaddata:)
													   userInfo: self
														repeats: NO];
	}
	else 
	{

		[appDelegate shownotreacheable];	
	}
	
}




-(IBAction) clickRegister:(id)aobj
{
	
	if(theregistracion==nil)
	{
		theregistracion = [[MSRegistracion alloc] initWithNibName:@"MSRegistracion" bundle:nil];
	}		
	theregistracion.theview = self.theview;
	theregistracion.theid = self.theid;
	

	[self.navigationController pushViewController:theregistracion animated:YES];

}


- (BOOL)textFieldShouldReturn:(UITextField *)textField 
{
	if (textField==textUsername)
	{
		[textPass becomeFirstResponder];
	}
	else 
	{
		[textField endEditing:TRUE];
		[self clickLogin:self];

	}

	return YES;
}	




@end
