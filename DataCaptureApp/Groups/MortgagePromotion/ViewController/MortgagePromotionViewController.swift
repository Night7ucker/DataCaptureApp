//
//  MortgagePromotionViewController.swift
//  DataCaptureApp
//
//  Created by Stanislau Sakharchuk on 7/14/18.
//  Copyright © 2018 Stanislau Sakharchuk. All rights reserved.
//

import UIKit

class MortgagePromotionViewController: UIViewController {
    
    // - UI
    @IBOutlet weak var tableView: UITableView!
    
    // - Manager / Service
    fileprivate var dataSource: MortgagePromotionDataSource!
    
    // - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
}

// MARK: -
// MARK: - Configure

fileprivate extension MortgagePromotionViewController {
    
    func configure() {
        setupDataSource()
    }
    
    func setupDataSource() {
        dataSource = MortgagePromotionDataSource(tableView: tableView)
    }
    
}
