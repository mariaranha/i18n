//
//  ViewController.swift
//  i18n
//
//  Created by Marina Miranda Aranha on 24/01/20.
//  Copyright © 2020 Marina Miranda Aranha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dateLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        if (L10nLanguage.currentAppleLanguageFull() == "ar"){
            self.navigationController?.navigationBar.semanticContentAttribute = .forceRightToLeft
            self.navigationController?.view.semanticContentAttribute = .forceRightToLeft
        } else {
            self.navigationController?.navigationBar.semanticContentAttribute = .forceLeftToRight
            self.navigationController?.view.semanticContentAttribute = .forceLeftToRight
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.locale = Locale(identifier: L10nLanguage.currentAppleLanguageFull()) //set by the table view controller
        dateFormatterGet.dateStyle = .medium
        dateFormatterGet.timeStyle = .short
        dateLabel.text = dateFormatterGet.string(from: Date())
        
        if (L10nLanguage.currentAppleLanguageFull() == "ar"){
            self.navigationController?.navigationBar.semanticContentAttribute = .forceRightToLeft
            self.navigationController?.view.semanticContentAttribute = .forceRightToLeft
        }
    }


}

