//
//  UContact.m
//  AMRO
//
//  Created by Moises Swiczar on 8/17/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "UContact.h"


@implementation UContact



+(void) gettel:(NSString *) thetel1  thetelaux:(NSString**) thetelaux
{

	NSMutableString *aux = [[NSMutableString alloc] initWithString:[thetel1 uppercaseString]];
	
	[aux replaceOccurrencesOfString:@"A" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [aux  length])];
	[aux replaceOccurrencesOfString:@"B" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [aux  length])];
	[aux replaceOccurrencesOfString:@"C" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [aux  length])];
	[aux replaceOccurrencesOfString:@"D" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [aux  length])];
	[aux replaceOccurrencesOfString:@"E" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [aux  length])];
	[aux replaceOccurrencesOfString:@"F" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [aux  length])];
	[aux replaceOccurrencesOfString:@"G" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [aux  length])];
	[aux replaceOccurrencesOfString:@"H" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [aux  length])];
	[aux replaceOccurrencesOfString:@"I" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [aux  length])];
	[aux replaceOccurrencesOfString:@"J" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [aux  length])];
	[aux replaceOccurrencesOfString:@"K" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [aux  length])];
	[aux replaceOccurrencesOfString:@"L" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [aux  length])];
	[aux replaceOccurrencesOfString:@"M" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [aux  length])];
	[aux replaceOccurrencesOfString:@"N" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [aux  length])];
	[aux replaceOccurrencesOfString:@"O" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [aux  length])];
	[aux replaceOccurrencesOfString:@"P" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [aux  length])];
	[aux replaceOccurrencesOfString:@"Q" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [aux  length])];
	[aux replaceOccurrencesOfString:@"R" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [aux  length])];
	[aux replaceOccurrencesOfString:@"S" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [aux  length])];
	[aux replaceOccurrencesOfString:@"T" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [aux  length])];
	[aux replaceOccurrencesOfString:@"U" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [aux  length])];
	[aux replaceOccurrencesOfString:@"V" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [aux  length])];
	[aux replaceOccurrencesOfString:@"W" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [aux  length])];
	[aux replaceOccurrencesOfString:@"X" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [aux  length])];
	[aux replaceOccurrencesOfString:@"Y" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [aux  length])];
	[aux replaceOccurrencesOfString:@"Z" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [aux  length])];
	
	
	
	
	[aux replaceOccurrencesOfString:@"(" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [aux  length])];
	[aux replaceOccurrencesOfString:@")" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [aux  length])];
	[aux replaceOccurrencesOfString:@"-" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [aux length])];
	
	
	NSRange therange = [aux rangeOfString:@"/"];
	if (therange.length==0)
	{
		[aux replaceOccurrencesOfString:@" " withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [aux length])];
		if ([aux length]>8)
		{
			if ([[aux substringToIndex:2]isEqualToString:@"08"])
			{
				NSString* stringtel1 =[NSString stringWithFormat: @"%@",[NSString stringWithFormat: @"%@",aux]];
				*thetelaux = [NSString stringWithFormat: @"%@",stringtel1];
			}
			else 
			{
				*thetelaux = [NSString stringWithFormat: @"%@",[aux substringToIndex:8]];
			}
		}
		else 
		{
			*thetelaux = [NSString stringWithFormat: @"%@",aux];
		}
		
		
	}
	else 
	{
		[aux replaceOccurrencesOfString:@" " withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [aux length])];
		[aux replaceOccurrencesOfString:@"/" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [aux length])];
		*thetelaux = [NSString stringWithFormat: @"%@",[aux substringToIndex:8]];
	}
	[aux release];
}





+(BOOL) AppendContact:(ABRecordRef)persona thebook:(ABAddressBookRef)thebook theobj:(NSMutableDictionary*)theobj

