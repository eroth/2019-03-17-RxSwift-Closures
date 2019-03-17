import UIKit
import PlaygroundSupport
import RxSwift

PlaygroundPage.current.needsIndefiniteExecution = true

let disposeBag = DisposeBag()

func doSomethingRx() -> Observable<String> {
    return Observable.create { observer in
        observer.onNext("observable operation result")

        return Disposables.create()
    }
}

func doSomethingClosure(_ onCompleted: ((String) -> Void)) {
    onCompleted("closure operation result")
}

doSomethingRx()
    .subscribe(onNext: { result in
        print("result: \(result)")
    })
    .disposed(by: disposeBag)

doSomethingClosure { result in
    print("result: \(result)")
}
