//
//  MSRegistracion.m
//  oleo
//
//  Created by Moises Swiczar on 5/23/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "MSRegistracion.h"
#import "WSCall.h"
#import "oleoAppDelegate.h"

@implementation MSRegistracion
@synthesize theview,theid;
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
		self.title =@"Registración";
		thevot=nil;
		thedict = [[NSMutableDictionary alloc]init];
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
	NSUInteger salida =[WSCall callRegistrarUser:thedict];
	if (salida==0)
	{
		[self workOnBackground:NO];
		
		NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
		NSString *documentsDirectory = [paths objectAtIndex:0];
		NSString *writableDBPath = [documentsDirectory stringByAppendingPathComponent:@"oleo.txt"];
		
		
		oleoAppDelegate *appDelegate = (oleoAppDelegate *)[[UIApplication sharedApplication] delegate];
		appDelegate.loggedin =YES;
		[thedict  setObject:email.text forKey:@"username"];

		if ([thedict writeToFile:writableDBPath atomically:YES])
		{
			
		}
		else
		{
			
		}
		

		if(thevot==nil)
		{
			thevot = [[MSVotacion1 alloc] initWithNibName:@"MSVotacion1" bundle:nil];
		}		
		thevot.theview = self.theview;
		thevot.theid = self.theid;
		
		[self.navigationController pushViewController:thevot animated:YES];
	}
	else 
	{
		[self workOnBackground:NO];
		UIAlertView * aler;
		switch (salida) {
			case 2:
				aler = [[UIAlertView alloc] initWithTitle:@"Guia Oleo" message:@"Faltan completar los datos obligatorios." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
				break;
			case 4:
				aler = [[UIAlertView alloc] initWithTitle:@"Guia Oleo" message:@"Usuario Existente." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
				break;
			case 5:
				aler = [[UIAlertView alloc] initWithTitle:@"Guia Oleo" message:@"Problemas en el proceso de inserción (Problemas del servidor)." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
				break;
				
			default:
				aler = [[UIAlertView alloc] initWithTitle:@"Guia Oleo" message:@"Error" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
		}
		[aler show];
		[aler release];
	}
	
}




// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bgcolor.png"]];

	label1terms.textColor = [UIColor colorWithRed:0 green:0 blue:0.0 alpha:0.5];
	label2terms.textColor = [UIColor colorWithRed:0 green:0 blue:0.0 alpha:0.5];

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
	if(thevot!=nil)
	{
		[thevot release];
		thevot=nil;

	}
	[super didReceiveMemoryWarning];

    // Release any cached data, images, etc that aren't in use.
}

- (void)viewWillAppear:(BOOL)animated
{
	[nombre resignFirstResponder];
	[apellido resignFirstResponder];
	[email resignFirstResponder];
	[email2 resignFirstResponder];
	[pass resignFirstResponder];
	[pass2 resignFirstResponder];
	[apodo resignFirstResponder];
	[telefono resignFirstResponder];
	
	
	[UIView beginAnimations:@"" context:nil];
	[UIView setAnimationDuration:.3];
	CGRect arect = self.view.frame;
	arect.origin.y = 0;
	self.view.frame = arect;
	[UIView commitAnimations];
	
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	if(thevot!=nil)
	{
		thevot=nil;
		[thevot release];
		thevot=nil;

	}
    [super dealloc];
	
}

-(BOOL) checkallform
{
	UIAlertView* thealert;
	
	if ([nombre.text isEqualToString:@""])
	{
		thealert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"El campo del nombre no puede ser nulo." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
		[thealert show];
		[thealert release];
		[nombre becomeFirstResponder];
		return NO;
	}
	
	if ([apellido.text isEqualToString:@""])
	{
		thealert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"El campo del apellido no puede ser nulo." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
		[thealert show];
		[thealert release];
		[apellido becomeFirstResponder];
		
		return NO;
	}

	if ([email.text isEqualToString:@""])
	{
		thealert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"El campo del email no puede ser nulo." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
		[thealert show];
		[thealert release];
		[email becomeFirstResponder];
		return NO;
	}
	
	if ([email2.text isEqualToString:@""])
	{
		thealert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"El campo de verificación email no puede ser nulo." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
		[thealert show];
		[thealert release];
		[email2 becomeFirstResponder];
		return NO;
	}

	if ([pass.text isEqualToString:@""])
	{
		thealert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"El campo de contraseña no puede ser nulo." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
		[thealert show];
		[thealert release];
		[pass becomeFirstResponder];
		
		return NO;
	}

	if ([pass2.text isEqualToString:@""])
	{
		thealert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"El campo de verificación contraseña de confirmacion no puede ser nulo." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
		[thealert show];
		[thealert release];
		[pass becomeFirstResponder];
		
		return NO;
	}

	if ([apodo.text isEqualToString:@""])
	{
		thealert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"El campo de apodo no puede ser nulo." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
		[thealert show];
		[thealert release];
		[apodo becomeFirstResponder];
		
		return NO;
	}

	if ([telefono.text isEqualToString:@""])
	{
		thealert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"El campo de telefono no puede ser nulo." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
		[thealert show];
		[thealert release];
		[telefono becomeFirstResponder];
		
		return NO;
	}
	
	
	if (![email.text isEqualToString:email2.text])
	{
		thealert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"El campo de email es distinto al  email de verificación." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
		[thealert show];
		[thealert release];

		[email becomeFirstResponder];
		return NO;
		
	}

	
	if (![pass.text isEqualToString:pass2.text])
	{
		thealert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"El campo de contrasña es distinto a la contraseña de verificación." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
		[thealert show];
		[thealert release];
		[telefono becomeFirstResponder];
		pass.text = @"";
		pass.text = @"";

		return NO;
		
	}
	
	[thedict removeAllObjects];
	
	[thedict  setObject:pass.text forKey:@"password"];
	[thedict  setObject:nombre.text forKey:@"nombre"];
	[thedict  setObject:apellido.text forKey:@"apellido"];
	[thedict  setObject:email.text forKey:@"email"];
	[thedict  setObject:apodo.text forKey:@"username"];
	[thedict  setObject:telefono.text forKey:@"telefono"];
	
	
	return YES;
}



- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
	CGRect arect = textField.frame;
	CGRect arectfra = self.view.frame;
	
	[UIView beginAnimations:@"" context:nil];
	[UIView setAnimationDuration:.3];
	arectfra.origin.y = -arect.origin.y+82;
	
	self.view.frame = arectfra;
	[UIView commitAnimations];
	
	
	return YES;
}




- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
	
	
	
	if ( textField ==nombre  )
	{
		[apellido becomeFirstResponder];
		return NO;
	}

	if ( textField ==apellido  )
	{
		[email becomeFirstResponder];
		return NO;
	}
	
	if ( textField ==email  )
	{
		[email2 becomeFirstResponder];
		return NO;
	}
	
	if ( textField ==email2  )
	{
		[pass becomeFirstResponder];
		return NO;
	}

	if ( textField ==pass  )
	{
		[pass2 becomeFirstResponder];
		return NO;
	}
	
	if ( textField ==pass2  )
	{
		[apodo becomeFirstResponder];
		return NO;
	}

	if ( textField ==apodo  )
	{
		[telefono becomeFirstResponder];
		return NO;
	}
	
	if ( textField ==telefono  )
	{
		[telefono resignFirstResponder];
		CGRect arect = self.view.frame;
		arect.origin.y = 0;
		self.view.frame = arect;	
		return NO;
	}
	
	return NO;
	
}



-(IBAction) clickenviar:(id)aobj
{
	if ([self checkallform])
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
	
	
}



@end
