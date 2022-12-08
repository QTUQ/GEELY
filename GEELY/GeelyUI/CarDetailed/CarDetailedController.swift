//
//  CarDetailedController.swift
//  GEELY
//
//  Created by Tuqa on 12/7/22.
//

import UIKit


class CarDetailedController: UITableViewController {
    //MARK: -Variables
    @IBOutlet weak var CarDetTableView: UITableView!
    let RefreshControl = UIRefreshControl()
    //MARK: -LifeCycl
    override func viewDidLoad() {
        super.viewDidLoad()
        APIHandler.sharedInstance.fetchingData()
        CarDetaileCell()
        refreshControll()
    }
    //MARK: -setUp the CarTableViewCell
    func CarDetaileCell() {
        let nip = UINib(nibName: "CarDeTableViewCell", bundle: nil)
        self.CarDetTableView.register(nip, forCellReuseIdentifier: CarDeTableViewCell.id)
        CarDetTableView.rowHeight = 325
        CarDetTableView.delegate = self
        CarDetTableView.dataSource = self
        CarDetTableView.showsVerticalScrollIndicator = true
        CarDetTableView.separatorStyle = .singleLine
    }
    
    //MARK: -setUp the RefreshControll
    func refreshControll() {
        RefreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        RefreshControl.addTarget(self, action: #selector((refresh)), for: UIControl.Event.valueChanged)
        tableView.addSubview(RefreshControl)
    }
    @objc func refresh(_ sender: AnyObject) {
        DispatchQueue.main.async {
            self.RefreshControl.beginRefreshing()
            self.tableView.reloadData()
            self.RefreshControl.endRefreshing()
        }
    }
    //MARK: -tableView DataSource Method
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        self.CarDetTableView.reloadData()
        return APIHandler.sharedInstance.post.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CarDeTableViewCell.id, for: indexPath) as! CarDeTableViewCell
        cell.LabelName.text = APIHandler.sharedInstance.post[indexPath.row].videoLobbyName
        cell.LabelDescription.text = APIHandler.sharedInstance.post[indexPath.row].videoLobbyDescription
        let link =  APIHandler.sharedInstance.post[indexPath.row].image.imageUrl!
        cell.CarImage.downloaded(from: link)
        return cell
    }
    //MARK: -tableView delegate Method
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
