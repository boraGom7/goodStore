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
    
    let menuArray = ["한식", "중식", "일식", "기타 외식업", "미용업", "목욕업", "세탁업", "영화관람", "숙박업", "VTR 대여", "노래방", "수영∙볼링∙당구∙골프장", "기타 서비스업종"]
    
    @IBOutlet weak var upperView: UIImageView!
    @IBOutlet weak var upperBarView: UIImageView!
    @IBOutlet weak var boardView: UIImageView!
    @IBOutlet weak var boardBGView: UIImageView!
    @IBOutlet weak var menuCollectionView: UICollectionView!
    @IBOutlet weak var shadowView: UIImageView!
    
    @IBOutlet weak var designView1: UIImageView!
    @IBOutlet weak var designView2: UIImageView!
    @IBOutlet weak var designView3: UIImageView!
    @IBOutlet weak var designView4: UIImageView!
    @IBOutlet weak var designView5: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuCollectionView.delegate = self
        menuCollectionView.dataSource = self
        menuCollectionView.layer.cornerRadius = 20
        
        shadowView.layer.cornerRadius = 20
        shadowView.layer.shadowOpacity = 0.9
        shadowView.layer.shadowOffset = CGSize(width: 10, height: 10)
        shadowView.layer.shadowRadius = 20
        
        boardView.layer.cornerRadius = 15
        boardView.layer.shadowOpacity = 0.2
        boardView.layer.shadowOffset = CGSize(width: 5, height: 5)
        boardView.layer.shadowRadius = 15
//        boardBGView.layer.cornerRadius = 20

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
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "menuCell", for: indexPath) as! menuCell
        return CGSize(width: (self.view.frame.width - 130)/4, height: self.menuCollectionView.frame.height / 4.5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 25, bottom: 10, right: 25)
    }
}
