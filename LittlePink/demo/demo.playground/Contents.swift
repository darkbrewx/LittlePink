import UIKit

var greeting = "Hello, playground"


class SomeVC{
    func getData(finished: @escaping (String) -> ()){
        print("sadsa")
        DispatchQueue.global().async {
            DispatchQueue.main.asyncAfter(deadline: .now()+2 ){
                finished("woshidata")
            }
        }
        print("jieshu")
    }
}

let someVC = SomeVC()
someVC.getData { Data in
    print("sad")
}
