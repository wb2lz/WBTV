//
//  HomeViewController.swift
//  WBTV
//
//  Created by wb2lz on 01/10/2016.
//  Copyright © 2016 wb2lz. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBarItem()
    }
}

extension HomeViewController {
    // MARK: 设置导航栏
    func setNavigationBarItem() {
        setNavigationLeftItem()
        setNavigationRightItems()
    }
    
    private func setNavigationLeftItem() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(imgName: "logo", highlightImgName: "logo", size: CGSize.zero, target: self, action:  #selector(self.leftBarBtnClicked(btn:)))
    }
    
    private func setNavigationRightItems() {
        // 1. 设置UIButton的尺寸
        let size = CGSize(width: 40, height: 44)

        // 2. 创建历史按钮
        let historyItem = UIBarButtonItem(imgName: "image_my_history", highlightImgName: "Image_my_history_click", size: size, target: self, action: #selector(self.historyBtnClicked(btn:)))

        // 3. 创建搜索按钮
        let searchItem = UIBarButtonItem(imgName: "btn_search", highlightImgName: "btn_search_clicked", size: size, target: self, action: #selector(self.searchBarBtnClicked(btn:)))

        // 4. 创建扫描按钮
        let arcodeItem = UIBarButtonItem(imgName: "Image_scan", highlightImgName: "Image_scan_click", size: size, target: self, action: #selector(self.arcodeBarBtnClicked(btn:)))

        navigationItem.rightBarButtonItems = [historyItem, searchItem, arcodeItem]
    }
    
    // MARK: 导航栏事件处理
    @objc private func leftBarBtnClicked(btn: UIBarButtonItem) {
        print("left")
    }
    
    @objc private func historyBtnClicked(btn: UIBarButtonItem) {
        print("history")
    }
    
    @objc private func searchBarBtnClicked(btn: UIBarButtonItem) {
        print("search")
    }
    
    @objc private func arcodeBarBtnClicked(btn: UIBarButtonItem) {
        print("arcode")
    }
}

extension UIBarButtonItem {
    // MARK: UIBarButtonItem convenience init
    convenience init(imgName: String, highlightImgName: String = "", size: CGSize = CGSize.zero, target: AnyObject? = nil, action: Selector) {
        let btn = UIButton()
        btn.setImage(UIImage(named: imgName), for: .normal)
        btn.setImage(UIImage(named: highlightImgName), for: .highlighted)
        
        if size == CGSize.zero {
            btn.sizeToFit()
        } else {
            btn.frame = CGRect(origin: CGPoint.zero, size: size)
        }
        
        btn.addTarget(target, action: action, for: .touchUpInside)
        self.init(customView: btn)
    }
}

