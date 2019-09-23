//
//  ViewController.swift
//  Battleground
//
//  Created by Stas Kirichok on 16-05-2019.
//  Copyright © 2019 Stas Kirichok. All rights reserved.
//

import UIKit
import Reusable
import SkyFloatingLabelTextField
import RxSwift

class CharacterCreationViewController: UIViewController, StoryboardBased {

    var viewModel: CharacterCreationViewModel!

    @IBOutlet private weak var nicknameField: SkyFloatingLabelTextField!
    @IBOutlet private weak var emailField: SkyFloatingLabelTextField!
    @IBOutlet private weak var characterCreationButton: UIButton!

    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        configureBindings()
    }


}

private extension CharacterCreationViewController {

    func configureBindings() {
        nicknameField.rx.text
            .asDriver()
            .drive(viewModel.input.onChangeNickname)
            .disposed(by: disposeBag)
        emailField.rx.text
            .asDriver()
            .drive(viewModel.input.onChangeEmail)
            .disposed(by: disposeBag)
        characterCreationButton.rx.tap
            .asDriver()
            .drive(viewModel.input.onTapCreate)
            .disposed(by: disposeBag)

        viewModel.output.isCreationButtonEnabled
            .drive(characterCreationButton.rx.isEnabled)
            .disposed(by: disposeBag)
    }

}

