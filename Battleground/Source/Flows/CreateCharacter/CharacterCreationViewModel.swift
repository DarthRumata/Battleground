//
//  CharacterCreationViewModel.swift
//  Battleground
//
//  Created by Stas Kirichok on 09-09-2019.
//  Copyright © 2019 Stas Kirichok. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

extension CharacterCreationViewModel {
    struct Input {
        let onChangeNickname: AnyObserver<String?>
        let onChangeEmail: AnyObserver<String?>
        let onTapCreate: AnyObserver<Void>
    }
    struct Output {
        let isCreationButtonEnabled: Driver<Bool>
    }
}

class CharacterCreationViewModel: ViewModelInterface {

    let input: Input
    let output: Output

    // Handlers
    private let characterCreationHandler = PublishSubject<Void>()

    // State
    private let nicknameStore = BehaviorSubject<String?>(value: nil)
    private let emailStore = BehaviorSubject<String?>(value: nil)

    init() {
        input = Input(
            onChangeNickname: nicknameStore.asObserver(),
            onChangeEmail: emailStore.asObserver(),
            onTapCreate: characterCreationHandler.asObserver()
        )
        output = Output(
            isCreationButtonEnabled: Driver.combineLatest(
                nicknameStore.asSkipErrorDriver(),
                emailStore.asSkipErrorDriver()
                )
                .map { !($0 ?? "").isEmpty && !($1 ?? "").isEmpty }
        )
    }

}
