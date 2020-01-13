//
//  cellRoom.swift
//  tabview-button-fel
//
//  Created by Huy on 1/13/20.
//  Copyright © 2020 Huy. All rights reserved.
//

import UIKit

class cellRoom: UITableViewCell {
    let imageRoom1 : UIImageView = {
        let imageRoom1 = UIImageView()
        imageRoom1.translatesAutoresizingMaskIntoConstraints = false
//        imageRoom1.contentMode = .scaleAspectFit
        return imageRoom1
    }()
    let labelRoom: UILabel = {
        let labelRoom = UILabel()
        labelRoom.translatesAutoresizingMaskIntoConstraints = false
        labelRoom.font = .boldSystemFont(ofSize: 20)
        labelRoom.textColor = .black
        return labelRoom
    }()
    let princeRoom: UILabel = {
        let princeRoom = UILabel()
        princeRoom.translatesAutoresizingMaskIntoConstraints = false
        princeRoom.font = .boldSystemFont(ofSize: 14)
        princeRoom.textColor = .black
        return princeRoom
    }()
    let reductionLabel : UIButton = { // nut giam
        let reductionLabel = UIButton()
        reductionLabel.translatesAutoresizingMaskIntoConstraints = false
        reductionLabel.setTitle("-", for: .normal)
        reductionLabel.backgroundColor = .green
        return reductionLabel
    }()
    let increaseButton : UIButton = { // nut tang
           let increaseButton = UIButton()
           increaseButton.translatesAutoresizingMaskIntoConstraints = false
           increaseButton.setTitle("+", for: .normal)
           increaseButton.backgroundColor = .green
           return increaseButton
       }()
    let numberBox: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "0"
        label.textAlignment = .center
        label.backgroundColor = .systemBlue
        label.textColor = .white
        return label
    }()
    var information : room? {
        didSet {
            if let data = information {
                imageRoom1.image = data.imageRoom
                labelRoom.text = data.textRoom
                princeRoom.text = data.price
            }
        }
    }
    
    var box: Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
           super.setSelected(selected, animated: animated)
           setupLayout()
        increaseButton.addTarget(self, action: #selector(increase), for: .touchUpInside)
        reductionLabel.addTarget(self, action: #selector(decrease), for: .touchUpInside)
       }
    func setupLayout(){
        self.addSubview(imageRoom1)
        imageRoom1.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        imageRoom1.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8).isActive = true
        imageRoom1.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.25).isActive = true
        imageRoom1.heightAnchor.constraint(equalTo: imageRoom1.widthAnchor, multiplier: 1).isActive = true
        
        self.addSubview(labelRoom)
        labelRoom.topAnchor.constraint(equalTo: imageRoom1.topAnchor, constant: 0).isActive = true
        labelRoom.leadingAnchor.constraint(equalTo: imageRoom1.trailingAnchor, constant: 10).isActive = true
        labelRoom.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 10).isActive = true
        labelRoom.heightAnchor.constraint(equalToConstant: 20 * 1.5).isActive = true
        
        self.addSubview(princeRoom)
        princeRoom.topAnchor.constraint(equalTo: imageRoom1.topAnchor, constant: 100).isActive = true
        princeRoom.leadingAnchor.constraint(equalTo: imageRoom1.trailingAnchor, constant: 10).isActive = true
        princeRoom.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 10).isActive = true
        princeRoom.heightAnchor.constraint(equalToConstant: 14 * 1.5).isActive = true
////
      
        
        self.addSubview(reductionLabel)
        reductionLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 150).isActive = true
        reductionLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 100).isActive = true
        reductionLabel.widthAnchor.constraint(equalTo: imageRoom1.widthAnchor, multiplier: 1/2).isActive = true
        reductionLabel.heightAnchor.constraint(equalTo: imageRoom1.widthAnchor, multiplier: 1/5).isActive = true
        
        self.addSubview(numberBox)
            numberBox.topAnchor.constraint(equalTo: self.topAnchor, constant: 150).isActive = true
            numberBox.leftAnchor.constraint(equalTo: reductionLabel.leftAnchor, constant: 50).isActive = true
            numberBox.widthAnchor.constraint(equalTo: imageRoom1.widthAnchor, multiplier: 1/2).isActive = true
            numberBox.heightAnchor.constraint(equalTo: imageRoom1.widthAnchor, multiplier: 1/5).isActive = true
                     

        self.addSubview(increaseButton)
              increaseButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 150).isActive = true
              increaseButton.leftAnchor.constraint(equalTo: numberBox.leftAnchor, constant: 50).isActive = true
              increaseButton.widthAnchor.constraint(equalTo: imageRoom1.widthAnchor, multiplier: 1/2).isActive = true
              increaseButton.heightAnchor.constraint(equalTo: imageRoom1.widthAnchor, multiplier: 1/5).isActive = true
    }
    @objc func increase() {
                self.box += 1
                numberBox.text = String(self.box)
            }
    
    @objc func decrease() {
                if self.box > 0 {
                    self.box -= 1
               numberBox.text = String(self.box)
            }

}
}
