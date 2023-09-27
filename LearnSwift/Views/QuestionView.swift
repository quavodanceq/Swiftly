//
//  QuestionView.swift
//  LearnSwift
//
//  Created by Куат Оралбеков on 26.09.2023.
//

import Foundation
import UIKit

class QuestionView: UIView {
    
    
    
    convenience init(question: Question) {
        self.init()
    }
    
    private let questionText = UILabel()
    
    private let answer1 = UIButton()
    
    private let answer2 = UIButton()
    
    private let answer3 = UIButton()
    
    private let answer4 = UIButton()
    
}
