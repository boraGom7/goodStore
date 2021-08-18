//
//  listViewController.swift
//  goodStore
//
//  Created by mac on 2021/08/06.
//

import UIKit
import RxSwift

class listViewController: UIViewController {
    var disposeBag = DisposeBag()
    var selectedIndex: IndexPath?
    
    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var goMap: UIButton!
    @IBOutlet weak var listCollectionView: UICollectionView!
    
    var listArray = [storeList]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        listCollectionView.delegate = self
        listCollectionView.dataSource = self
        
        goMap.layer.cornerRadius = 10
        
        categorySelection.subscribe(onNext: { menu in
            DispatchQueue.main.async {
                self.category.text = menu
            }
            
            openAPI().response(endString: getEndString(menu: menu))
        }).disposed(by: disposeBag)
    }
    
    @IBAction func goBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension listViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "listCell", for: indexPath) as! listCell
        
        cell.layer.shadowOpacity = 0.1
        cell.layer.shadowOffset = CGSize(width: 10, height: 3)
        cell.layer.shadowRadius = 10
        cell.layer.masksToBounds = false
        
        cell.contentView.layer.cornerRadius = 10
        cell.listBGView.layer.cornerRadius = 10
        cell.storeImage.layer.cornerRadius = 10
        cell.storeName.text = "storeName"
        cell.storeDiscription.text = "abcdefghijklmnopqrstuwyz"
        
        if selectedIndex == indexPath {
            selectedStore.onNext(cell.storeName.text!)
            
            let detailVC = storyboard?.instantiateViewController(identifier: "detailID") as! detailViewController
            detailVC.modalPresentationStyle = .fullScreen
            present(detailVC, animated: true, completion: nil)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if selectedIndex != indexPath || selectedIndex == nil {
          selectedIndex = indexPath
            listCollectionView.reloadData()
        } else {
          selectedIndex = nil
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.view.bounds.width
        return CGSize(width: width-40, height: width/4)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }

}
