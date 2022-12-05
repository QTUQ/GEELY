//
//  ViewController.swift
//  GEELY
//
//  Created by Tuqa on 11/22/22.
//

import UIKit
import Alamofire

//TODO: Move delegate as extension
class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    // MARK: -Variables
    @IBOutlet weak var carscollectionView: UICollectionView!
    @IBOutlet weak var sevicesColl: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    // MARK: -
    override func viewDidLoad() {
        super.viewDidLoad()
        setUPnaviogation()
        setUpCollectioViews()
        pageControll()
    }
    //MARK: - setUp Navigation
    func setUPnaviogation() {
        navigationController?.navigationBar.layer.masksToBounds = false
        navigationController?.navigationBar.layer.shadowColor = UIColor(named: "shadow")?.cgColor
        navigationController?.navigationBar.layer.shadowOpacity = 40
        navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0, height: -10)
        navigationController?.navigationBar.layer.cornerRadius = 10
    }
    // MARK: -setUp CollectionView
    private func setUpCollectioViews() {
        sevicesColl.register(CustomCell1.self, forCellWithReuseIdentifier: CustomCell1.identifier)
        carscollectionView.register(CustomCell2.self, forCellWithReuseIdentifier: CustomCell2.id)
        carscollectionView.layer.cornerRadius = 40
        sevicesColl.dataSource = self
        sevicesColl.delegate = self
        carscollectionView.dataSource = self
        carscollectionView.delegate = self
    }
    // MARK: -CollectionView datasource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == sevicesColl {
            return 5
        }
        
        return 4
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == sevicesColl {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCell1.identifier, for: indexPath) as! CustomCell1
            cell.configure(label: "custom\(indexPath.row)")
            return cell }
        else {
            let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCell2.id, for: indexPath) as! CustomCell2
            return cell2
        }
    }
    // MARK: -set the page control
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
// MARK: -ColllectionView Delegate
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

