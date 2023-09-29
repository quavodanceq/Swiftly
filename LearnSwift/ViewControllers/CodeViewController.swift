//
//  CodeViewController.swift
//  LearnSwift
//
//  Created by Куат Оралбеков on 26.09.2023.
//

import UIKit
import Highlightr
import SnapKit

class CodeViewController: UIViewController {
    
    private let finishButton = UIBarButtonItem(title: "Finish", style: .plain, target: self, action: #selector(finishButtonTapped))
    
    private var topic: Topic?
    
    private let taskLabel = UILabel()
    
    private let codeTextView = UITextView()
    
    convenience init(topic: Topic) {
        self.init()
        self.topic = topic
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupTaskLabel()
        setupTextView()
        setupNavigation()
        setupConstraints()
    }
    
    private func setupNavigation() {
        finishButton.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.black], for: .normal)
        finishButton.isEnabled = false
        navigationController?.navigationBar.tintColor = .black
        navigationItem.backBarButtonItem?.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.black], for: .normal)
        navigationItem.rightBarButtonItem = finishButton
    }
    
    @objc private func finishButtonTapped() {
        
        UDManager.shared.passed(topicNumber: topic!.number)
        UIApplication.shared.popToMainVC()
    }
    
    private func setupTaskLabel() {
        
        view.addSubview(taskLabel)
        taskLabel.text = topic!.practice!.text
        taskLabel.font = UIFont(name: "Copperplate-Bold", size: 19)
        taskLabel.textColor = .black
        taskLabel.numberOfLines = 0
        taskLabel.textAlignment = .center
    }
    
    private func setupTextView() {
        
        view.addSubview(codeTextView)
        codeTextView.backgroundColor = .codeEditorBackgroundColor
        codeTextView.delegate = self
        let highlightr = Highlightr()
        
        highlightr?.setTheme(to: "xcode")
        codeTextView.attributedText = highlightr!.highlight(topic!.practice!.initialCode, as: "swift")
        codeTextView.autocapitalizationType = .none
        codeTextView.font = UIFont(name: "TamilSangamMN-Bold", size: 23)
        codeTextView.layer.cornerRadius = 15
        codeTextView.layer.cornerCurve = .continuous
    }
    
    
    
    private func setupConstraints() {
        
        taskLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        codeTextView.snp.makeConstraints { make in
            make.top.equalTo(taskLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview().offset(-20)
        }
        
       
    }
}

extension CodeViewController: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        
        let highlightr = Highlightr()
        highlightr?.setTheme(to: "xcode")
        codeTextView.attributedText = highlightr!.highlight(textView.text, as: "swift")
        codeTextView.font = UIFont(name: "TamilSangamMN-Bold", size: 23)
        if textView.text == topic!.practice!.correctCode {
            finishButton.isEnabled = true
        }
    }
}
