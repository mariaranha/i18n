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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.locale = Locale(identifier: "en_US") //set by the table view controller
        dateFormatterGet.dateStyle = .medium
        dateFormatterGet.timeStyle = .short
        dateLabel.text = dateFormatterGet.string(from: Date())
        

    }


}

