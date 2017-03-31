//
//  ScanViewController.m
//  ScanditSDK
//
//  Created by Pham Duc Giam on 12/6/16.
//  Copyright © 2016 maGicuD. All rights reserved.
//

#import "ScanViewController.h"
#import <ScanditBarcodeScanner/ScanditBarcodeScanner.h>

@interface ScanViewController () <SBSScanDelegate>
{
	SBSBarcodePickerView *_barcodePickerView;
	BOOL _stopped;
}

@end

@implementation ScanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	
	self.view.backgroundColor = [UIColor clearColor];
	_stopped = NO;
	
	[self configureBarcodePickerView];
	
	[_barcodePickerView startScanning];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated
{
	[super viewDidAppear:animated];
	
	[_barcodePickerView resumeScanning];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
	
	[_barcodePickerView pauseScanning];
}

#pragma mark - private methods

- (void)configureBarcodePickerView
{
	_barcodePickerView
	= [[SBSBarcodePickerView alloc] initWithFrame:self.view.bounds];
	_barcodePickerView.scanDelegate = self;
	_barcodePickerView.startOnLoad = YES;
	[self setupBarcodePickerView];
	_barcodePickerView.translatesAutoresizingMaskIntoConstraints = NO;
	[self.view insertSubview:_barcodePickerView
					 atIndex:0];
	[self.view addConstraint:[NSLayoutConstraint constraintWithItem:_barcodePickerView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.topLayoutGuide attribute:NSLayoutAttributeBottom multiplier:1.0f constant:0]];
	[self.view addConstraint:[NSLayoutConstraint constraintWithItem:_barcodePickerView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.bottomLayoutGuide attribute:NSLayoutAttributeTop multiplier:1.0f constant:0]];
	[self.view addConstraint:[NSLayoutConstraint constraintWithItem:_barcodePickerView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0f constant:0]];
	[self.view addConstraint:[NSLayoutConstraint constraintWithItem:_barcodePickerView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0f constant:0]];
}

