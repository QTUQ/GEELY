//
//  ViewController.swift
//  GEELY
//
//  Created by Tuqa on 11/22/22.
//

import UIKit
class HomeCollectionView: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView2: UICollectionView!
    @IBOutlet weak var collectionView1: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.layer.masksToBounds = false
        navigationController?.navigationBar.layer.shadowColor = UIColor(named: "shadow")?.cgColor
        navigationController?.navigationBar.layer.shadowOpacity = 40
        navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0, height: -10)
        navigationController?.navigationBar.layer.cornerRadius = 10
        setUpCollectioV1()
        setUPCollectionV2()
        pageControll()
        collectionView1.dataSource = self
        collectionView1.delegate = self
        collectionView2.dataSource = self
        collectionView2.delegate = self
    }
    // MARK: -set the first CollectionView
    private func setUpCollectioV1() {
        collectionView1.isScrollEnabled = true
        collectionView1.transform = CGAffineTransform(scaleX: -1, y: 1)
        collectionView1.layoutIfNeeded()
        collectionView1.translatesAutoresizingMaskIntoConstraints = false
        collectionView1.backgroundColor = .clear
        collectionView1.register(CustomCell1.self, forCellWithReuseIdentifier: CustomCell1.identifier)
    }
    // MARK: -set up the second collection view
    private func setUPCollectionV2() {
        collectionView2.isScrollEnabled = true
        collectionView2.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        collectionView2.layoutIfNeeded()
        collectionView2.layer.cornerRadius = 40
        collectionView2.translatesAutoresizingMaskIntoConstraints = false
        collectionView2.layer.shadowColor = UIColor(named: "shadow")!.cgColor
        collectionView2.layer.shadowOpacity = 20
        collectionView2.layer.shadowOffset = CGSize(width: 10, height: 5)
        collectionView2.register(CustomCell2.self, forCellWithReuseIdentifier: CustomCell2.id)
    }
    // MARK: -CollectionView datasource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionView1 {
            return 5 }
        return 4
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collectionView1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCell1.identifier, for: indexPath) as! CustomCell1
            cell.transform = CGAffineTransform(scaleX: -1, y: 1)
            cell.configure(label: "custom\(indexPath.row)")
            return cell }
        else {
            let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCell2.id, for: indexPath) as! CustomCell2
            cell2.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
            return cell2
        }
    }
    // MARK: -set the page control
    private func pageControll() {
        collectionView2.isPagingEnabled = true
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
extension HomeCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        collectionView.showsHorizontalScrollIndicator = false
        if collectionView == collectionView1 {
            return CGSize(width: collectionView1.bounds.width/3.3, height: collectionView1.bounds.height/1.4) }
        else {
            return CGSize(width: collectionView2.bounds.width, height: collectionView2.bounds.height)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == collectionView2 {
            return 0 }
        return 7
    }
}

