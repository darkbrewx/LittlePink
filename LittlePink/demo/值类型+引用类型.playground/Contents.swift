import UIKit
import CoreFoundation


let a = 1

//内存两个分块,堆和栈
//指针 = 内存地址

let b = a

struct personS{
    var name = "xiaowang"
    var age = 20
}

let p1 = personS()
var p2 = p1
p2.age = 30
p1.age

class personC{
    var name = "xiaowang"
    var age = 20
}

let p3 = personC()
var p4 = p3
p4.age = 30
p3.age
