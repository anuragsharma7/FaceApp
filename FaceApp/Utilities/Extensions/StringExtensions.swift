//
//  StringExtensions.swift
//  FaceApp
//
//  Created by Anurag Sharma on 22/12/20.
//

import Foundation
import UIKit

// MARK:- String Extension
extension String {
    
    static let NA = "N/A"
    static let EMPTY = ""
    
    var intValue: Int64 {
        return (Int64)(self) ?? 0
    }
    var floatValue: Float {
        return (Float)(self) ?? 0.0
    }
    var cgFloatValue: CGFloat {
        return (CGFloat)(floatValue)
    }
    var doubleValue: Double {
        return (Double)(self) ?? 0.0
    }
    var parseDoubleValue: Double {
        var stringArray = self.components(separatedBy: CharacterSet.decimalDigits.inverted)
        stringArray.removeAll{$0 == ""}
        let value = stringArray.joined(separator: ".")
        return (Double)(value) ?? 0.0
    }
    
    var boolValue: Bool {
        switch self.lowercased() {
            case "true", "yes", "1":
                return true
            case "false", "no", "0":
                return false
            default:
                return false
        }
    }
    
    var numberOnly: String {
        return self.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
    }
  
    var utcStringToUnix:TimeInterval {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        if let utcDate = dateFormatter.date(from: self) {
            return utcDate.timeIntervalSince1970
        }
        return 0
    }
    
    var trimmed: String {
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
    func capitalizingFirstLetter() -> String {
        return prefix(1).uppercased() + dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
    
    /// Checking if the string is empty without containing whitespace or new line
    func isEmpty() -> Bool {
        return (self.trimmed.count == 0)
    }
    
    mutating func trimSpaces() {
        self = self.trimmingCharacters(in: .whitespaces)
    }
    
    mutating func trimNewLines() {
        self = self.trimmingCharacters(in: .newlines)
    }
    
    mutating func trimSpacesAndNewLines() {
        self = self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    mutating func removeSpaces() {
        self = self.replacingOccurrences(of: " ", with: "")
    }
    
    mutating func removeNewLines() {
        self = self.replacingOccurrences(of: "\n", with: "")
    }
    
    mutating func removeSpacesAndNewLines() {
        self.removeSpaces()
        self.removeNewLines()
    }
    
    func containsAlphabetsOnly() -> Bool {
        let alphabets = "abcdefghijklmnopqrstuvwxyz"
        let unwantedCharacters = NSCharacterSet(charactersIn: String(format: "%@%@", alphabets, alphabets.uppercased())).inverted
        let result = (self as NSString).rangeOfCharacter(from: unwantedCharacters).location == NSNotFound
        return result
    }
    
    func decimalPad(separator decimalSeparator: String) -> Bool {
        let alphabets = "0123456789" + decimalSeparator
        let unwantedCharacters = NSCharacterSet(charactersIn: String(format: "%@%@", alphabets, alphabets.uppercased())).inverted
        let result = (self as NSString).rangeOfCharacter(from: unwantedCharacters).location == NSNotFound
        return result
    }
    
    func containsNumericsOnly() -> Bool {
        let numerics = "0123456789"
        let unwantedCharacters = NSCharacterSet(charactersIn: String(format: "%@%@", numerics, numerics.uppercased())).inverted
        let result = (self as NSString).rangeOfCharacter(from: unwantedCharacters).location == NSNotFound
        return result
    }
    
    var asciiArray: [UInt32] {
        return unicodeScalars.filter{$0.isASCII}.map{$0.value}
    }
    
    /// Will give an array of all words
    var byWords: [String] {
        var byWords:[String] = []
        enumerateSubstrings(in: startIndex..<endIndex, options: .byWords) {word, substringRange, enclosingRange,_ in
            guard let word = word else { return }
            byWords.append(word)
        }
        return byWords
    }
    
    /// first max words
    func firstWords(_ max: Int) -> [String] {
        return Array(byWords.prefix(max))
    }
    
    /// First word only
    var firstWord: String {
        return byWords.first ?? ""
    }
    
    /// Last max words
    func lastWords(_ max: Int) -> [String] {
        return Array(byWords.suffix(max))
    }
    
    /// Last word only
    var lastWord: String {
        return byWords.last ?? ""
    }
    
    func rangeOf(_ str: String) -> NSRange {
        return (self as NSString).range(of: str)
    }
    
    func isValidPhoneNumber() -> Bool {
        let phoneNumberRegex = "^((\\+)|(00))[0-9]{6,14}$"
        
        //let phoneNumberRegex = "^[+]?(?:[0-9]{2})?[0-9]{10}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", phoneNumberRegex)
        return predicate.evaluate(with: self)
    }
    
    func isValidEmail() -> Bool {
        let phoneNumberRegex = "\\A[A-Za-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\z"
        let predicate = NSPredicate(format: "SELF MATCHES %@", phoneNumberRegex)
        return predicate.evaluate(with: self.lowercased())
    }
    
    func isValidName() -> Bool {
        let phoneNumberRegex = "^[\\p{L} .'-]+$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", phoneNumberRegex)
        return predicate.evaluate(with: self)
    }
    
    func isValidPassword() -> Bool {
         let pwdRegex = "^(?=.*[0-9])(?=.*[A-Z])(?=.*[])(?=\\S+$).{4,}$"
        
        /// only for this app regex
        // let pwdRegex = "\\w{6,10}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", pwdRegex)
        return predicate.evaluate(with: self)
    }
    
    func isValidTime() -> Bool {
        let timeRegex = "^[0-9]{2}:[0-9]{2} (AM|PM|am|pm)"
        let predicate = NSPredicate(format: "SELF MATCHES %@", timeRegex)
        return predicate.evaluate(with: self)
    }
    
    func isValidCharacterInput() -> Bool {
        let timeAplhabet = "0123456789: ampm"
        let unwantedCharacters = NSCharacterSet(charactersIn: String(format: "%@%@", timeAplhabet, timeAplhabet.uppercased())).inverted
        let result = (self as NSString).rangeOfCharacter(from: unwantedCharacters).location == NSNotFound
        return result
    }
    
    func isValidUrl() -> Bool {
        let regex = "^(https?://)?(www\\.)?([-a-z0-9]{1,63}\\.)*?[a-z0-9][-a-z0-9]{0,61}[a-z0-9]\\.[a-z]{2,6}(/[-\\w@\\+\\.~#\\?&/=%]*)?$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return predicate.evaluate(with: self)
    }
    
    static func customRandomId(ofLength length: Int, appendTimeStamp: Bool) -> String {
        let alphabets = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        var str = ""
        for _ in 0..<length {
            let randomIndex = Int(arc4random())%alphabets.count
            let alphabet = (alphabets as NSString).character(at: randomIndex)
            str.append(String(format: "%c", alphabet))
        }
        if appendTimeStamp {
            let currentTime = Date().timeIntervalSince1970 * 1000
            str.append(String(format: "%.0f", currentTime))
        }
        return str
    }
    
    static func randomId() -> String {
        return String.customRandomId(ofLength: 8, appendTimeStamp: true)
    }
    
    func size(withConstrainedWidth width: CGFloat, font: UIFont) -> CGSize {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: [.usesLineFragmentOrigin, .usesFontLeading] , attributes: [.font : font], context: nil)
        return boundingBox.size
    }
    
    func size(heightConstrainedWidth height: CGFloat, font: UIFont) -> CGSize {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: [.usesLineFragmentOrigin, .usesFontLeading] , attributes: [.font : font], context: nil)
        return boundingBox.size
    }
    
