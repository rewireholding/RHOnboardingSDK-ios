# RHOnboardingSDK-ios by Rewire Holding LTD
## Overview
Our RHOnboardingSDK is a specialized software development kit designed to streamline and enhance the onboarding process for mobile through efficient and user-friendly photo upload features. This SDK is tailored for apps where the primary onboarding requirement involves users uploading photographs, such as in identity verification, profile creation, or document submission scenarios.
## Download
#### Using Swift Package Manager

The SDK is available with Swift Package Manager and you can include it in your project by adding the following package
repository URL:

https://github.com/rewireholding/RHOnboardingSDK-ios.git

## Getting started
You will only need to create a instance of the **RHOnboarding** class. Which contains the following methods:
```Swift
func setAppLicense(user:String, pass:String, sandBoxMode: Bool)

//Use this method if you have already obtained the ApplicantID.     
func initOnboardingFlow(_ viewController:UIViewController,_ applicantID:String)
//Use this method to generate a new ApplicantID.     
func initOnboardingFlow(_ viewController:UIViewController, firstName:String, lastName: String, journey:String, dateOfBirth: String)

```
In your *initOnboardingFlow* you will need to implement the *RHOnboardingDelegate*. You will be notified of the SDK result by overriding the following methods in your delegate implementation:
```Swift
func resultOK()
//Return the ApplicantID when it's created in OnboardingFlow Method
func generateApplicant(applicantID: String)
func resultKO(sdkError: OnboardingError)
```


## How do I use RHOnboardingSDK?
### 1. Obtain credentials
In order to start integrating, you'll need credentials to connect the SDK. Contact with Rewire Holding Team

### 2. App permissions

The SDK uses the device camera. You're required to have the following keys in your application's `Info.plist` file:

* `NSCameraUsageDescription`

```xml
<key>NSCameraUsageDescription</key>
<string>Required for document and facial capture</string>
```

**Note**: All keys will be required for app submission.

### 4. Configure the credentials
In your AppDelegate configure the SDK credentials
#### Swift
```swift
import RHOnboardingSDK

RHOnboarding.shared.setAppLicense(user: <YOUR_USER>, pass: <YOUR_PASS>,sandBoxMode: true)
```
#### Objective-C
```objective-c
#import "RHOnboardingSDK/RHOnboardingSDK-Swift.h"

[[RHOnboarding shared] setAppLicenseWithUser:@"<YOUR_USER>" pass:@"<YOUR_PASS>" sandBoxMode:true];
```
### 5. Start the flow
#### Swift
```Swift
import RHOnboardingSDK
    //Configure the delegate methods
    RHOnboarding.shared.delegate = self
    
    //Start Flow with ApplicantID
    Task {
        do{
            try await RHOnboarding.shared.initOnboardingFlow(self,applicantID)
            } catch is OnboardingError {
                print("Error")
            }
        }
        
    //Start Flow requesting ApplicantID
    Task {
        do{
             RHOnboarding.shared.delegate = self
             try await RHOnboarding.shared.initOnboardingFlow(self, firstName: firstName, lastName: lastName, journey: journey, dateOfBirth: dateOfBirth)                    
        } catch is OnboardingError {
                    
        }
    }
    //Delegate Methods   
    func generateApplicant(applicantID: String) {}
    
    func resultOK() {}
    
    func resultKO(sdkError: RHOnboardingSDK.OnboardingError) {}           
```
#### Objective-C
```Objective-C
#import "RHOnboardingSDK/RHOnboardingSDK-Swift.h"
    //Configure the delegate methods
        //Start Flow with ApplicantID
        [RHOnboarding shared].delegate = self;
        
           [[RHOnboarding shared] initOnboardingFlow:self :@"<APPLICANT_ID>" completionHandler:^(NSError * _Nullable) {
            
        }];
        
        //Start Flow requesting ApplicantID
        [[RHOnboarding shared] initOnboardingFlow:self firstName:@"" lastName:@"" journey:@"" dateOfBirth:@"" completionHandler:^(NSError * _Nullable) {
            
        }];
        
    //Delegate Methods   
    - (void)generateApplicantWithApplicantID:(NSString * _Nonnull)applicantID {}
    
    - (void)resultOK {}
    
    - (void)resultKOWithSdkError:(RHOnboardingError * _Nonnull)sdkError {}           
```
## More Information

### Sample App

We have included sample apps to show how to integrate with the Rewire Holding's iOS SDK using  Swift and Objective C. See
the `SampleApp` directory for more information.

### Support

Should you encounter any technical issues during integration, please contact Rewire Holding's Customer Support team
via [email](mailto:support@rewireholding.com), including the word ISSUE: at the start of the subject line.


Copyright 2023 Rewire Holding, Ltd. All rights reserved.
