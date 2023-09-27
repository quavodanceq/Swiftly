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
    
    private var topic: Topic?
    
    private let textLabel = UITextView()
    
    convenience init(topic: Topic) {
        self.init()
        self.topic = topic
        
    }
    
    override func viewDidLayoutSubviews() {
        textLabel.setContentOffset(.zero, animated: true)
    }
    
    override func viewDidLoad() {
 
        view.backgroundColor = .white
        setupNavigaton()
        setupLabel()
        setupConstraints()
    }
    
    private func setupNavigaton() {
        title = topic!.name
        let button = UIBarButtonItem(title: "Go to test", style: .plain, target: self, action: #selector(buttonTapped))
        button.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.black], for: .normal)
        navigationController?.navigationBar.tintColor = .black  
        navigationItem.backBarButtonItem?.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.black], for: .normal)
        navigationItem.rightBarButtonItem = button
    }
    
    
    
    @objc private func buttonTapped() {
        self.navigationController?.pushViewController(CodeViewController(code: topic!.practice), animated: true)
    }
    
    private func setupLabel() {
        
        view.addSubview(textLabel)
        textLabel.text = topic!.text
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