    func defaultIfEmpty(_ _default: String) -> String {
        if self.isEmpty() { return _default}
        else { return self }
    }
    
    func convertStringToDictionary() -> [String: Any]? {
        if let data = self.data(using: String.Encoding.utf8) {
            do {
                let dict = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any]
                return dict
            } catch {
                //                print("Something went wrong")
            }
        }
        return nil
    }
    
    func heightWithConstrainedWidth(width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: [.usesLineFragmentOrigin, .usesFontLeading], attributes: [NSAttributedString.Key.font: font], context: nil)
        return boundingBox.height
    }
    
    var phoneNumberFormat: String {
        
        let number = self.numberOnly
        
        // let mask = "+X (XXX) XXX-XXXX"
        // let mask = "(XXX) XXX-XXXX" // US format
        let mask = "XXX-XXX-XXXX"
        
        var areaCode = ""
        var phoneNumber = number
        if number.count > 10 {
            let startIndex = number.index(number.startIndex, offsetBy: 0)
            let endIndex = number.index(number.startIndex, offsetBy: number.count - 10)
            
            // Separate the area code from total
            areaCode = String(number[startIndex..<endIndex])
            
            // Separate the phone number from total
            phoneNumber = String(number[endIndex...])
        }
        
        let cleanPhoneNumber = phoneNumber
        var result = ""
        var index = cleanPhoneNumber.startIndex
        for ch in mask where index < cleanPhoneNumber.endIndex {
            if ch == "X" {
                result.append(cleanPhoneNumber[index])
                index = cleanPhoneNumber.index(after: index)
            } else {
                result.append(ch)
            }
        }
        
        if areaCode.count > 0 {
            result = "+\(areaCode) \(result)"
        }
        
        return result
    }
    
    var distanceFormat: String {
        
        let number = self.numberOnly
        
        let formatter = NumberFormatter()
        formatter.groupingSeparator = ","
        formatter.groupingSize = 3
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .none
        formatter.locale = Locale.current
        var str = formatter.string(from: NSNumber(value: number.doubleValue)) ?? String.EMPTY
        if str == "0" {
            str = String.EMPTY
        }
        return str
    }
    
    var currencyFormat: String {
        let number = self.numberOnly
        
        let formatter = NumberFormatter()
        formatter.groupingSeparator = ","
        formatter.groupingSize = 3
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .none
        formatter.locale = Locale.current
        var str = formatter.string(from: NSNumber(value: number.doubleValue)) ?? String.EMPTY
        if str == "0" {
            str = String.EMPTY
        }
        return str
    }
    
    var remove0IfInt: String {
        return self.replacingOccurrences(of: ".0", with: "")
    }
    
    var appendStNdRdTh: String {
        let lastChar = String(self.last ?? Character(""))
        if self.intValue >= 4 && self.intValue <= 20 {
            return self + "th"
        }
        if lastChar == "1" {
            return self + "st"
        }
        else if lastChar == "2" {
            return self + "nd"
        }
        else if lastChar == "3" {
            return self + "rd"
        }
        else {
            return self + "th"
        }
    }
}
