import UIKit

//ARC(Automatic Reference Counting)-自动引用计数
//内存管理机制

//Reference Cycle-循环引用
class Author{
    var name: String
    weak var video: Video?
    init(name: String) {
        self.name = name
    }
    deinit {
        print("author被销毁了")
    }
}

class Video{
    unowned var author: Author
    init(author: Author){
        self.author = author
    }
    deinit {
        print("video被销毁了")
    }
}

var author: Author? = Author(name: "HWB")
var video: Video? = Video(author: author!)
author?.video = video


author = nil
video = nil


// MARK: - 捕获列表CaptureList--闭包循环引用的解决方案
//1.普通闭包

class HTMLElement {
    let name: String
    let text: String?
    
    lazy var asHTML: () -> String = {
        [unowned self] in
        if let text = self.text{
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name)/>"
        }
    }
    
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    
    deinit{
        print("\(name) is being deinitialized")
    }
}

var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello, world")
print(paragraph!.asHTML())// print
paragraph = nil
