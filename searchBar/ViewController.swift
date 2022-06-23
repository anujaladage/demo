//
//  ViewController.swift
//  searchBar
//
//  Created by Ashlesha Kamble on 20/06/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var theSearch: UISearchBar!
    @IBOutlet weak var firstTableview: UITableView!
    
    var searchActive = true
    var countriesArray = ["Dominica","France","Germany","Japan","Albania","India","Cuba","Bolivia","Latvia","Morocco","Armenia"]
    //var capitalsArray = ["Roseau","Paris","Berlin","Tokyo","Tirana","Delhi","Havana","Sucre","Riga","Rabat"]
    var filteredArray = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        firstTableview.dataSource = self
        firstTableview.delegate = self
        theSearch.delegate = self
        filteredArray = countriesArray
    }


}

extension ViewController: UITableViewDelegate,UITableViewDataSource, UISearchBarDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (searchActive) {
            return filteredArray.count
        } else {
            return countriesArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if filteredArray.count != 0 {
            cell.textLabel?.text = filteredArray[indexPath.row]
        } else {
            cell.textLabel?.text = countriesArray[indexPath.row]
        }

            return cell
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
         filteredArray = []
        if searchText == "" {
            filteredArray = countriesArray
        }
        else {
            for skills in countriesArray {
                if skills.lowercased().contains(searchText.lowercased()) {
                    filteredArray.append(skills)
                }
            }
        }
        self.firstTableview.reloadData()
    
}

}
