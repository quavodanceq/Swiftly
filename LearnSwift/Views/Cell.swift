//
//  Cell.swift
//  LearnSwift
//
//  Created by Куат Оралбеков on 25.09.2023.
//

import Foundation
import UIKit
import SnapKit

class Cell: UITableViewCell {
    
    var topic: Topic?
    
    private let nameLabel = UILabel()
    
    private let descriptionLabel = UILabel()
    
    private let numberLabel = UILabel()
    
    private let passedimageView = UIImageView()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    func setup() {
        
        setupNameLabel()
        setupDescriptionLabel()
        setupNumberLabel()
        setupImageView()
        setupConstraints()
    }
    
    private func setupNameLabel() {
        
        addSubview(nameLabel)
        nameLabel.text = topic?.name
        nameLabel.font = UIFont(name: "Georgia-Bold", size: 20)
        nameLabel.textColor = .black
        nameLabel.numberOfLines = 0
    }
    
    private func setupDescriptionLabel() {
        
        addSubview(descriptionLabel)
        descriptionLabel.text = topic?.description
        descriptionLabel.font = UIFont(name: "Georgia-Bold", size: 18)
        descriptionLabel.textColor = .gray
        descriptionLabel.numberOfLines = 0
    }
    
    private func setupNumberLabel() {
        
        addSubview(numberLabel)
        numberLabel.text = topic?.number
        numberLabel.textColor = .black
        numberLabel.font = UIFont(name: "Georgia-Bold", size: 40)
    }
    
    private func setupImageView() {
        
        if topic!.isPassed {
            addSubview(passedimageView)
            passedimageView.tintColor = UIColor.black
            passedimageView.image = UIImage(systemName: "checkmark.seal.fill")
        }
    }
    
    private func setupConstraints() {
        
        numberLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            make.height.equalToSuperview().multipliedBy(0.8)
            make.width.equalToSuperview().multipliedBy(0.1)
        }
        
        if topic!.isPassed {
            
            passedimageView.snp.makeConstraints { make in
                make.trailing.equalToSuperview().offset(-10)
                make.centerY.equalToSuperview()
                make.width.equalToSuperview().multipliedBy(0.08)
                make.height.equalTo(passedimageView.snp.width)
            }
            
            nameLabel.snp.makeConstraints { make in
                make.top.equalToSuperview().offset(10)
                make.leading.equalTo(numberLabel.snp.trailing).offset(10)
                make.trailing.equalTo(passedimageView.snp.leading).offset(-10)
            }
            
            descriptionLabel.snp.makeConstraints { make in
                make.top.equalTo(nameLabel.snp.bottom).offset(5)
                make.leading.equalTo(numberLabel.snp.trailing).offset(10)
                make.trailing.equalTo(passedimageView.snp.leading).offset(-5)
                make.bottom.equalToSuperview().offset(-10)
            }

            
        } else {
            nameLabel.snp.makeConstraints { make in
                make.top.equalToSuperview().offset(10)
                make.leading.equalTo(numberLabel.snp.trailing).offset(10)
                make.trailing.equalToSuperview().offset(-10)
            }
            
            descriptionLabel.snp.makeConstraints { make in
                make.top.equalTo(nameLabel.snp.bottom).offset(5)
                make.leading.equalTo(numberLabel.snp.trailing).offset(10)
                make.trailing.equalToSuperview().offset(-10)
                make.bottom.equalToSuperview().offset(-10)
            }
        }
        
        
        
        
    }
    
}
