//
//  ViewController.m
//  SampleAppObjc
//
//  Created by Jesús León Canca on 30/11/23.
//

#import "ViewController.h"
#import "RHOnboardingSDK/RHOnboardingSDK-Swift.h"
@interface ViewController ()<RHOnboardingDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [RHOnboarding shared].delegate = self;
   
}
- (IBAction)tapStartWithApplicant:(id)sender {
    if (self.inputApplicantID.text != nil){
        [[RHOnboarding shared] initOnboardingFlow:self :self.inputApplicantID.text completionHandler:^(NSError * _Nullable) {
            
        }];
    } else{
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"ApplicantID" message:@"ApplicantID is mandatory" preferredStyle:alert];
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [alert addAction:ok];
        [self presentViewController:alert animated:true completion:^{
            
        }];
    }
}
- (IBAction)tapStart:(id)sender {
    if (self.inputFirstName.text != nil && self.inputLastName.text != nil  && self.inputDateOfBirth.text != nil  && self.inputJourney.text != nil  ){
        
        [[RHOnboarding shared] initOnboardingFlow:self firstName:self.inputFirstName.text lastName:self.inputLastName.text journey:self.inputJourney.text dateOfBirth:self.inputDateOfBirth.text completionHandler:^(NSError * _Nullable) {
            
        }];
    } else{
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Inputs" message:@"All inputs are mandatory" preferredStyle:alert];
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [alert addAction:ok];
        [self presentViewController:alert animated:true completion:^{
            
        }];
    }
}


- (void)generateApplicantWithApplicantID:(NSString * _Nonnull)applicantID {
    NSLog(@"ApplicantID %@",applicantID);
}

- (void)resultKOWithSdkError:(RHOnboardingError * _Nonnull)sdkError {
    NSLog(@"SDK Error %@", sdkError.userInfo);
}

- (void)resultOK {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Onboarding" message:@"Onboarding Finished OK" preferredStyle:alert];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alert addAction:ok];
    [self presentViewController:alert animated:true completion:^{
        
    }];
}



@end
