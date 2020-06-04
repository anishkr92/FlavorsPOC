//
//  ViewController.swift
//  FlavorsPOC
//
//  Created by Anish on 17/04/20.
//  Copyright © 2020 Anish. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelEnvironment: UILabel!
    @IBOutlet weak var labelEnvironmentValue: UILabel!
    @IBOutlet weak var labelArea: UILabel!
    @IBOutlet weak var labelAreaValue: UILabel!
    @IBOutlet weak var labelConfigMode: UILabel!
    @IBOutlet weak var labelConfigModeValue: UILabel!
    @IBOutlet weak var labelServer: UILabel!
    @IBOutlet weak var labelServerValue: UILabel!
    @IBOutlet weak var labelVersion: UILabel!
    @IBOutlet weak var labelVersionValue: UILabel!
    @IBOutlet weak var labelProductName: UILabel!
    @IBOutlet weak var labelProductNameValue: UILabel!
    @IBOutlet weak var labelBundleId: UILabel!
    @IBOutlet weak var labelBundleIdValue: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupLabels()
        super.viewWillAppear(animated)
    }
    
    func setupLabels() {
        
        let environment = Bundle.main.environment
        labelEnvironmentValue.text = environment ?? "-"
        
        #if AREA_CHINA
        labelAreaValue.text = "China"
        labelServerValue.text = "Chinese \(environment ?? "")"
        #else
        labelAreaValue.text = "General parts of the world"
        labelServerValue.text = "General \(environment ?? "")"
        #endif
        
        #if DEBUG
        labelConfigModeValue.text = "Debug mode"
        #else
        labelConfigModeValue.text = "Release mode"
        #endif
        
        if let version = Bundle.main.versionNumber {
            labelVersionValue.text = version
        }
        if let productName = Bundle.main.productName {
            labelProductNameValue.text = productName
        }
        
        if let bundleID = Bundle.main.bundleIdentifier {
            labelBundleIdValue.text = bundleID
        }
    }
}

extension Bundle {
    
    var productName: String? {
        return self.infoDictionary?["CFBundleName"] as? String
    }
    
    var versionNumber: String? {
        return self.infoDictionary?["CFBundleShortVersionString"] as? String
    }
    
    var environment: String? {
        return self.infoDictionary?["Environment"] as? String
    }
}

