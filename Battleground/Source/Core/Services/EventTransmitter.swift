//
//  EventTransmitter.swift
//  Battleground
//
//  Created by Stas Kirichok on 01-06-2019.
//  Copyright © 2019 Stas Kirichok. All rights reserved.
//

import Foundation
import RxSwift

protocol DispatchedEvent {

}

class EventTransmitter {

    private static let eventDispatcher = PublishSubject<DispatchedEvent>()

    var onDispatchEvent: AnyObserver<DispatchedEvent> {
        return EventTransmitter.eventDispatcher.asObserver()
    }

}
