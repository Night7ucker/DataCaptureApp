//
//  AdminPanelLayoutService.swift
//  DataCaptureApp
//
//  Created by Evgeny Mahnach on 7/14/18.
//  Copyright © 2018 Evgeny Mahnach. All rights reserved.
//

import UIKit
import RealmSwift

class AdminPanelLayoutService: NSObject {
    
    // - Init
    fileprivate unowned let viewController: AdminPanelViewController
    
    // - Manager / Service
    fileprivate let csvDataManager = CSVDataManager()
    
    // - Lifecycle
    
    init(viewController: AdminPanelViewController) {
        self.viewController = viewController
        super.init()
        
        configure()
    }
    
}

// MARK: -
// MARK: - Action

extension AdminPanelLayoutService {
    
    func logOutButtonAction() {
        guard let firstViewController = viewController.navigationController?.viewControllers.first else { return }
        viewController.navigationController?.popToViewController(firstViewController, animated: true)
    }
    
    func exportButtonAction(isNeedToRemove: Bool, sendDataModel: SendDataModel) {
        if sendDataModel.isNeedToDownloadMoneyTravel && sendDataModel.isNeedToDownloadMortgage {
            openShareController(with: csvDataManager.writeMoneyTravel(), secondFileName: csvDataManager.writeMoneyMortgage())
        } else if sendDataModel.isNeedToDownloadMortgage &&
            !sendDataModel.isNeedToDownloadMoneyTravel {
            openShareController(with: "", secondFileName: csvDataManager.writeMoneyMortgage())
        } else if !sendDataModel.isNeedToDownloadMortgage &&
            sendDataModel.isNeedToDownloadMoneyTravel {
            openShareController(with: csvDataManager.writeMoneyTravel(), secondFileName: "")
            
        }
        if isNeedToRemove {
            let realm = try! Realm()
            try! realm.write { [weak self] in
                realm.deleteAll()
                self?.viewController.tableView.reloadData()
            }
        }
    }
    
}

// MARK: -
// MARK: - Navigation

fileprivate extension AdminPanelLayoutService {
    
    func openShareController(with fileName: String = "", secondFileName: String = "") {
        var arrayToSendData = [Any]()
        
        if !fileName.isEmpty && !secondFileName.isEmpty {
            let url = NSURL.fileURL(withPath: fileName)
            let secondURL = NSURL.fileURL(withPath: secondFileName)
            arrayToSendData = ["Gathered data", url, secondURL]
        } else if !fileName.isEmpty {
            let url = NSURL.fileURL(withPath: fileName)
            arrayToSendData = ["Travel Money", url]
        } else {
            let secondURL = NSURL.fileURL(withPath: secondFileName)
            arrayToSendData = ["Mortgage", secondURL]
        }
        
//        let activityController = UIActivityViewController(activityItems: ["Gathered data", url, secondURL], applicationActivities: nil)
        let activityController = UIActivityViewController(activityItems: arrayToSendData, applicationActivities: nil)
        
        activityController.popoverPresentationController?.sourceView = viewController.view
        
        viewController.navigationController?.present(activityController, animated: true, completion: nil)
    }
    
}

// MARK: -
// MARK: - Configure

fileprivate extension AdminPanelLayoutService {
    
    func configure() {
        setShadows()
        configureButtons()
    }
    
    func setShadows() {
        viewController.tableView.dropShadow(color: UIColor.lightGray, opacity: 1, offSet: CGSize.zero, radius: 3, scale: true)
        viewController.topView.dropShadow(color: UIColor.lightGray, opacity: 1, offSet: CGSize.zero, radius: 3, scale: true)
    }
    
    func configureButtons() {
        // corner radius
        viewController.exportButton.layer.cornerRadius = 12
        
        // border
        
        // shadow
        viewController.exportButton.layer.shadowColor = UIColor.black.cgColor
        viewController.exportButton.layer.shadowOffset = CGSize(width: 1, height: 1)
        viewController.exportButton.layer.shadowOpacity = 0.7
        viewController.exportButton.layer.shadowRadius = 2
        
        viewController.exportAndRemoveDataButton.layer.cornerRadius = 12
        
        viewController.exportAndRemoveDataButton.layer.borderWidth = 1.0
        viewController.exportAndRemoveDataButton.layer.borderColor = AppColor.color(fromHex: "C9D144").cgColor
        
//        viewController.exportAndRemoveDataButton.layer.shadowColor = UIColor.black.cgColor
//        viewController.exportAndRemoveDataButton.layer.shadowOffset = CGSize(width: 1, height: 1)
//        viewController.exportAndRemoveDataButton.layer.shadowOpacity = 0.7
//        viewController.exportAndRemoveDataButton.layer.shadowRadius = 2

    }
    
}
