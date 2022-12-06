//
//  ViewController.swift
//  GEELY
//
//  Created by Tuqa on 11/22/22.
//

import UIKit
import Alamofire


class HomeViewController: UIViewController {
    let CarCollectionVoewCell = "CarCollectionViewCell"
    // MARK: -Variables
    @IBOutlet weak var carscollectionView: UICollectionView!
    @IBOutlet weak var sevicesColl: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    // MARK: -Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        APIHandler.sharedInstance.fetchingData()
        setUPnaviogation()
        setUpCollectioViews()
        pageControll()
    }
    //MARK: -setUp Navigation
    func setUPnaviogation() {
        navigationController?.navigationBar.layer.masksToBounds = false
        navigationController?.navigationBar.layer.shadowColor = UIColor(named: "shadow")?.cgColor
        navigationController?.navigationBar.layer.shadowOpacity = 40
        navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0, height: -10)
        navigationController?.navigationBar.layer.cornerRadius = 10
    }
    // MARK: -setUp CollectionViews
    private func setUpCollectioViews() {
        carscollectionView.layer.cornerRadius = 40
        sevicesColl.register(servicesCollViewCell1.self, forCellWithReuseIdentifier: servicesCollViewCell1.identifier)
//        carscollectionView.register(CarCollectionViewCell.self, forCellWithReuseIdentifier: CarCollectionViewCell.id)
        let nib = UINib(nibName: CarCollectionVoewCell,bundle: nil)
        self.carscollectionView.register(nib, forCellWithReuseIdentifier: CarCollectionViewCell.id)
        sevicesColl.dataSource = self
        sevicesColl.delegate = self
        carscollectionView.dataSource = self
        carscollectionView.delegate = self
    }
    
    // MARK: -setUp the page control
    private func pageControll() {
        carscollectionView.isPagingEnabled = true
        pageControl.numberOfPages = 4
    }
    // to tell which cell the UICollectionView stops on (CV = SV)
    // calculate the width of collection cell and the index for the current page.
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageControl?.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        pageControl?.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
}
 //MARK: -collectionView delegate & datasource
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == sevicesColl {
            return 5
        }
        
        return 4
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == sevicesColl {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: servicesCollViewCell1.identifier, for: indexPath) as! servicesCollViewCell1
            cell.configure(label: "custom\(indexPath.row)")
            return cell }
        else {
            let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: CarCollectionViewCell.id, for: indexPath) as! CarCollectionViewCell
            return cell2
        }
    }
}
// MARK: -ColllectionView flowlayout Delegate
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        collectionView.showsHorizontalScrollIndicator = false
        if collectionView == sevicesColl {
            return CGSize(width: sevicesColl.bounds.height, height: sevicesColl.bounds.height) }
        else {
            return CGSize(width: carscollectionView.bounds.width, height: carscollectionView.bounds.height)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == carscollectionView {
            return 0
            
        }
        return 6
    }
}

