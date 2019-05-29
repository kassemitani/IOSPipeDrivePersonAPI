//
//  PersonDetailsViewController.swift
//  PipeDrive
//
//  Copyright © 2019 kassem Itani. All rights reserved.
//

import UIKit

class PersonDetailsViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var abstractLabel: UILabel!
    
    var articleViewModel: PersonViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.load(withImageUrl: articleViewModel.largePictureUrl)
        titleLabel.text = articleViewModel.name
        abstractLabel.text = articleViewModel.primaryEmail
    }
    


}
