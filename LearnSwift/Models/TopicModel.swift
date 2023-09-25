//
//  TopicModel.swift
//  LearnSwift
//
//  Created by Куат Оралбеков on 25.09.2023.
//

import Foundation

struct Topic {
    
    let number: String
    
    let name: String
    
    let description: String
    
    var isPassed: Bool
    
    let text: String
    
    let questions: [Question]
    
}

struct Question {
    
    let text: String
    
    let answers: [Answer]
    
}

struct Answer {
    
    let text: String
    
    let isCorrect: Bool
    
}
