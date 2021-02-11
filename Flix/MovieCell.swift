//
//  MovieCell.swift
//  Flix
//
//  Created by Anoop Khera on 2/10/21.
//

import UIKit

class MovieCell: UITableViewCell {
    
    //outlets from table view movie cell
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var synopsisLabel: UILabel!
    @IBOutlet weak var posterView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
