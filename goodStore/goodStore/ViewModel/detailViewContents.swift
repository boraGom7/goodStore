//
//  detailViewContents.swift
//  goodStore
//
//  Created by mac on 2021/08/17.
//

import UIKit
import RxSwift

class detailContent {
    var disposebag = DisposeBag()

    var storeName: UILabel = {
       let label = UILabel()
        selectedStore.asObserver().subscribe(onNext: { name in
            DispatchQueue.main.async {
                label.text = name
            }
        }).disposed(by: detailContent().disposebag)
        return label
    }()
    
    var description: UILabel = {
        let label = UILabel()
        selectedDescription.asObserver().subscribe(onNext: { description in
            DispatchQueue.main.async {
                label.text = description
            }
         }).disposed(by: detailContent().disposebag)
         return label
    }()
    
    var address: UILabel = {
        let label = UILabel()
        selectedAddress.asObserver().subscribe(onNext: { address in
            DispatchQueue.main.async {
                label.text = address
            }
         }).disposed(by: detailContent().disposebag)
         return label
    }()
    
    var way: UILabel = {
        let label = UILabel()
        selectedWay.asObserver().subscribe(onNext: { way in
            DispatchQueue.main.async {
                label.text = way
            }
         }).disposed(by: detailContent().disposebag)
         return label
    }()
    
    var number: UILabel = {
        let label = UILabel()
        selectedNumber.asObserver().subscribe(onNext: { number in
            DispatchQueue.main.async {
                label.text = number
            }
         }).disposed(by: detailContent().disposebag)
         return label
    }()
    
    var time: UILabel = {
        let label = UILabel()
        selectedTime.asObserver().subscribe(onNext: { time in
            DispatchQueue.main.async {
                label.text = time
            }
         }).disposed(by: detailContent().disposebag)
         return label
    }()
}


