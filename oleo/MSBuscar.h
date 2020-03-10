//
//  MSBuscar.h
//  oleo
//
//  Created by Moises Swiczar on 5/5/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MSPrecio.h"
#import "MSZonas.h"
#import "MSCocinas.h"
#import "MSCaracteristicas.h"
#import "MSAbout.h"
#import "MSResultSearch.h"

@interface MSBuscar : UIViewController {

	IBOutlet UILabel * label_first;
	IBOutlet UILabel * label_second;
	IBOutlet UITextField * text_busqueda;

	
	
	IBOutlet UILabel* label_buton1;
	IBOutlet UILabel* label_buton2;
	IBOutlet UILabel* label_buton3;
	IBOutlet UILabel* label_buton4;
	
	
	
	IBOutlet UIButton *buton_precio;
	IBOutlet UIButton *buton_zona;
	IBOutlet UIButton *buton_cocina;
	IBOutlet UIButton *buton_caracteristicas;

	IBOutlet UIButton *buton_buscar;
	
	
	
	IBOutlet UILabel *label_precio;
	IBOutlet UILabel *label_zona;
	IBOutlet UILabel *label_cocina;
	IBOutlet UILabel *label_caracteristicas;
	
	
	MSPrecio * theprecioVC;
	MSResultSearch *theresult;
	MSZonas *theZonas;
	MSCocinas *theCocinas;
	MSCaracteristicas *theCaracteristicas;
	MSAbout* theabout;
	
	
	
}


-(IBAction) clickInfo:(id)aobj;

-(IBAction) clickPrecio:(id)aobj;
-(IBAction) clickZona:(id)aobj;
-(IBAction) clickCocina:(id)aobj;
-(IBAction) clickCaracteristicas:(id)aobj;
-(IBAction) clickBuscar:(id)aobj;


@end
