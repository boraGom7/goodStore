//
//  detailViewController.swift
//  goodStore
//
//  Created by mac on 2021/08/12.
//

import UIKit

class detailViewController: UIViewController {
    @IBOutlet weak var detailTableView: UITableView!
    
    @IBOutlet weak var storeImage: UIImageView!
    @IBOutlet weak var bottomImage: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var prideLabel: UILabel!
    
    let titleArray = ["주소", "전화번호", "찾아오시는 길", "영업시간", "좌석수", "휴무일", "배달", "예약", "카드", "주차", "홈페이지 주소", "전자우편주소"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailTableView.delegate = self
        detailTableView.dataSource = self
        
    }

}

extension detailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "가게 정보"
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let headerView = view as? UITableViewHeaderFooterView
        headerView?.contentView.backgroundColor = .white
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath) as! detailCell
        cell.infoLabel.textColor = UIColor(red: 1/255, green: 1/255, blue: 1/255, alpha: 1)
        
        cell.titleLabel.text = titleArray[indexPath.item]
        cell.infoLabel.text = "테스트 테스트 테스트 12 34 테스트 테스트 123"
        
        return cell
    }
    
    
}
