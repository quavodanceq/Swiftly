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
    
    private var codeTask: CodePractice?
    
    private let taskLabel = UILabel()
    
    private let codeTextView = UITextView()
    
    convenience init(code: CodePractice) {
        
        self.init()
        self.codeTask = code
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupTaskLabel()
        setupTextView()
        setupNavigation()
        setupConstraints()
        print(codeTask!.correctCode)
    }
    
    private func setupNavigation() {
        finishButton.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.black], for: .normal)
        finishButton.isEnabled = false
        navigationController?.navigationBar.tintColor = .black
        navigationItem.backBarButtonItem?.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.black], for: .normal)
        navigationItem.rightBarButtonItem = finishButton
    }
    
    @objc private func finishButtonTapped() {
        
        print(123)
    }
    
    private func setupTaskLabel() {
        
        view.addSubview(taskLabel)
        taskLabel.text = codeTask!.text
        taskLabel.font = UIFont(name: "Copperplate-Bold", size: 19)
        taskLabel.textColor = .black
        taskLabel.numberOfLines = 0
    }
    
    private func setupTextView() {
        
        view.addSubview(codeTextView)
        codeTextView.backgroundColor = .codeEditorBackgroundColor
        codeTextView.delegate = self
        let highlightr = Highlightr()
        highlightr?.setTheme(to: "xcode")
        let swiftCode = "print(123)"
        codeTextView.attributedText = highlightr!.highlight(swiftCode, as: "swift")
        codeTextView.autocapitalizationType = .none
        codeTextView.font = UIFont(name: "TamilSangamMN-Bold", size: 23)
    }
    
    
    
    private func setupConstraints() {
        
        taskLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.centerX.equalToSuperview()
        }
        
        codeTextView.snp.makeConstraints { make in
            make.top.equalTo(taskLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview()
        }
        
       
    }
}

extension CodeViewController: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        
        let highlightr = Highlightr()
        highlightr?.setTheme(to: "xcode")
        codeTextView.attributedText = highlightr!.highlight(textView.text, as: "swift")
        codeTextView.font = UIFont(name: "TamilSangamMN-Bold", size: 23)
        if textView.text == codeTask!.correctCode {
            finishButton.isEnabled = true
        }
    }
}
