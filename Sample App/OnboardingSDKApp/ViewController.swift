//
//  ViewController.swift
//  OnboardingSDKApp
//
//  Created by Jesús León Canca on 16/11/23.
//

import UIKit
import RHOnboardingSDK

class ViewController: UIViewController, RHOnboardingDelegate {
    
   
  
    

    @IBOutlet weak var inputApplicantID: UITextField!
    @IBOutlet weak var inputFirstName: UITextField!
    @IBOutlet weak var inputLastName: UITextField!
    @IBOutlet weak var inputDateOfBirth: UITextField!
    @IBOutlet weak var inputJourney: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
  
    @IBAction func tapStartWithApplicant(_ sender: Any) {
        if let applicantID = inputApplicantID.text, !applicantID.isEmpty {
            Task {
                do{
                    RHOnboarding.shared.delegate = self
                    try await RHOnboarding.shared.initOnboardingFlow(self,applicantID)
                    
                } catch is OnboardingError {
                    
                }

            }
        }else{
            let alert = UIAlertController(title: "ApplicantID", message: "ApplicantID is mandatory", preferredStyle: .alert)
            let ok = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(ok)
            present(alert, animated: true)
        }
    }
    @IBAction func tapStart(_ sender: Any) {
        if let firstName = inputFirstName.text, !firstName.isEmpty, let lastName = inputLastName.text, !lastName.isEmpty, let dateOfBirth = inputDateOfBirth.text, !dateOfBirth.isEmpty, let journey = inputJourney.text, !journey.isEmpty {
            Task {
                do{
                    RHOnboarding.shared.delegate = self
                    try await RHOnboarding.shared.initOnboardingFlow(self, firstName: firstName, lastName: lastName, journey: journey, dateOfBirth: dateOfBirth)
                    
                } catch is OnboardingError {
                    
                }

            }
        }else{
            let alert = UIAlertController(title: "Inputs", message: "All inputs are mandatory", preferredStyle: .alert)
            let ok = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(ok)
            present(alert, animated: true)
        }
    }
    func resultOK() {
        let alert = UIAlertController(title: "Onboarding", message: "Onboarding Finished OK", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(ok)
        present(alert, animated: true)
    }
    
    func resultKO(sdkError: RHOnboardingSDK.RHOnboardingError) {
        print("ERROR: \(sdkError)")
    }
    
    func generateApplicant(applicantID: String) {
        print(applicantID)
    }
}

