import UIKit

func codingSwift(day: Int, appName: String, res: (Int, String) -> String){
    print("学习Swift\(day)天了,\(res(1, "Alamofire")),做成了\(appName)App")
}

codingSwift(day: 40, appName: "天气") { takeDay, use in
    "花了\(takeDay)天,使用了\(use)技术"
}
