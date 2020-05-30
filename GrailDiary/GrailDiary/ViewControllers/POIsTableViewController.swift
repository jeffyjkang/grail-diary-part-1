//
//  ViewController.swift
//  GrailDiary
//
//  Created by Jeff Kang on 5/24/20.
//  Copyright © 2020 Jeff Kang. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController, UITableViewDelegate {
    
    var pois: [POI] = [
//        POI(location: "Bentonville", country: "USA", clues: ["Ar","North-West"])
    ]
	
    @IBOutlet weak var POITableView: UITableView!

    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        POITableView.delegate = self
        POITableView.dataSource = self
    }

}

extension POIsTableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pois.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = POITableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as? POITableViewCell else { fatalError("Cell identifier is wrong or the cell is not of type POITableViewCell") }
        let pOI = pois[indexPath.row]
        cell.poi = pOI
        return cell
    }
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPOIModalSegue" {
            if let addPOIVC = segue.destination as? AddPOIViewController{
                addPOIVC.delegate = self
            }
        } else if segue.identifier == "ShowPOIDetailSegue" {
            if let indexPath = POITableView.indexPathForSelectedRow,
            let poiDetailVC = segue.destination as? POIDetailViewController{
                poiDetailVC.poi = pois[indexPath.row]
            }
        }
    }
    
}



extension POIsTableViewController: AddPOIDelegate {
    
    func poiWasAdded(_ poi: POI) {
        pois.append(poi)
        POITableView.reloadData()
    }
    
}
