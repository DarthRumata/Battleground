//
//  WelcomeViewModel.swift
//  Battleground
//
//  Created by Stas Kirichok on 01-06-2019.
//  Copyright © 2019 Stas Kirichok. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

extension WelcomeViewModel {
    struct Input {

    }
    struct Output {
    }
}

class WelcomeViewModel: ViewModelInterface {

    let output: Output
    let input = Input()

    // Dependencies
    private let userRepository: UsersRepository
    private let eventService: EventService

    // State
    private let disposeBag = DisposeBag()

    init(userRepository: UsersRepository, eventService: EventService) {
        self.userRepository = userRepository
        self.eventService = eventService
        output = Output()

        configureRx()
    }

}

private extension WelcomeViewModel {

    func configureRx() {
        userRepository.getCurrentUser().debug()
            .subscribe(onSuccess: { user in
                print(user)
            }, onError: { [weak self] error in
                print(error)
                self?.eventService.sendEvent(WelcomeEvents.ToCreateCharacterFlow())
            })
            .disposed(by: disposeBag)
    }

}
