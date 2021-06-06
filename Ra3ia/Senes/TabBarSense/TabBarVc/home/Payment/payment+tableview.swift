//
//  payment+tableview.swift
//  Ra3ia
//
//  Created by Reham Ayman on 6/5/21.
//

import Foundation
import UIKit

extension selectPaymentMethodVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getNymberOfPaymentMethod()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PaymentMethodCellTableViewCell", for: indexPath) as! PaymentMethodCellTableViewCell
        presenter.ConfigerPaymentMethodCell(cell: cell, index: indexPath.row)
        return cell
    }
    
    func setupTableView(){
        self.tabelView.delegate = self
        self.tabelView.dataSource = self
        tabelView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        tabelView.tableFooterView?.isHidden = true
        tabelView.backgroundColor = UIColor.clear
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.DidSelectRow(index: indexPath.row)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
