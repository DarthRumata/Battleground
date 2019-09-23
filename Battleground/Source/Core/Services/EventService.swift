//
//  EventService.swift
//  Battleground
//
//  Created by Stas Kirichok on 15-06-2019.
//  Copyright © 2019 Stas Kirichok. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol Event {}

class EventService {

    static let shared = EventService()

    private let eventBus = PublishSubject<Event>()

    private init() {}

    func sendEvent<T: Event>(_ event: T) {
        eventBus.onNext(event)
    }

    func listenEvent<T: Event>() -> Driver<T> {
        return eventBus
            .asSkipErrorDriver()
            .flatMap { event -> Driver<T> in
                if let event = event as? T {
                    return Driver.just(event)
                }

                return .never()
        }
    }

}
