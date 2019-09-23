//
//  WindowCoordinator.swift
//  Battleground
//
//  Created by Stas Kirichok on 15-06-2019.
//  Copyright © 2019 Stas Kirichok. All rights reserved.
//

import Foundation
import UIKit

class WindowCoordinator: NavigationCoordinator {

    private unowned let window: UIWindow
    private let eventService = EventService.shared

    init(window: UIWindow) {
        self.window = window

        super.init()

        listenEvents()
    }

    func makeFlow() {
        let controller = WelcomeViewController.instantiate()
        let userRepository = UsersRepository(databaseService: DatabaseService.shared)
        window.rootViewController = controller
        window.makeKeyAndVisible()
        controller.viewModel = WelcomeViewModel(userRepository: userRepository, eventService: eventService)
    }

}

private extension WindowCoordinator {

    func listenEvents() {
        eventService.listenEvent()
            .drive(onNext: { (event: WelcomeEvents.ToCreateCharacterFlow) in
                let controller = CharacterCreationViewController.instantiate()
                let viewModel = CharacterCreationViewModel()
                controller.viewModel = viewModel

                self.window.rootViewController = controller
            })
            .disposed(by: disposeBag)
    }

}
