//
//  TableViewVC.swift
//  week-3-seminar
//
//  Created by madilyn on 2022/04/23.
//

import UIKit

class TableViewVC: UIViewController {
    static let ID = "TableViewVC"
    
    @IBOutlet weak var tableView: UITableView!
    
    var receiveData = ""
    var receiveDataaaaa: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: TableViewCell.ID, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: TableViewCell.ID)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.allowsSelection = false
    }
}

extension TableViewVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MusicDataModel.dummyData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.ID, for: indexPath) as? TableViewCell else { return UITableViewCell() }
        
        cell.setData(MusicDataModel.dummyData[indexPath.row])
        
        return cell
    }
}

extension TableViewVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}
