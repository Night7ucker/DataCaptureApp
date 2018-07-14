//
//  AdminLoginViewController.swift
//  DataCaptureApp
//
//  Created by Stanislau Sakharchuk on 7/14/18.
//  Copyright © 2018 Stanislau Sakharchuk. All rights reserved.
//

import UIKit

class AdminLoginViewController: UIViewController {
    
    // - UI
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    // - Manager / Service
    fileprivate var layoutService: AdminLoginLayoutService!
    
    // - Completion
    public var completion: (() -> ())!
    
    // - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        layoutService.viewWillAppear(animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        layoutService.viewWillDisappear(animted: animated)
    }
    
    // - Tap
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        layoutService.touchesBegan(touches, with: event)
    }
    
    // - Action
    
    @IBAction func enterButtonAction(_ sender: UIButton) {
        layoutService.enterButtonAction()
    }
}

// MARK: -
// MARK: - Configure

fileprivate extension AdminLoginViewController {
    
    func configure() {
        setupLayoutService()
    }
    
    func setupLayoutService() {
        layoutService = AdminLoginLayoutService(viewController: self)
    }
    
}
