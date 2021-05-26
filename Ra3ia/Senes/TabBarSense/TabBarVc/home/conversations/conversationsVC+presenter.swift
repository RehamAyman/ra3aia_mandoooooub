//
//  conversationsVC+presenter.swift
//  Ra3ia
//
//  Created by Reham Ayman on 4/8/21.
//

import Foundation
import SKActivityIndicatorView
import ViewAnimator


extension conversationsVC : conversationView {
    func showIndicator() {
        SKActivityIndicator.show()
    }
    
    func hideIndicator() {
        SKActivityIndicator.dismiss()
    }
    
    func featchingData() {
        self.tableview.reloadData()
        let ANIMATION = AnimationType.zoom(scale: 0.2)
        let fromAnimation = AnimationType.vector(CGVector(dx: 30, dy: 0))
        UIView.animate(views: tableview.visibleCells, animations: [fromAnimation, ANIMATION], duration: 0.65 )
    }
    
    func showError(error: String) {
        showErrorAlert(title: "", message: error)
    }
    
    func gotoChat() {
        let vc = Storyboard.Main.viewController(messageVC.self)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func setUptable() {
        tableview.delegate = self
        tableview.dataSource = self
        tableview.separatorStyle = .none
    }
    
    
}
