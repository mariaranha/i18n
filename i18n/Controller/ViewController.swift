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
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
//        if (L10nLanguage.currentAppleLanguageFull() == "ar"){
//            self.navigationController?.navigationBar.semanticContentAttribute = .forceRightToLeft
//            self.navigationController?.view.semanticContentAttribute = .forceRightToLeft
//        } else {
//            self.navigationController?.navigationBar.semanticContentAttribute = .forceLeftToRight
//            self.navigationController?.view.semanticContentAttribute = .forceLeftToRight
//        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.locale = Locale(identifier: "en_US") //change to localizable
        dateFormatterGet.dateStyle = .medium
        dateFormatterGet.timeStyle = .short
        dateLabel.text = dateFormatterGet.string(from: Date())
        

    }


    @IBAction func updateScreen(_ sender: Any) {
        descriptionLabel.text = ("Банка кока-колы в россии")
    }
}

