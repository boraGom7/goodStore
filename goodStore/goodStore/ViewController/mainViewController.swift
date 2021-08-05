//
//  mainViewController.swift
//  goodStore
//
//  Created by mac on 2021/08/05.
//

import UIKit
import RxSwift

class mainViewController: UIViewController {
    var disposeBag = DisposeBag()
    
    let menuArray = ["한식", "중식", "일식", "기타 외식업", "미용업", "목욕업", "세탁업", "영화관람", "숙박업", "VTR 대여", "노래방", "수영∙볼링∙당구∙골프장", "기타 서비스업소"]
    
    @IBOutlet weak var upperView: UIImageView!
    @IBOutlet weak var boardView: UIImageView!
    @IBOutlet weak var boardBGView: UIImageView!
    @IBOutlet weak var menuCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuCollectionView.delegate = self
        menuCollectionView.dataSource = self
        
        upperView.layer.cornerRadius = 10
        boardView.layer.cornerRadius = 15
        boardBGView.layer.cornerRadius = 20

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension mainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "menuCell", for: indexPath) as! menuCell
        
        cell.menuImage.image = UIImage(named: menuArray[indexPath.row])
        cell.menuLabel.text = menuArray[indexPath.row]
        cell.menuLabel.preferredMaxLayoutWidth = cell.menuLabel.bounds.width
        cell.menuLabel.autoresizesSubviews = true
        cell.menuLabel.numberOfLines = 0
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "menuCell", for: indexPath) as! menuCell
        return CGSize(width: (self.view.frame.width - 130)/4, height: self.menuCollectionView.frame.height / 4.5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
}