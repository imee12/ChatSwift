//
//  messageCell.swift
//  
//
//  Created by Imee Cuison on 6/19/15.
//
//

import UIKit

class messageCell: UITableViewCell {

    
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    
   
    @IBOutlet weak var nameLbl: UILabel!
    
    
    @IBOutlet weak var messageLbl: UILabel!
    
    
    @IBOutlet weak var usernameLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
       
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