{
	
	NSString *stringtoinsert =@"";
	NSString * stringdb = [theobj objectForKey:@"TEL1"];
	[UContact  gettel:stringdb  thetelaux:&stringtoinsert];
	
	ABMutableMultiValueRef myMultiValueRef = ABRecordCopyValue(persona, kABPersonPhoneProperty);	
	ABMutableMultiValueRef the = ABMultiValueCreateMutableCopy(myMultiValueRef);
    BOOL foundphone=NO;
	
	int i;
	for (i=0; i < ABMultiValueGetCount(myMultiValueRef); ++i)
	{
		NSString *label = (NSString*)ABMultiValueCopyLabelAtIndex(the, i);
		if ( [label compare:@"Tel (Oleo)"] == NSOrderedSame )
		{
			foundphone=YES;
			ABMultiValueReplaceValueAtIndex(the, stringtoinsert, i);
			ABRecordSetValue(persona, kABPersonPhoneProperty, the, nil);
			break;
		}
	}
	if (foundphone==NO)
	{
		NSString * atel = [NSString stringWithFormat:@"%@",stringtoinsert];
		NSString * alabel = [NSString stringWithFormat:@"Tel (Oleo)"];
		ABMultiValueAddValueAndLabel(the, atel, (CFStringRef)alabel, NULL);
		ABRecordSetValue(persona, kABPersonPhoneProperty, the, nil);
	}
	
	
	
	ABMutableMultiValueRef myMultiValueRef2 = ABRecordCopyValue(persona, kABPersonAddressProperty);	
	ABMutableMultiValueRef the2 = ABMultiValueCreateMutableCopy(myMultiValueRef2);
	foundphone=NO;
	
	for (i=0; i < ABMultiValueGetCount(myMultiValueRef2); ++i)
	{
		NSString *label = (NSString*)ABMultiValueCopyLabelAtIndex(the2, i);
		if ( [label compare:@"Dir (Oleo)"] ==  NSOrderedSame )
		{
			foundphone=YES;
			
			NSMutableDictionary *addressDictionary = [[NSMutableDictionary alloc] init];
			[addressDictionary setObject:[NSString stringWithFormat:@"%@ %@", [theobj objectForKey:@"DIRECCION1"],[theobj objectForKey:@"DIRECCION2"] ] forKey:(NSString *) kABPersonAddressStreetKey];
			ABMultiValueReplaceValueAtIndex(the2, addressDictionary, i);
			ABRecordSetValue(persona, kABPersonAddressProperty, the2, nil);
			break;
		}
	}
	if (foundphone==NO)
	{
		NSMutableDictionary *addressDictionary = [[NSMutableDictionary alloc] init];
		[addressDictionary setObject:[NSString stringWithFormat:@"%@", [theobj objectForKey:@"DIRECCION1"]] forKey:(NSString *) kABPersonAddressStreetKey];
		[addressDictionary setObject:[NSString stringWithFormat:@"%@", [theobj objectForKey:@"DIRECCION2"]] forKey:(NSString *) kABPersonAddressCityKey];

		[addressDictionary setObject:[NSString stringWithFormat:@"%@",@"ar" ] forKey:(NSString *) kABPersonAddressCountryCodeKey];
		[addressDictionary setObject:[NSString stringWithFormat:@"%@",@"Argentina" ] forKey:(NSString *) kABPersonAddressCountryKey];

		
		
		NSString * alabel = [NSString stringWithFormat:@"Dir (Oleo)"];
		ABMultiValueAddValueAndLabel(the2, addressDictionary, (CFStringRef)alabel, NULL);
		ABRecordSetValue(persona, kABPersonAddressProperty, the2, nil);
	}
	
	
	
	
	ABAddressBookSave(thebook, nil);
	
	
	
	UIAlertView *aview= [[UIAlertView alloc] initWithTitle:@"Guía Oleo" message:@"Contacto agregado." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
	[aview show];
	[aview release];
	return YES;
	
}






+(BOOL) AddContact:(NSMutableDictionary*)theobj
{
	
	
	ABAddressBookRef m_addressbook = ABAddressBookCreate();
    if (!m_addressbook) {
        NSLog(@"opening address book");
    }
	
	NSString *stringtoinsert =@"";
	NSString * stringdb = [theobj objectForKey:@"TEL1"];
	[UContact  gettel:stringdb  thetelaux:&stringtoinsert];
	
	
	// can be cast to NSArray, toll-free
	CFArrayRef allPeople = ABAddressBookCopyArrayOfAllPeople(m_addressbook);
	CFIndex nPeople = ABAddressBookGetPersonCount(m_addressbook);
	
	// CFStrings can be cast to NSString!
	
	for (int i=0;i < nPeople;i++) 
	{ 
		ABRecordRef ref = CFArrayGetValueAtIndex(allPeople,i);
		
		CFStringRef firstName = ABRecordCopyValue(ref, kABPersonOrganizationProperty);
		if (firstName != NULL)
		{
			NSString *contactFirstLast = [NSString stringWithFormat:@"%@",firstName];
			if ( [contactFirstLast isEqualToString:[theobj objectForKey:@"NOMBRE"]])
			{
				
				CFRelease(firstName);
				UIAlertView *aview= [[UIAlertView alloc] initWithTitle:@"Guía Oleo" message:@"Este contacto existe en la lista de contactos." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
				[aview show];
				[aview release];				
				return NO;
			}
			CFRelease(firstName);
		}
	}
	
	ABRecordRef persona = ABPersonCreate();
	ABRecordSetValue(persona, kABPersonOrganizationProperty, [theobj objectForKey:@"NOMBRE"], nil);
	ABMutableMultiValueRef multi = ABMultiValueCreateMutable(kABMultiDictionaryPropertyType);
	NSMutableDictionary *addressDictionary = [[NSMutableDictionary alloc] init];
	
	[addressDictionary setObject:[NSString stringWithFormat:@"%@", [theobj objectForKey:@"DIRECCION1"]] forKey:(NSString *) kABPersonAddressStreetKey];
	[addressDictionary setObject:[NSString stringWithFormat:@"%@", [theobj objectForKey:@"DIRECCION2"]] forKey:(NSString *) kABPersonAddressCityKey];
	
	[addressDictionary setObject:[NSString stringWithFormat:@"%@",@"ar" ] forKey:(NSString *) kABPersonAddressCountryCodeKey];
	[addressDictionary setObject:[NSString stringWithFormat:@"%@",@"Argentina" ] forKey:(NSString *) kABPersonAddressCountryKey];
	
	
	

	ABMultiValueAddValueAndLabel(multi, addressDictionary, kABWorkLabel, NULL);
	
	
	ABMutableMultiValueRef multi2 = ABMultiValueCreateMutable(kABMultiStringPropertyType);
	ABMultiValueAddValueAndLabel(multi2, stringtoinsert, kABPersonPhoneMainLabel, NULL);
	
	
	
	if(!ABRecordSetValue(persona, kABPersonAddressProperty, multi, nil))
		NSLog(@"setting value didn't work.");
	
	if(!ABRecordSetValue(persona, kABPersonPhoneProperty, multi2, nil))
		NSLog(@"setting value didn't work.");
	
	
	ABAddressBookAddRecord(m_addressbook, persona, nil);
	ABAddressBookSave(m_addressbook, nil);
	
	CFRelease(persona);	
	
	UIAlertView *aview= [[UIAlertView alloc] initWithTitle:@"Guía Oleo" message:@"Contacto agregado." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
	[aview show];
	[aview release];
	
	// now adding the company.
	return YES;
	
	
}

@end
