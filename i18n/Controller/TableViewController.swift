//
//  TableViewController.swift
//  i18n
//
//  Created by Marina Miranda Aranha on 24/01/20.
//  Copyright © 2020 Marina Miranda Aranha. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

   var countries = [
        Country(name: "Inglês", image: UIImage(named: "bandeira-US")),
        Country(name: "Árabe", image: UIImage(named: "bandeira-AR")),
        Country(name: "Russo", image: UIImage(named: "bandeira-RU"))
                    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "customCell")

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as? TableViewCell {
            let country = countries[indexPath.row]
            cell.countryLabel.text = country.name
            cell.flagImage.image = country.image
            return cell
        }

         
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            L10nLanguage.setAppleLAnguageTo(lang: "en_US")
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
        } else if indexPath.row == 1 {
            L10nLanguage.setAppleLAnguageTo(lang: "ar")
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
        } else if indexPath.row == 2 {
            L10nLanguage.setAppleLAnguageTo(lang: "ru_RU")
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
        }
        
        _ = navigationController?.popViewController(animated: true)

    }

}
