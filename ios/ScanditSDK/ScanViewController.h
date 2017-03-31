//
//  ScanViewController.h
//  ScanditSDK
//
//  Created by Pham Duc Giam on 12/6/16.
//  Copyright © 2016 maGicuD. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ScanCompletion)(NSString *result);

@interface ScanViewController : UIViewController

@property (nonatomic, weak) IBOutlet UIButton *cancelButton;

@property (nonatomic, strong) NSDictionary *options;
@property (nonatomic, copy) ScanCompletion completion;

- (IBAction)cancelClicked:(UIButton *)sender;

@end
