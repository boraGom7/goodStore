//
//  detailViewController.swift
//  goodStore
//
//  Created by mac on 2021/08/12.
//

import UIKit

class detailViewController: UIViewController {

    @IBOutlet weak var storeImage: UIImageView!
    @IBOutlet weak var bottomImage: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .white
        return scrollView
    }()
    
    let contentsView: UIView = {
        let contentsView = UIView()
        contentsView.backgroundColor = .white
        return contentsView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

//        contentsView.addSubview(detailContent().storeName)
//        contentsView.addSubview(detailContent().description)
//        contentsView.addSubview(detailContent().address)
//        contentsView.addSubview(detailContent().way)
//        contentsView.addSubview(detailContent().number)
//        contentsView.addSubview(detailContent().time)
        scrollView.addSubview(contentsView)
        self.view.addSubview(scrollView)
        
        autoLayoutScrollView()
    }
    
    func autoLayoutScrollView() {
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        scrollView.topAnchor.constraint(equalTo: storeImage.bottomAnchor, constant: 0).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: bottomImage.topAnchor, constant: 0).isActive = true
        
        contentsView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 0).isActive = true
        contentsView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 0).isActive = true
        contentsView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0).isActive = true
        contentsView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0).isActive = true
        contentsView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 2).isActive = true
        contentsView.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 1).isActive = true
        
//        detailContent().storeName.leadingAnchor.constraint(equalTo: contentsView.leadingAnchor, constant: 20).isActive = true
//        detailContent().storeName.topAnchor.constraint(equalTo: contentsView.bottomAnchor, constant: 20).isActive = true
//        detailContent().storeName.trailingAnchor.constraint(equalTo: contentsView.trailingAnchor, constant: 500).isActive = true
    }

}

