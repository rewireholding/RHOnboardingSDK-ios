//
//  ViewController.h
//  SampleAppObjc
//
//  Created by Jesús León Canca on 30/11/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *inputApplicantID;
@property (weak, nonatomic) IBOutlet UITextField *inputFirstName;
@property (weak, nonatomic) IBOutlet UITextField *inputLastName;
@property (weak, nonatomic) IBOutlet UITextField *inputDateOfBirth;
@property (weak, nonatomic) IBOutlet UITextField *inputJourney;
@end

NS_ASSUME_NONNULL_END
