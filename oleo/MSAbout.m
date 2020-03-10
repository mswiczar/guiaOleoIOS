//
//  MSAbout.m
//  oleo
//
//  Created by Moises Swiczar on 6/17/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "MSAbout.h"


@implementation MSAbout

 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	label_first.font = [UIFont fontWithName:@"Arial-BoldMT" size:13];
	label_first.textColor = [UIColor colorWithRed:0.85 green:0.97 blue:0.62 alpha:0.99];

	label_first1.font = [UIFont fontWithName:@"Arial-BoldMT" size:13];
	label_first1.textColor = [UIColor colorWithRed:0.85 green:0.97 blue:0.62 alpha:0.99];

	label_first2.font = [UIFont fontWithName:@"Arial-BoldMT" size:13];
	label_first2.textColor = [UIColor colorWithRed:0.85 green:0.97 blue:0.62 alpha:0.99];

	label_first3.font = [UIFont fontWithName:@"Arial-BoldMT" size:13];
	label_first3.textColor = [UIColor colorWithRed:0.85 green:0.97 blue:0.62 alpha:0.99];
	
	//self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"BGFIRST.png"]];
	/*
	
	
	label_second.textColor = [UIColor colorWithRed:0.85 green:0.97 blue:0.62 alpha:0.99];
	label_second.font = [UIFont fontWithName:@"Arial-BoldMT" size:15];
	
	
	label_buton1.font = [UIFont fontWithName:@"Arial-BoldMT" size:15];
	label_buton2.font = [UIFont fontWithName:@"Arial-BoldMT" size:15];
	label_buton3.font = [UIFont fontWithName:@"Arial-BoldMT" size:15];
	label_buton4.font = [UIFont fontWithName:@"Arial-BoldMT" size:15];
	
	
	label_buton1.textColor = [UIColor colorWithRed:0.4 green:0.4 blue:0.4 alpha:0.99];
	label_buton2.textColor = [UIColor colorWithRed:0.4 green:0.4 blue:0.4 alpha:0.99];
	label_buton3.textColor = [UIColor colorWithRed:0.4 green:0.4 blue:0.4 alpha:0.99];
	label_buton4.textColor = [UIColor colorWithRed:0.4 green:0.4 blue:0.4 alpha:0.99];
	 */
	
	
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

-(IBAction) clickcont:(id)aobj
{
	[self dismissModalViewControllerAnimated:YES];
}

@end
