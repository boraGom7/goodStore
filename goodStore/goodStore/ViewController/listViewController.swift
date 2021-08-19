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
        cell.storePride.text = "주변보다 저렴한 가격으로 서비스하며 어르신 파마와 커트 시 할인해주는 업소, 주변 평균가격(25000원)보다 20% 저렴한 업소로 6년동안 동일가격 유지"
        
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "listCell", for: indexPath) as! listCell
        
        let width = self.view.bounds.width
        let estimateHeight = width/3
        
        cell.storePride.numberOfLines = 0
        cell.storePride.lineBreakMode = .byWordWrapping
        
        let estimateSize = cell.systemLayoutSizeFitting(CGSize(width: width, height: UIView.layoutFittingExpandedSize.height), withHorizontalFittingPriority: .required, verticalFittingPriority: .fittingSizeLevel)
        cell.layoutIfNeeded()
        
        return CGSize(width: width-40, height: estimateSize.height)
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
