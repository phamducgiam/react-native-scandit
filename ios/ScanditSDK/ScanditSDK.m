//
//  ScanditSDK.m
//  ScanditSDK
//
//  Created by Pham Duc Giam on 12/5/16.
//  Copyright © 2016 maGicuD. All rights reserved.
//

#import "ScanditSDK.h"
#import "RCTLog.h"
#import <ScanditBarcodeScanner/ScanditBarcodeScanner.h>
#import "ScanViewController.h"

@implementation ScanditSDK

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(init:(NSString *)appKey)
{
	RCTLogInfo(@"init scandit with app key: %@", appKey);
	[SBSLicense setAppKey:appKey];
}

RCT_EXPORT_METHOD(scan:(NSDictionary *)options
				  callback:(RCTResponseSenderBlock)callback)
{
	dispatch_async(dispatch_get_main_queue(), ^{
		NSString *nibName = options[@"nib"];
		NSAssert(nibName, @"nib is not specified");
		ScanViewController *viewController
		= [[ScanViewController alloc] initWithNibName:nibName
											   bundle:nil];
		viewController.options = options;
		__weak ScanViewController *weakViewController = viewController;
		[viewController setCompletion:^(NSString *result){
			__strong ScanViewController *strongViewController = weakViewController;
			if (strongViewController) {
				[strongViewController dismissViewControllerAnimated:YES
									   completion:nil];
			}
			
			NSArray *array = result ? @[result] : @[[NSNull null]];
			callback(array);
		}];

		UIApplication *application = [UIApplication sharedApplication];
		UIViewController *rootViewController = application.keyWindow.rootViewController;
		[rootViewController presentViewController:viewController
										 animated:YES
									   completion:nil];
	});
}

@end
