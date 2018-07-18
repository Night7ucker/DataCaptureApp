//
//  AdminPanelViewController.swift
//  DataCaptureApp
//
//  Created by Evgeny Mahnach on 7/14/18.
//  Copyright © 2018 Evgeny Mahnach. All rights reserved.
//

import UIKit

class AdminPanelViewController: UIViewController {
    
    // - UI
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var exportAndRemoveDataButton: UIButton!
    @IBOutlet weak var exportButton: UIButton!
    
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
    
    @IBAction func exportButtonAction(_ sender: UIButton) {
        layoutService.exportButtonAction(isNeedToRemove: false, sendDataModel: dataSource.getSendDataModel())
    }
    
    @IBAction func exportAndRemoveAction(_ sender: UIButton) {
        layoutService.exportButtonAction(isNeedToRemove: true, sendDataModel: dataSource.getSendDataModel())
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
