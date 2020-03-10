//
//  MSPrecio.m
//  oleo
//
//  Created by Moises Swiczar on 5/18/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "MSPrecio.h"
#import "oleoAppDelegate.h"


@implementation MSPrecio

 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
		self.title =@"Filtrar por precio";

    }
    return self;
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bgcolor.png"]];
	label_first.textColor = [UIColor colorWithRed:0.85 green:0.97 blue:0.62 alpha:0.99];
	label_first.font = [UIFont fontWithName:@"Arial-BoldMT" size:15];

	
	slider_min.value=0;
	slider_max.value=1;
	
	label_min.text= [NSString stringWithFormat:@"$ %.0f", (1000 * slider_min.value)];
	label_max.text= [NSString stringWithFormat:@"$ %.0f", (1000 * slider_max.value)];

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

- (void)viewWillAppear:(BOOL)animated
{
	self.navigationController.navigationBar.hidden=NO;
}


- (void)dealloc {
    [super dealloc];
}

-(IBAction) movePrecioDesde:(id)aob
{
	oleoAppDelegate *appDelegate = (oleoAppDelegate *)[[UIApplication sharedApplication] delegate];

	label_min.text= [NSString stringWithFormat:@"$ %.0f", (1000 * slider_min.value)];
	appDelegate.precioD = [[NSString stringWithFormat:@"%.0f", (1000 * slider_min.value)]intValue];
	

	
	
}
-(IBAction) movePrecioHasta:(id)aob
{
	oleoAppDelegate *appDelegate = (oleoAppDelegate *)[[UIApplication sharedApplication] delegate];
	label_max.text= [NSString stringWithFormat:@"$ %.0f", (1000 * slider_max.value)];
	appDelegate.precioH= [[NSString stringWithFormat:@"%.0f", (1000 * slider_max.value)]intValue];
	
	
	
}

-(IBAction) clickcont:(id)aob
{
	[self.navigationController popViewControllerAnimated:YES];
}


/*
 IBOutlet UILabel *label_min;
 IBOutlet UILabel *label_max;

 */

@end
