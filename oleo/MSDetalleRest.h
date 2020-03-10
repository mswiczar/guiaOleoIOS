//
//  MSDetalleRest.h
//  oleo
//
//  Created by Moises Swiczar on 5/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PinMapController.h"
#import "ImageDetail.h"
#import "FaceBook.h"
#import "MSLogin.h"
#import "MSListVotos.h"
#import "MSVotacion1.h"
#import "AppendContact.h"

#import "RobtwitterViewController.h"
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>

@interface MSDetalleRest : UIViewController<MFMailComposeViewControllerDelegate,UIActionSheetDelegate> {
	UIActionSheet *theactionSheetContact;
	NSMutableDictionary * theobj;
	NSMutableDictionary * thebanner;
	
	IBOutlet UILabel *label_desc;
	IBOutlet UITableView * thetable;
	PinMapController * amap;
	NSMutableArray * thearrayunico;
	NSMutableArray * thearrayImages;
	IBOutlet UIView *footerView;
		IBOutlet UIImageView * viewad;
		IBOutlet UILabel * lablel_acciones;
		IBOutlet UIActivityIndicatorView * activity_ad;
	
	
	
	IBOutlet UIView * topView;
		IBOutlet UILabel * label_name;
		IBOutlet UILabel * label_cocina;
		IBOutlet UILabel * label_horarios;
		IBOutlet UILabel * label_rate_cocina;
		IBOutlet UILabel * label_rate_servicio;
		IBOutlet UILabel * label_rate_ambiente;
		IBOutlet UILabel * label_precio_dia;
		IBOutlet UILabel * label_precio_noche;
		IBOutlet UILabel * label_votos;

		IBOutlet UILabel * label_vinos;
		IBOutlet UILabel * label_cantcomentarios;
	
	IBOutlet UIView *viewMapaLLamar;
		IBOutlet UILabel *label_street_1;
		IBOutlet UILabel *label_street_2;
		IBOutlet UILabel *label_tel;
		IBOutlet UILabel *lable_title2;
	
	
	IBOutlet UIView *view_caract;
	IBOutlet UILabel *lable_title3;
	IBOutlet UILabel *lable_title31;

	
	IBOutlet UIView *view_noPreload;
	
	IBOutlet UIView *view_images;
	IBOutlet UILabel *lable_title4;

	IBOutlet UIImageView * viewPhoto1;
	IBOutlet UIImageView * viewPhoto2;
	IBOutlet UIImageView * viewPhoto3;
	IBOutlet UIImageView * viewPhoto4;
	
	
	IBOutlet UILabel *lable_title5;
	IBOutlet UILabel * lable_title51;
	
	ImageDetail* thefotos;
	FaceBook* thefacebook;
	MSLogin* thelogin;
	MSListVotos * thelistvotos;
	RobtwitterViewController * thetwitter;
	MSVotacion1 *thevotacion;
	AppendContact* theaddressbook;
	
	UIActivityIndicatorView *progressInd;
	UIAlertView             *backAlert;
	NSTimer	                *atimergetdata;
	BOOL fueradememoria;
	NSString * theid;
	BOOL showbanner;
	BOOL showVotos;
	UIActionSheet*	theactionSheet;
	
	NSString * stringtel1;
	NSString * stringtel2;
	
	
	IBOutlet UIImageView * theviewver;
	BOOL enviar;
}
@property (nonatomic,copy) NSString * theid;

@property (nonatomic,copy) NSString * stringtel1;
@property (nonatomic,copy) NSString * stringtel2;


-(void) show;

-(IBAction) clickVotar:(id)aob;
-(IBAction) clickEnviar:(id)aob;
-(IBAction) clickFacebook:(id)aob;
-(IBAction) clickTwitter:(id)aob;

-(IBAction) clickBanner:(id)aob;


-(IBAction) clickComentarios:(id)aob;


-(IBAction) clickMapa:(id)aob;
-(IBAction) clickCall:(id)aob;


-(IBAction) clickFotos:(id)aobj;

-(IBAction) clickAgregaContactos:(id)aobj;


@end
