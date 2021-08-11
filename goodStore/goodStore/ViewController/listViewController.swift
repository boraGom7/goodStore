//
//  listViewController.swift
//  goodStore
//
//  Created by mac on 2021/08/06.
//

import UIKit

class listViewController: UIViewController {
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var goMap: UIButton!
    @IBOutlet weak var listCollectionView: UICollectionView!
    
    var listArray = [storeList]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        listCollectionView.delegate = self
        listCollectionView.dataSource = self
    }

}

extension listViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "listCell", for: indexPath) as! listCell
        
        return cell
    }
    

}
