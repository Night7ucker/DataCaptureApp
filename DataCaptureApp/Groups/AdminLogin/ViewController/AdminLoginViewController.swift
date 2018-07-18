//
//  AdminLoginViewController.swift
//  DataCaptureApp
//
//  Created by Evgeny Mahnach on 7/14/18.
//  Copyright © 2018 Evgeny Mahnach. All rights reserved.
//

import UIKit

class AdminLoginViewController: UIViewController {
    
    // - UI
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var resetPasswordButton: UIButton!
    
    // - Manager / Service
    fileprivate var layoutService: AdminLoginLayoutService!
    
    // - Completion
    public var completion: (() -> ())!
    
    // - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    // - Action
    
    @IBAction func homeButtonAction(_ sender: UIButton) {
        layoutService.homeButtonAction()
    }
    
    @IBAction func enterButtonAction(_ sender: UIButton) {
        layoutService.loginButtonAction()
    }
}

// MARK: -
// MARK: - Configure

fileprivate extension AdminLoginViewController {
    
    func configure() {
        setupLayoutService()
        hideKeyboardWhenTappedAround()
    }
    
    func setupLayoutService() {
        layoutService = AdminLoginLayoutService(viewController: self)
    }
    
}
