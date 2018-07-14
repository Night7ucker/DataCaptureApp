//
//  MortgagePromotionDataSource.swift
//  DataCaptureApp
//
//  Created by Stanislau Sakharchuk on 7/14/18.
//  Copyright © 2018 Stanislau Sakharchuk. All rights reserved.
//

import UIKit

class MortgagePromotionDataSource: NSObject {
    
    // - Init
    fileprivate let tableView: UITableView
    
    // - Data
    fileprivate let placeholders = [
        "Your name",
        "Enter your mobile number",
        "Email Address"
    ]
    fileprivate var pickTypes = [
        (title: "Best day to call", current: ""),
        (title: "Best time to call", current: "")
    ]
    fileprivate var buyersTypes = [
        (type: "First Time Buyer", isChecked: false),
        (type: "Remortgaging", isChecked: true),
        (type: "Buy To Let", isChecked: false),
        (type: "Moving Home", isChecked: false),
    ]
    
    // - Lifecycle
    
    init(tableView: UITableView) {
        self.tableView = tableView
        super.init()
        
        configure()
    }
    
}

// MARK: -
// MARK: - UITableView Data Source

extension MortgagePromotionDataSource: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Constant.sectionTitles.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Constant.sectionTitles[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 3
        case 1:
            return 2
        case 2:
            return 4
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            return textCell(for: indexPath)
        case 1:
            return pickCell(for: indexPath)
        case 2:
            return buyerCell(for: indexPath)
        default:
            return UITableViewCell()
        }
    }
    
}

// MARK: -
// MARK: - UITableView Delegate

extension MortgagePromotionDataSource: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        for i in 0..<buyersTypes.count {
            buyersTypes[i].isChecked = false
        }
        buyersTypes[indexPath.row].isChecked = true
        tableView.reloadSections(IndexSet([2]), with: .automatic)
    }
    
}

// MARK: -
// MARK: - Cell

fileprivate extension MortgagePromotionDataSource {
    
    func textCell(for indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cell.text.rawValue, for: indexPath) as! MortgageTextFieldCell
        cell.set(with: placeholders[indexPath.row])
        return cell
    }
    
    func pickCell(for indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cell.pick.rawValue, for: indexPath) as! MortgagePickCell
        cell.set(with: pickTypes[indexPath.row].title)
        return cell
    }
    
    func buyerCell(for indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cell.buyer.rawValue, for: indexPath) as! MortgageBuyerTypeCell
        cell.set(with: buyersTypes[indexPath.row].type, isChecked: buyersTypes[indexPath.row].isChecked)
        return cell
    }
    
}

// MARK: -
// MARK: - Configure

fileprivate extension MortgagePromotionDataSource {
    
    func configure() {
        setupDataSource()
    }
    
    func setupDataSource() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    enum Constant {
        static let sectionTitles = ["Credentials", "Time to call", "Buyer type"]
    }
    
    enum Cell: String {
        case text = "MortgageTextFieldCell"
        case pick = "MortgagePickCell"
        case buyer = "MortgageBuyerTypeCell"
    }
    
}
