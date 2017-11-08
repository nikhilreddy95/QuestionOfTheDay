//
//  QuestionOfTheDay.swift
//  QuestionOfTheDay
//
//  Created by Kankanala,Nikhil Reddy on 11/7/17.
//

import Foundation
import UIKit

@objcMembers class QuestionOfTheDay: NSObject {
    
    var question:String?
    
    var answer0:String?
    var answer1:String?
    var answer2:String?
    
    var objectId:String?
    var created:NSDate?
    var updated:NSDate?
    
    init(question:String, answer0:String, answer1: String, answer2: String){
        self.question = question
        self.answer0 = answer0
        self.answer1 = answer1
        self.answer2 = answer2
        
    }
    
    convenience override init(){
        self.init(question: "Ios Mobile computing is ", answer0: "Awesome",answer1: "Not so good", answer2: "Bad")
    }
    
}

