//
//  TopicsManager.swift
//  LearnSwift
//
//  Created by Куат Оралбеков on 25.09.2023.
//

import Foundation

class TopicsManager {
    
    private init() {}
    
    static let shared = TopicsManager()
    
    func get() -> [Topic] {
        var topics = [Topic]()
        let topic1 = Topic(number: "1", name: "Introduction", description: "Introductory information about the language", isPassed: UserDefaults.standard.bool(forKey: "topic1"), text: "Swift is a new programming language for developing applications for iOS, macOS, watchOS and tvOS. Despite this, many parts of Swift may be familiar to you from your experience of developing in C and Objective-C. Swift provides its own versions of the fundamental C and Objective-C types, including Int for integers, Double and Float for floating-point values, Bool for Boolean values, String for text. Swift also provides powerful versions of the three main collection types, Array, Set, and Dictionary, as described in the Collection Types section. Like C, Swift uses variables to store and access values by a unique name. Swift also makes extensive use of variables whose values cannot be changed. They are known as constants, and are much more powerful than constants in C. Constants are used everywhere in Swift to make the code safer and cleaner in cases where you are working with values that should not change. In addition to the familiar types, Swift includes extended types that are not present in Objective-C. These include tuples that allow you to create and pass groups of values. Tuples can return multiple values from a function as a single integer value. Swift also includes optional types that allow you to work with missing values. Optional values say either 'there is a value here, and it is equal to x', or 'there is no value at all'. Optional types are similar to using nil with pointers in Objective-C, but they work with all types, not just classes. Optional values are safer and more expressive than nil pointers in Objective-C, and are at the heart of many of Swift's most powerful features. Swift is a type-safe language, which means Swift helps you understand what types of values your code can work with. If a piece of your code expects a String, type security will prevent you from passing it an Int by mistake. In addition, type safety will prevent you from accidentally passing an optional String to a piece of code that expects a non-optional String. Type safety allows you to catch and fix bugs as early as possible in the development process. I hope you find these variations helpful in choosing the perfect name for your premium watch shop!",
                           questions: [Question(text: "", answers: [Answer(text: "", isCorrect: true)])], practice: CodePractice(text: "Write hello world program", correctCode: "print(hello)"))
        topics.append(topic1)
        return topics
    }
    
}
