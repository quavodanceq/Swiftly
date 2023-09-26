//
//  CodeViewController.swift
//  LearnSwift
//
//  Created by Куат Оралбеков on 26.09.2023.
//

import UIKit
import Highlightr
import SnapKit

class SyntaxHighlightViewController: UIViewController {
    
    private let taskLabel = UILabel()
    
    private var correctCode: String = ""

    private let codeTextView = UITextView()
    
    private let button = UIButton()
    
    convenience init(taskString: String, correctCode:String) {
        self.init()
        self.taskLabel.text = taskString
        self.correctCode = correctCode
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Create a Highlightr instance
        let highlightr = Highlightr()

        // Set the theme (e.g., "xcode")
        highlightr?.setTheme(to: "xcode")

        // Swift code to highlight
        let swiftCode = "print(123)"

        codeTextView.attributedText = highlightr!.highlight(swiftCode, as: "swift")
        view.addSubview(codeTextView)
        setupButton()
        setupConstraints()
    }
    
    private func setupButton() {
        
        view.addSubview(button)
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc private func buttonTapped() {
        print(codeTextView.text)
    }
    
    private func setupConstraints() {
        codeTextView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        button.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-50)
            make.centerX.equalToSuperview()
        }
    }
}