- (void)setupBarcodePickerView
{
	if (_options[@"startOnLoad"]) {
		BOOL startOnLoad = [_options[@"startOnLoad"] boolValue];
		_barcodePickerView.startOnLoad = startOnLoad;
	}
	
	NSArray *symbologies = _options[@"symbologies"];
	if (symbologies
		&& [symbologies isKindOfClass:[NSArray class]]) {
		for (NSString *symbology in symbologies) {
			if (![symbology isKindOfClass:[NSString class]]) {
				return;
			}
			
			if ([symbology caseInsensitiveCompare:@"EAN13"] == NSOrderedSame) {
				_barcodePickerView.EAN13 = YES;
			}
			if ([symbology caseInsensitiveCompare:@"UPC12"] == NSOrderedSame) {
				_barcodePickerView.UPC12 = YES;
			}
			if ([symbology caseInsensitiveCompare:@"UPCE"] == NSOrderedSame) {
				_barcodePickerView.UPCE = YES;
			}
			if ([symbology caseInsensitiveCompare:@"EAN8"] == NSOrderedSame) {
				_barcodePickerView.EAN8 = YES;
			}
			if ([symbology caseInsensitiveCompare:@"code39"] == NSOrderedSame) {
				_barcodePickerView.code39 = YES;
			}
			if ([symbology caseInsensitiveCompare:@"code93"] == NSOrderedSame) {
				_barcodePickerView.code93 = YES;
			}
			if ([symbology caseInsensitiveCompare:@"code128"] == NSOrderedSame) {
				_barcodePickerView.code128 = YES;
			}
			if ([symbology caseInsensitiveCompare:@"PDF417"] == NSOrderedSame) {
				_barcodePickerView.PDF417 = YES;
			}
			if ([symbology caseInsensitiveCompare:@"datamatrix"] == NSOrderedSame) {
				_barcodePickerView.datamatrix = YES;
			}
			if ([symbology caseInsensitiveCompare:@"QR"] == NSOrderedSame) {
				_barcodePickerView.QR = YES;
			}
			if ([symbology caseInsensitiveCompare:@"ITF"] == NSOrderedSame) {
				_barcodePickerView.ITF = YES;
			}
			if ([symbology caseInsensitiveCompare:@"MSIPlessey"] == NSOrderedSame) {
				_barcodePickerView.MSIPlessey = YES;
			}
			if ([symbology caseInsensitiveCompare:@"GS1Databar"] == NSOrderedSame) {
				_barcodePickerView.GS1Databar = YES;
			}
			if ([symbology caseInsensitiveCompare:@"GS1DatabarExpanded"] == NSOrderedSame) {
				_barcodePickerView.GS1DatabarExpanded = YES;
			}
			if ([symbology caseInsensitiveCompare:@"codabar"] == NSOrderedSame) {
				_barcodePickerView.codabar = YES;
			}
			if ([symbology caseInsensitiveCompare:@"aztec"] == NSOrderedSame) {
				_barcodePickerView.aztec = YES;
			}
			if ([symbology caseInsensitiveCompare:@"twoDigitAddOn"] == NSOrderedSame) {
				_barcodePickerView.twoDigitAddOn = YES;
			}
			if ([symbology caseInsensitiveCompare:@"code11"] == NSOrderedSame) {
				_barcodePickerView.code11 = YES;
			}
			if ([symbology caseInsensitiveCompare:@"maxiCode"] == NSOrderedSame) {
				_barcodePickerView.maxiCode = YES;
			}
			if ([symbology caseInsensitiveCompare:@"microPDF417"] == NSOrderedSame) {
				_barcodePickerView.microPDF417 = YES;
			}
			if ([symbology caseInsensitiveCompare:@"code25"] == NSOrderedSame) {
				_barcodePickerView.code25 = YES;
			}
		}
	}
	
	if (_options[@"beep"]) {
		BOOL beep = [_options[@"beep"] boolValue];
		_barcodePickerView.uiBeep = beep;
	}
	if (_options[@"vibrate"]) {
		BOOL vibrate = [_options[@"vibrate"] boolValue];
		_barcodePickerView.uiVibrate = vibrate;
	}
	if (_options[@"torchButton"]) {
		BOOL torchButton = [_options[@"torchButton"] boolValue];
		_barcodePickerView.uiTorchButton = torchButton;
	}
	if (_options[@"cameraButton"]) {
		BOOL cameraButton = [_options[@"cameraButton"] boolValue];
		_barcodePickerView.uiCameraButton = cameraButton;
	}
	if (_options[@"frontCamera"]) {
		BOOL frontCamera = [_options[@"frontCamera"] boolValue];
		_barcodePickerView.frontCamera = frontCamera;
	}
}

/*- (void)configureCancelButton
{
	if (_cancelButton) {
		return;
	}
	
	UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
	[button setTitle:@"Cancel"
			forState:UIControlStateNormal];
	[button setTitleColor:[UIColor whiteColor]
				 forState:UIControlStateNormal];
	[button sizeToFit];
	[button addTarget:self
			   action:@selector(cancelClicked:)
	 forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:button];
	
	_cancelButton = button;
}*/

- (void)stopScanning
{
	if (_stopped) {
		return;
	}
	
	_stopped = YES;
	[_barcodePickerView stopScanning];
}

#pragma mark - actions

- (IBAction)cancelClicked:(UIButton *)sender
{
	[self stopScanning];
	if (self.completion) {
		self.completion(nil);
	}
}

#pragma mark - SBSScanDelegate

- (void)barcodePicker:(SBSBarcodePicker*)picker
			  didScan:(SBSScanSession*)session
{
	if (_stopped
		|| !session
		|| !session.newlyRecognizedCodes.count) {
		return;
	}
	
	[self stopScanning];
	
	SBSCode *code = session.newlyRecognizedCodes[0];
	if (self.completion) {
		self.completion(code.data);
	}
}

@end
