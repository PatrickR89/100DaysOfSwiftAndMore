import UIKit

func numUniqueEmails(_ emails: [String]) -> Int {

    var uniqueEmails: Set<String> = []
    var index = 0

    while index < emails.count {
        let currentEmail = Array(emails[index])
        var adressIndex = 0
        var cleanAdress = [Character]()
        var domain = false

        while adressIndex < currentEmail.count {
            if !domain {
                if currentEmail[adressIndex].isLetter {
                    cleanAdress.append(currentEmail[adressIndex])
                    adressIndex += 1
                } else if currentEmail[adressIndex] == Character("+") {
                    adressIndex = currentEmail.firstIndex(of: Character("@"))!
                    cleanAdress.append(currentEmail[adressIndex])
                    domain = true
                    adressIndex += 1
                } else if currentEmail[adressIndex] == Character("@") {
                    cleanAdress.append(currentEmail[adressIndex])
                    domain = true
                    adressIndex += 1
                } else {
                    adressIndex += 1
                }
            } else {

                cleanAdress.append(currentEmail[adressIndex])
                adressIndex += 1
            }
        }

        uniqueEmails.insert(String(cleanAdress))
        index += 1
    }

    return uniqueEmails.count
}


numUniqueEmails(["test.email+alex@leetcode.com","test.e.mail+bob.cathy@leetcode.com","testemail+david@lee.tcode.com"])
