//
//  NavigationCoordinator.swift
//  Battleground
//
//  Created by Stas Kirichok on 15-06-2019.
//  Copyright © 2019 Stas Kirichok. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

class NavigationCoordinator {

    private static var coordinators: [NavigationCoordinator] = []
    private var dependentControllers = NSPointerArray.weakObjects()
    private let identifier = ProcessInfo.processInfo.globallyUniqueString
    let disposeBag = DisposeBag()

    init() {
        NavigationCoordinator.coordinators.append(self)
    }

    func registerDependentController(_ controller: UIViewController) {
        let pointer = Unmanaged.passUnretained(controller).toOpaque()
        dependentControllers.addPointer(pointer)
        controller.rx.deallocated
            .subscribe(onNext: { [weak self] _ in
                guard let self = self else { return }

                self.dependentControllers.compact()
                if self.dependentControllers.count == 0 {
                    NavigationCoordinator.coordinators.removeAll(where: { $0 == self })
                }
            })
            .disposed(by: disposeBag)
    }

}

extension NavigationCoordinator: Equatable {
    static func == (lhs: NavigationCoordinator, rhs: NavigationCoordinator) -> Bool {
        return lhs.identifier == rhs.identifier
    }
}
