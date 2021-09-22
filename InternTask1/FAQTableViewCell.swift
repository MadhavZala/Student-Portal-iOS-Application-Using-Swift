//
//  FAQTableViewCell.swift
//  InternTask1
//
//  Created by Madhav on 14/06/21.
//  Copyright © 2021 Madhav Zala. All rights reserved.
//

import UIKit

class FAQTableViewCell: UITableViewCell {
    
    @IBOutlet var faqQuestionLabel : UILabel!
    @IBOutlet var faqAnswerLabel : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
