//
//  PersonTableViewCell.swift
//  PipeDrive
//
//  Copyright © 2019 kassem Itani. All rights reserved.
//

import UIKit

class PersonTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bylineLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    
    var personViewModel: PersonViewModel! {
        didSet {
            titleLabel.text = personViewModel.name
            bylineLabel.text = personViewModel.primaryEmail 
            dateLabel.text = personViewModel.updated_date
            if let thumbnail = personViewModel.smallPictureUrl {
                thumbnailImageView.load(withImageUrl: thumbnail)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
