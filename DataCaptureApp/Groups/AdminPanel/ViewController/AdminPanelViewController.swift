//
//  AdminPanelViewController.swift
//  DataCaptureApp
//
//  Created by Stanislau Sakharchuk on 7/14/18.
//  Copyright © 2018 Stanislau Sakharchuk. All rights reserved.
//

import UIKit

class AdminPanelViewController: UIViewController {
    
    // - UI
    @IBOutlet weak var tableView: UITableView!
    
    // - Manager / Service
    fileprivate var layoutService: AdminPanelLayoutService!
    fileprivate var dataSource: AdminPanelDataSource!
    
    // - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    @IBAction func logOutButtonAction(_ sender: UIButton) {
        layoutService.logOutButtonAction()
    }
    
}

// MARK: -
// MAKR: - Configure

fileprivate extension AdminPanelViewController {
    
    func configure() {
        setupLayoutService()
        setupDataSource()
    }
    
    func setupLayoutService() {
        layoutService = AdminPanelLayoutService(viewController: self)
    }
    
    func setupDataSource() {
        dataSource = AdminPanelDataSource(tableView: tableView)
    }
    
}
