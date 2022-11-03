//
//  PaymentDetailsModel.swift
//  PaymentDiffableDataSource
//
//  Created by Patrick on 28.10.2022..
//

import Foundation

struct PaymentDetailsModel: Hashable {
    var id: UUID
    var title: String
    var price: String
    var currency: String

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension PaymentDetailsModel: Equatable {
    static func ==(lhs: PaymentDetailsModel, rhs: PaymentDetailsModel) -> Bool {
        return lhs.id == rhs.id && lhs.title == rhs.title && lhs.price == rhs.price && lhs.currency == rhs.currency
    }
}
