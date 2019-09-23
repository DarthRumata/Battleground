//
//  WelcomeViewController.swift
//  Battleground
//
//  Created by Stas Kirichok on 19-05-2019.
//  Copyright © 2019 Stas Kirichok. All rights reserved.
//

import Foundation
import Reusable
import RxSwift

class WelcomeViewController: UIViewController, StoryboardBased {

    var viewModel: WelcomeViewModel!

    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        configureRx()
    }
    
}

private extension WelcomeViewController {

    func configureRx() {
      
    }

}
