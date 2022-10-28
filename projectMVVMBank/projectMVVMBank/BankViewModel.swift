//
//  BankViewModel.swift
//  projectMVVMBank
//
//  Created by Patrick on 16.08.2022..
//

import UIKit

class BankViewModel {

    let bank: Bank

    init(with bank: Bank) {
        self.bank = bank
    }

    func bankBalance() -> String {
        return "$\(bank.balance)"
    }
}
