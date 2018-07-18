//
//  AdminPanelDataSource.swift
//  DataCaptureApp
//
//  Created by Evgeny Mahnach on 7/14/18.
//  Copyright © 2018 Evgeny Mahnach. All rights reserved.
//

import UIKit

class AdminPanelDataSource: NSObject {
    
    // - Init
    fileprivate let tableView: UITableView
    
    // - Manager / Service
    fileprivate let moneyCompetitionDatabaseManager = MoneyCompetitionDatabaseManager()
    fileprivate let mortgageDatabaseManager = MortgagePromotionDatabaseManager()
    
    // - Data
    fileprivate var checkmarkArray: [Bool] = [
        false,
        false
    ]
    
    fileprivate var leads: [Int] {
        return [
            moneyCompetitionDatabaseManager.get().count,
             mortgageDatabaseManager.get().count
        ]
    }
    
    fileprivate var sendDataModel = SendDataModel()
    
    // - Lifecycle
    
    init(tableView: UITableView) {
        self.tableView = tableView
        super.init()
        
        configure()
    }
    
    // - API
    
    func getSendDataModel() -> SendDataModel {
        return sendDataModel
    }
    
}

// MARK: -
// MARK: - UITableView Data Source

extension AdminPanelDataSource: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            return sectionCell(for: indexPath)
        case 1:
            return travelCell(for: indexPath)
        case 2:
            return mortgageCell(for: indexPath)
        default:
            return UITableViewCell()
        }
    }
    
}

// MARK: -
// MARK: - UITableView Delegate

extension AdminPanelDataSource: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 54
    }
    
}

// MARK: -
// MARK: - Cell

fileprivate extension AdminPanelDataSource {
    
    func sectionCell(for indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cell.section.rawValue, for: indexPath) as! AdminPanelSectionCell
        return cell
    }
    
    func travelCell(for indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cell.travel.rawValue, for: indexPath) as! AdminPanelTravelMoneyCell
        cell.downloadFileButton.isChecked = true
        cell.sendToSalesforceButton.isChecked = true
        cell.set(with: leads[indexPath.row - 1])
        cell.delegate = self
        return cell
    }
    
    func mortgageCell(for indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cell.mortgage.rawValue, for: indexPath) as! AdminPanelMortgageCell
        cell.downloadFileButton.isChecked = true
        cell.sendToSalesforceButton.isChecked = true
        cell.set(with: leads[indexPath.row - 1])
        cell.delegate = self
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
    
    enum Cell: String {
        case section = "AdminPanelSectionCell"
        case travel = "AdminPanelTravelMoneyCell"
        case mortgage = "AdminPanelMortgageCell"
    }
    
}

// MARK: -
// MARK: - Layout delegate

extension AdminPanelDataSource: AdminPanelLayoutDelegate {
    
    func didTapTravelButton(isDownload: Bool, isChecked: Bool) {
        if isDownload {
            sendDataModel.isNeedToDownloadMoneyTravel = isChecked
        } else {
            sendDataModel.isNeedToSendMoneyTravelToSalesforce = isChecked
        }
    }
    
    func didTapMortgageButton(isDownload: Bool, isChecked: Bool) {
        if isDownload {
            sendDataModel.isNeedToDownloadMortgage = isChecked
        } else {
            sendDataModel.isNeedToSendMortgageToSalesforce = isChecked
        }
    }
    
}
