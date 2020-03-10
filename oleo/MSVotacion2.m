//
//  MSVotacion2.m
//  oleo
//
//  Created by Moises Swiczar on 5/23/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "MSVotacion2.h"
#import "oleoAppDelegate.h"
#import "WSCall.h"

@implementation MSVotacion2
@synthesize theview,thedict;


// RGB % 37 44 00 

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



-(void) loaddata:(id)aobj
{
	UIAlertView * aler;
	
	oleoAppDelegate *appDelegate = (oleoAppDelegate *)[[UIApplication sharedApplication] delegate];
	[thedict setObject:appDelegate.theUserNick forKey:@"apodo"];
	

	NSUInteger salida =[WSCall callRegistrarVoto:thedict];
	if (salida==0)
	{
		[self workOnBackground:NO];

		aler = [[UIAlertView alloc] initWithTitle:@"Guía Oleo" message:@"Comentario Enviado\nGracias por su tiempo." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
		[aler show];
		[aler release];

		
		[self.navigationController popToViewController:theview animated:YES];

	}
	else 
	{
		[self workOnBackground:NO];
		UIAlertView * aler;
		switch (salida) {
			case 7:
				aler = [[UIAlertView alloc] initWithTitle:@"Guía Oleo" message:@"180 días del último voto a un restaurante." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
				break;
			case 8:
				aler = [[UIAlertView alloc] initWithTitle:@"Guía Oleo" message:@"Usuario Existente." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
				break;
			case 9:
				aler = [[UIAlertView alloc] initWithTitle:@"Guía Oleo" message:@"El precio indicado se encuentra fuera del rango permitido." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
				break;
				
			default:
				aler = [[UIAlertView alloc] initWithTitle:@"Guía Oleo" message:@"Problemas en el proceso de inserción (Problemas del servidor)." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
		}
		[aler show];
		[aler release];
	}
	
}





 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
		self.title =@"Votar";
		progressInd = [[UIActivityIndicatorView alloc] init];
		progressInd.hidesWhenStopped = YES;
		progressInd.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhite;
		[progressInd sizeToFit];
		progressInd.autoresizingMask = (UIViewAutoresizingFlexibleLeftMargin |
										UIViewAutoresizingFlexibleRightMargin |
										UIViewAutoresizingFlexibleTopMargin |
										UIViewAutoresizingFlexibleBottomMargin);
		
		backAlert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"", @"")
											   message:NSLocalizedString(@"Enviando información.\nPor favor aguarde.", @"") 
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

 	/*
	label_precio.textColor = [UIColor colorWithRed:0.85 green:0.97 blue:0.62 alpha:0.99];
 	label_comentario.textColor = [UIColor colorWithRed:0.85 green:0.97 blue:0.62 alpha:0.99];
	
	label_precio.font = [UIFont boldSystemFontOfSize:18];
	label_comentario.font = [UIFont boldSystemFontOfSize:18];
	 */
	text_desc.font= [UIFont systemFontOfSize:14];
	text_desc.text =@"";
	
	
	label_precio.textColor = [UIColor colorWithRed:0.85 green:0.97 blue:0.62 alpha:0.99];
	label_precio.font = [UIFont fontWithName:@"Arial-BoldMT" size:15];

	
	label_comentario.textColor = [UIColor colorWithRed:0.85 green:0.97 blue:0.62 alpha:0.99];
	label_comentario.font = [UIFont fontWithName:@"Arial-BoldMT" size:15];

	
	lable1.textColor = [UIColor colorWithRed:0 green:0 blue:0.0 alpha:0.5];
	lable2.textColor = [UIColor colorWithRed:0 green:0 blue:0.0 alpha:0.5];
	lable3.textColor = [UIColor colorWithRed:0 green:0 blue:0.0 alpha:0.5];
	lable4.textColor = [UIColor colorWithRed:0 green:0 blue:0.0 alpha:0.5];
	lable5.textColor = [UIColor colorWithRed:0 green:0 blue:0.0 alpha:0.5];
	

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

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
	CGRect arect = textView.frame;
	CGRect arectfra = self.view.frame;
	
	[UIView beginAnimations:@"" context:nil];
	[UIView setAnimationDuration:.3];
	arectfra.origin.y = -arect.origin.y;
	
	self.view.frame = arectfra;
	[UIView commitAnimations];
	return YES;
}

- (void)dealloc {
    [super dealloc];
}



-(IBAction) clicksend:(id)aobj
{
	[text_desc resignFirstResponder];
	[text_precio resignFirstResponder];
	
	[thedict setObject:text_precio.text    forKey:@"precio"];
	[thedict setObject:text_desc.text    forKey:@"comentario"];

	
	CGRect arectfra = self.view.frame;
	
	[UIView beginAnimations:@"" context:nil];
	[UIView setAnimationDuration:.3];
	arectfra.origin.y =0;
	
	self.view.frame = arectfra;
	[UIView commitAnimations];	

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

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
	[textField resignFirstResponder];
	return NO;
}








@end
