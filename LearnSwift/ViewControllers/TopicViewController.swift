//
//  TopicViewController.swift
//  LearnSwift
//
//  Created by Куат Оралбеков on 26.09.2023.
//

import Foundation
import UIKit
import SnapKit

class TopicViewController: UIViewController {
    
    private let textLabel = UITextView()
    
    private let scrollView = UIScrollView()
    
    convenience init(title: String,text: String) {
        self.init()
        textLabel.text = text
        self.title = title
    }
    
    override func viewDidLayoutSubviews() {
        textLabel.setContentOffset(.zero, animated: true)
    }
    
    override func viewDidLoad() {
        
        
        //scrollView.isScrollEnabled = true
        view.backgroundColor = .white
        setupLabel()
        setupConstraints()
    }
    
    private func setupLabel() {
        
        view.addSubview(textLabel)
        textLabel.textColor = .black
        textLabel.isEditable = false
        textLabel.isSelectable = false
        textLabel.showsVerticalScrollIndicator = false
        textLabel.font = UIFont(name: "GillSans-SemiBold", size: 19)
    }
    
    private func setupConstraints() {
        
        textLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalToSuperview().offset(5)
            make.trailing.equalToSuperview().offset(-5)
            make.bottom.equalToSuperview()
        }
    }
    
}
