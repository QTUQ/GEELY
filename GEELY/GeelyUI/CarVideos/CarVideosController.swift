//
//  CarDetailedController.swift
//  GEELY
//
//  Created by Tuqa on 12/7/22.
//

import UIKit
import WebKit
import AVFoundation
import AVKit

class CarVideosController: UITableViewController {
    
    //MARK: -Variables
    @IBOutlet var CarVideosTableView: UITableView!
    let RefreshControl = UIRefreshControl()
    var VideosManager = CarVideosServicesManager()
    var videosArray = [LobbyVideos]()
    //MARK: -LifeCycl
    override func viewDidLoad() {
        super.viewDidLoad()
        VideosManager.getlobbyVideos { (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let lobbyVideo):
                    self.videosArray = lobbyVideo!.body
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                        print("video.videoLobbyName")
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
        setupCarVideosCell()
        refreshControll()
    }
    //MARK: -setUp the CarTableViewCell
    func setupCarVideosCell() {
        let nip = UINib(nibName: "CarVideosTableViewCell", bundle: nil)
        self.CarVideosTableView.register(nip, forCellReuseIdentifier: CarVideosTableViewCell.id)
        CarVideosTableView.rowHeight = 325
        CarVideosTableView.delegate = self
        CarVideosTableView.dataSource = self
        CarVideosTableView.showsVerticalScrollIndicator = true
        CarVideosTableView.separatorStyle = .singleLine
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
            print("commit a refresh")
        }
    }
    //MARK: -tableView DataSource Method
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.videosArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CarVideosTableViewCell.id, for: indexPath) as! CarVideosTableViewCell
        let lobbyArray = videosArray[indexPath.row]
        cell.cellDataSetup(carData: lobbyArray)
        return cell
    }
    //MARK: -tableView delegate Method, setUp the videos
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let url =  URL(string: videosArray[indexPath.row].deepLink?.imageUrl ?? "") else { return }
        let player = AVPlayer(url: url)
                    let playerViewController = AVPlayerViewController()
                    playerViewController.player = player
                    self.present(playerViewController, animated: true) {
                        playerViewController.player!.play()
        }
    }
}

