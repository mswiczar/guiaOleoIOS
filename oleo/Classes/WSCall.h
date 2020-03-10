//
//  WSCall.h
//  Detelefoongids
//
//  Created by Moises Swiczar on 4/7/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


#define USERSERVICE @"iphoneUser"

#define URLSERVICE   @"http://www.guiaoleo.com.ar/interface/json/services.phtml"
#define	PASSSERVICE @"(sohcahtoa180)"


//#define URLSERVICE   @"http://developguiaoleo-ar.macacohosting.com/interface/json/services.phtml"
//#define	PASSSERVICE @"135246"


#define	UDID [[UIDevice currentDevice] uniqueIdentifier] 



@interface WSCall : NSObject {

}


//+(BOOL) callGetHotspotDetail:(NSString*)theidhotspot thearray:(NSMutableArray*)thearray;


+(BOOL) callBanner:(NSMutableDictionary*)abanner;
+(BOOL) initSession:(NSMutableDictionary*)thedict;
+(NSUInteger) callRegistrarUser:(NSMutableDictionary*)thedict;
+(BOOL) callGetCercanos:(NSMutableDictionary*)thedict thearray:(NSMutableArray*)thearray;
+(BOOL) callGetRest:(NSString*)theid thedict:(NSMutableDictionary*)thedict;
+(BOOL) callGetRankings:(NSMutableDictionary*)thedict thearray:(NSMutableArray*)thearray;
+(BOOL) callGetDescuentos:(NSMutableDictionary*)thedict thearray:(NSMutableArray*)thearray;
+(BOOL) callGetComentarios:(NSString*)theid thearray:(NSMutableArray*)thearray;
+(NSUInteger) callRegistrarVoto:(NSMutableDictionary*)thedict;
+(BOOL) callGetSearch:(NSMutableDictionary*)thedict thearray:(NSMutableArray*)thearray;
+(BOOL) callGetSearchSTR:(NSMutableDictionary*)thedict thearray:(NSMutableArray*)thearray;



//online version only called when we are on WIFI never on 3G or GPRS or phone
// all this result are dumped to file

+(BOOL) callGetZona:(NSMutableArray*)thearray;
+(BOOL) callGetCocina:(NSMutableArray*)thearray;
+(BOOL) callGetCaract:(NSMutableArray*)thearray;

//offline version only called when we are  on 3G or GPRS or phone
//those result are from previous dumped version onlie data or by release resource distribution


+(BOOL) callGetCocinaOFFline:(NSMutableArray*)thearray;
+(BOOL) callGetCaractOFFline:(NSMutableArray*)thearray;
+(BOOL) callGetZonaOFFline:(NSMutableArray*)thearray;






/*
 Devolución de una búsqueda por medio de filtros avanzados.
 Llamada (parámetros por POST o GET):
 http://developguiaoleo-ar.macacohosting.com/interface/json/services.phtml?usuario=iphoneUser&clave=135246&mensaje=0013&precios=1&caracteristicas=2&cocinas=3&zonas=2&inicio=1&numero=5
 
 Con esto podes armar la búsqueda de restaurantes más cercanos.
 Parámetros de solicitud:
 <usuario>: Usuario de la aplicación
 <clave>: Clave de acceso a la aplicación
 <mensaje>: 0013
 <inicio de resultados>: inicio de la devolución de resultados
 <cantidad de resultados>: cantidad de resultados a devolver
 <precios>: (opcional) identificador de rango de precios separados por comas
 <caracteristicas>: (opcional) identificador/es separados por comas
 <cocinas>: (opcional) identificador/es de los tipos de cocina, separados por comas
 <zonas>:(opcional) identificador/es de las zonas, separados por comas
 <longitud del usuario>: Longitud en la que se encuentra el teléfono desde donde se conecta el usuario
 <latitud del usuario>: Longitud en la que se encuentra el teléfono desde donde se conecta el usuario
 
 La devolución es igual al mensaje 0002 – Búsqueda de Restaurantes por nombres.
 
 */



@end

