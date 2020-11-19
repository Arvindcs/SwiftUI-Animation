//
//  String+Ext.swift
//  WidgetApp
//
//  Created by Arvind on 17/11/20.
//  Copyright © 2020 Arvind. All rights reserved.
//

import UIKit

extension String {
    
    func currencyInputFormatting() -> String {
        var number: NSNumber!
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.decimalSeparator = ","
        
        var amountWithPrefix = self
        let expression = try! NSRegularExpression(pattern: "[^0-9]", options: .caseInsensitive)
        amountWithPrefix = expression.stringByReplacingMatches(
            in: amountWithPrefix,
            options: NSRegularExpression.MatchingOptions(rawValue: 0),
            range: NSMakeRange(0, self.count), withTemplate: "")
        
        let double = (amountWithPrefix as NSString).doubleValue
        number = NSNumber(value: double)
        
        guard number != 0 as NSNumber else { return "" }
        return formatter.string(from: number)!
    }
    
    func removeSpacing() -> String {
        var amountWithPrefix = self
        let expression = try! NSRegularExpression(pattern: "[^a-z]", options: .caseInsensitive)
        amountWithPrefix = expression.stringByReplacingMatches(in: amountWithPrefix, options: [], range: NSRange(), withTemplate: "")
        guard amountWithPrefix != " " else { return "" }
        return amountWithPrefix
    }
    
    func removeFormatAmountInt() -> Int {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "en_US")
        formatter.numberStyle = .currency
        formatter.currencySymbol = ""
        formatter.decimalSeparator = ","
        return formatter.number(from: self) as! Int? ?? 0
    }
    
    func removeFormatAmountDouble() -> Double {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "en_US")
        formatter.numberStyle = .currency
        formatter.currencySymbol = ""
        formatter.decimalSeparator = ","
        return formatter.number(from: self) as! Double? ?? 0
    }
    
    func toInt() -> Int {
        return Int(self)!
    }
    
    func toDouble() -> Double {
        return Double(self)!
    }
    
    var containsOnlyDigits: Bool {
        let notDigits = NSCharacterSet.decimalDigits.inverted
        return rangeOfCharacter(from: notDigits, options: .literal, range: nil) == nil
    }
    
    var containsOnlyLetters: Bool {
        let notLetters = NSCharacterSet.letters.union(NSCharacterSet.whitespaces).inverted
        return rangeOfCharacter(from: notLetters, options: .literal, range: nil) == nil
    }
    
    var isAlphanumeric: Bool { //Letters and digits
        let notAlphanumeric = NSCharacterSet.decimalDigits.union(NSCharacterSet.letters).inverted
        return rangeOfCharacter(from: notAlphanumeric, options: .literal, range: nil) == nil
    }
    
    //TODO: - Password
    /*
     ● Minimum 8 characters
     ● At least 1 uppercase alphabet
     ● At least 1 lowercased alphabet
     ● At least 1 number
     ● At least 1 special character
     */
    
    var isPassword: Bool {
        let regex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&._])[A-Za-z\\d$@$!%*?&._]{8,32}"
        let isMatched = NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: self)
        return isMatched
    }
    
    //TODO: - Check email
    
    func matches(_ expression: String) -> Bool {
        if let range = range(of: expression, options: .regularExpression, range: nil, locale: nil) {
            return range.lowerBound == startIndex && range.upperBound == endIndex
            
        } else {
            return false
        }
    }
    
    var isValidEmail: Bool {
        matches("[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
    }
    
    //TODO: - FirstName - LastName
    
    func fetchFirstLastName(completion: @escaping (String, String) -> Void) {
        var components = self.components(separatedBy: " ")
        if components.count > 0 {
            let fn = components.removeFirst()
            let ln = components.joined(separator: " ")
            completion(fn, ln)
        }
    }
    
    //TODO: - Uppercase Alphabet
    var isUppercase: Bool {
        let upperRegEx = ".*[A-Z]+.*"
        let upperTest = NSPredicate(format: "SELF MATCHES %@", upperRegEx)
        let upperResult = upperTest.evaluate(with: self)
        return upperResult
    }
    
    //TODO: - Lowercase Alphabet
    var isLowercase: Bool {
        let lowerRegEx = ".*[a-z]+.*"
        let lowerTest = NSPredicate(format: "SELF MATCHES %@", lowerRegEx)
        let lowerResult = lowerTest.evaluate(with: self)
        return lowerResult
    }
    
    //TODO: - Number
    var isNumber: Bool {
        let numberRegEx = ".*[0-9]+.*"
        let numberTest = NSPredicate(format: "SELF MATCHES %@", numberRegEx)
        let numberResult = numberTest.evaluate(with: self)
        return numberResult
    }
    
    //TODO: - Special Character
    var isSpecialCharacter: Bool {
        let specialCharacterRegEx = ".*[._!&^%$#@()/]+.*"
        let specialCharacterTest = NSPredicate(format: "SELF MATCHES %@", specialCharacterRegEx)
        let specialCharacterResult = specialCharacterTest.evaluate(with: self)
        return specialCharacterResult
    }
    
    var byWords: [SubSequence] {
        var byWords: [SubSequence] = []
        enumerateSubstrings(in: startIndex..., options: .byWords) { (_, range, _, _) in
            byWords.append(self[range])
        }
        
        return byWords
    }
    
    func getHexColor(alpha: CGFloat = 1.0) -> UIColor {
        let scanner = Scanner(string: self)
        var color: UInt64 = 0
        
        if scanner.scanHexInt64(&color) {
            let r = CGFloat((color & 0xFF0000)>>16)/255.0
            let g = CGFloat((color & 0xFF00)>>8)/255.0
            let b = CGFloat(color & 0xFF)/255.0
            return UIColor(red: r, green: g, blue: b, alpha: alpha)
            
        } else {
            return .white
        }
    }
}
