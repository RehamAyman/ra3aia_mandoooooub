//
//  MyReviewVC.swift
//  Ra3ia
//
//  Created by Reham Ayman on 3/23/21.
//

import UIKit
import Cosmos

class MyReviewVC: UIViewController {
    var presenter : MyReviewPrisnter!

    @IBOutlet weak var reviewStars: CosmosView!
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = MyReviewPrisnter(view: self)

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter.viewWillApper()
    
    }
    @IBAction func BackButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
