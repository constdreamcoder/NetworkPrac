//
//  BookCollectionViewCell.swift
//  NetworkPrac
//
//  Created by SUCHAN CHANG on 1/17/24.
//

import UIKit

class BookCollectionViewCell: UICollectionViewCell {
    static let identifier = String(describing: BookCollectionViewCell.self)
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var thumnailImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.cornerRadius = 16
        backgroundColor = getRandomColor()
        
    }
    
    func getRandomColor() -> UIColor? {
        let colors: [UIColor] = [
            .systemRed, .systemGreen, .systemBlue,
            .systemOrange, .systemPurple, .systemTeal,
            .systemIndigo, .systemPink, .systemYellow,
            .brown, .cyan, .magenta
        ]
        
        return colors.randomElement()
    }

}
