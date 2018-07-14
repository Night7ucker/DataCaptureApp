//
//  AdminPanelDataSource.swift
//  DataCaptureApp
//
//  Created by Stanislau Sakharchuk on 7/14/18.
//  Copyright © 2018 Stanislau Sakharchuk. All rights reserved.
//

import UIKit

class AdminPanelDataSource: NSObject {
    
    // - Init
    fileprivate let tableView: UITableView
    
    // - Manager / Service
    fileprivate let moneyCompetitionDatabaseManager = MoneyCompetitionDatabaseManager()
    
    // - Data
    fileprivate var checkmarkArray: [Bool] = [
        false,
        false
    ]
    
    fileprivate lazy var leads: [Int] = {
        return [
            moneyCompetitionDatabaseManager.get().count,
            moneyCompetitionDatabaseManager.get().count
        ]
    }()
    
    // - Lifecycle
    
    init(tableView: UITableView) {
        self.tableView = tableView
        super.init()
        
        configure()
    }
    
}

// MARK: -
// MARK: - UITableView Data Source

extension AdminPanelDataSource: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Constant.sectionTitles.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Constant.sectionTitles[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == Constant.sectionTitles.count - 1 {
            return downloadCell(for: indexPath)
        }
        return adminCell(for: indexPath)
    }
    
}

// MARK: -
// MARK: - UITableView Delegate

extension AdminPanelDataSource: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        checkmarkArray[indexPath.section] = !checkmarkArray[indexPath.section]
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == Constant.sectionTitles.count - 1 {
            return 84
        }
        return 44
    }
    
}

// MARK: -
// MARK: - Cell

fileprivate extension AdminPanelDataSource {
    
    func adminCell(for indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cell.admin.rawValue, for: indexPath) as! AdminPanelCell
        cell.set(with: String(leads[indexPath.section]), isChecked: checkmarkArray[indexPath.section])
        return cell
    }
    
    func downloadCell(for indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cell.download.rawValue, for: indexPath) as! AdminPanelDownloadCell
        return cell
    }
    
}

// MARK: -
// MARK: - Configure

fileprivate extension AdminPanelDataSource {
    
    func configure() {
        setupDataSource()
        removeSeparator()
    }
    
    func setupDataSource() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func removeSeparator() {
        tableView.separatorColor = .clear
    }
    
    enum Constant {
        static let sectionTitles = ["Travel Money", "Morgages", ""]
    }
    
    enum Cell: String {
        case admin = "AdminPanelCell"
        case download = "AdminPanelDownloadCell"
    }
    
}
