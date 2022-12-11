//
//  CarDetailedController.swift
//  GEELY
//
//  Created by Tuqa on 12/7/22.
//

import UIKit

class CarDetailedController: UITableViewController  {
    
    //MARK: -Variables
    @IBOutlet weak var CarDetTableView: UITableView!
    let RefreshControl = UIRefreshControl()
    //MARK: -LifeCycl
    override func viewDidLoad() {
        super.viewDidLoad()
        APIHandler.sharedInstance.fetchingData { data in
            APIHandler.sharedInstance.post = data
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
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
        return APIHandler.sharedInstance.post.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CarDeTableViewCell.id, for: indexPath) as! CarDeTableViewCell
        let carData = APIHandler.sharedInstance.post[indexPath.row]
        cell.LabelName.text = carData.videoLobbyName
        cell.LabelDescription.text = carData.videoLobbyDescription
        let link =  carData.image.imageUrl!
        cell.CarImage.downloaded(from: link)
        return cell
    }
    //MARK: -tableView delegate Method
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let cell = tableView.cellForRow(at: indexPath) as? CarDeTableViewCell {
            guard let urlVideo =  URL(string: APIHandler.sharedInstance.post[indexPath.row].url ?? "") else {return}
            let request = URLRequest(url: urlVideo)
            cell.webView.isHidden = true
            DispatchQueue.main.async {
                cell.webView.load(request)
            }
        }
    }
}
