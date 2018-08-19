/* How to Hook with Logos
Hooks are written with syntax similar to that of an Objective-C @implementation.
You don't need to #include <substrate.h>, it will be done automatically, as will
the generation of a class list and an automatic constructor.

%hook ClassName

// Hooking a class method
+ (id)sharedInstance {
	return %orig;
}

// Hooking an instance method with an argument.
- (void)messageName:(int)argument {
	%log; // Write a message about this call, including its class, name and arguments, to the system log.

	%orig; // Call through to the original function with its original arguments.
	%orig(nil); // Call through to the original function with a custom argument.

	// If you use %orig(), you MUST supply all arguments (except for self and _cmd, the automatically generated ones.)
}

// Hooking an instance method with no arguments.
- (id)noArguments {
	%log;
	id awesome = %orig;
	[awesome doSomethingElse];

	return awesome;
}

// Always make sure you clean up after yourself; Not doing so could have grave consequences!
%end
*/

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "hex.h"


%hook OpenSSLECDHWrapper



- (int)geneECDHShareKey:(char *)out 
andSvrPubKey:(char *)pubkey 
andSvrPubKeyLen:(unsigned int)pubkeyLen 
andCliPrivKey:(const char *)prikey 
andCliPrivKeyLen:(int)prikeyLen
{

	int r= %orig;


	NSLog(@"iosqqhook:geneECDHShareKey pubkey=%@ pubkeyLen=%u prikey=%@ prikeyLen=%u out=%@",
	[NSString hexStringWithData:(unsigned char*)pubkey ofLength:(int)pubkeyLen],
	pubkeyLen,
	[NSString hexStringWithData:(unsigned char*)prikey ofLength:prikeyLen],
	prikeyLen,
	[NSString hexStringWithData:(unsigned char*)out ofLength:16]
	
	);



	return r;
}


%end
