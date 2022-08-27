//
//  CustomTableViewCell.swift
//  iOSMathSample
//
//  Created by Masashi Hamaguchi on 2022/07/23.
//

import UIKit
import iosMath

class CustomTableViewCell: UITableViewCell {
    
    //公式の名前を表示させるラベルを宣言しよう
    @IBOutlet var KosikiLabel: UILabel!
    
    //公式表示させるMTMathUILabelを宣言しよう
    @IBOutlet var Mathlabel: MTMathUILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
