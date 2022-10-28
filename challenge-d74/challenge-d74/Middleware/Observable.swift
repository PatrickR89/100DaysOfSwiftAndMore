//
//  Observable.swift
//  challenge-d74
//
//  Created by Patrick on 18.08.2022..
//

import UIKit

class Observable<T> {
    var value: T? {
        didSet {
            valueDidChange()
        }
    }

    init(_ value: T?) {
        self.value = value
    }

//    private var listener: ((T?) -> Void)
    private var listeners : [((T?) -> Void)] = []

    func bind(_ listener: @escaping (T?) -> Void) {
        listener(value)
//        self.listener = listener
        self.listeners.append(listener)
        valueDidChange()
    }

    private func valueDidChange() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self, let value = self.value else {return}
            self.listeners.forEach {
                $0(value)
            }
//            listener(self.value)
        }
    }
}
