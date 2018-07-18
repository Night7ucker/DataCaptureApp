//
//  MoneyCompetitionViewController.swift
//  DataCaptureApp
//
//  Created by Evgeny Mahnach on 7/14/18.
//  Copyright © 2018 Evgeny Mahnach. All rights reserved.
//

import UIKit

class MoneyCompetitionViewController: UIViewController {
    
    // - UI
    
    @IBOutlet weak var firstNameTextField: TextField!
    @IBOutlet weak var lastNameTextField: TextField!
    @IBOutlet weak var mobileNumberTextField: UITextField!
    @IBOutlet weak var emailAddressTextField: UITextField!
    @IBOutlet weak var postCodeTextField: TextField!
    
    @IBOutlet weak var twitterTextField: SocialTextField!
    @IBOutlet weak var instagramTextField: SocialTextField!
    @IBOutlet weak var facebookTextField: SocialTextField!
    
    @IBOutlet weak var checkmarkButton: RadioButton!
    @IBOutlet weak var sendNowButton: UIButton!
    
    // - Manager / Service
    fileprivate var layoutService: MoneyCompetitionLayoutService!
    
    // - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        layoutService.viewWillAppear(animated: animated)
    }
    
    // - Action
    
    @IBAction func enterButtonAction(_ sender: UIButton) {
        layoutService.enterButtonAction()
    }
    
    @IBAction func checkmarkButtonAction(_ sender: RadioButton) {
        sender.isChecked = !sender.isChecked
        sender.isChecked ? sender.setImage(#imageLiteral(resourceName: "checkmark_checked"), for: .normal) : sender.setImage(#imageLiteral(resourceName: "checkmark_unchecked"), for: .normal)
    }
    
    @IBAction func homeButtonAction(_ sender: UIButton) {
        layoutService.homeButtonAction()
    }
    
}

// MARK: -
// MARK: - Configure

fileprivate extension MoneyCompetitionViewController {
    
    func configure() {
        setupLayoutService()
        hideKeyboardWhenTappedAround()
    }
    
    func setupLayoutService() {
        layoutService = MoneyCompetitionLayoutService(viewController: self)
    }
    
}
