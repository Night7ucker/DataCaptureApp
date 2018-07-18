//
//  HomeScreenViewController.swift
//  DataCaptureApp
//
//  Created by Evgeny Mahnach on 7/14/18.
//  Copyright © 2018 Evgeny Mahnach. All rights reserved.
//

import UIKit

class HomeScreenViewController: UIViewController {
    
    // - UI
    
    @IBOutlet weak var blueMainView: UIView!
    @IBOutlet weak var redMainView: UIView!
    @IBOutlet weak var leftGetStartedButton: UIButton!
    @IBOutlet weak var rightGetStartedButton: UIButton!
    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var rightImageView: UIImageView!
    
    // - Manager / Service
    fileprivate var layoutService: HomeScreenLayoutService!
    
    // - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        
        let documentsPath1 = NSURL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0])
        let logsPath = documentsPath1.appendingPathComponent("data")
        print(logsPath!)
        do {
            try FileManager.default.createDirectory(atPath: logsPath!.path, withIntermediateDirectories: true, attributes: nil)
        } catch let error as NSError {
            NSLog("Unable to create directory \(error.debugDescription)")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        layoutService.viewWillAppear(animated: animated)
    }
    
    // - Action
    
    @IBAction func travelMoneyCompetitionButtonAction(_ sender: UIButton) {
        layoutService.travelMoneyCompetitionButtonAction()
    }
    
    @IBAction func adminLoginButtonAction(_ sender: UIButton) {
        layoutService.adminLoginButtonAction()
    }
    
    @IBAction func mortgagePromotionButtonAction(_ sender: UIButton) {
        layoutService.mortgagePromotionButtonAction()
    }
    
}

// MARK: -
// MARK: - Configure

fileprivate extension HomeScreenViewController {
    
    func configure() {
        setupLayoutService()
    }
    
    func setupLayoutService() {
        layoutService = HomeScreenLayoutService(viewController: self)
    }
    
}
