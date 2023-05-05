//: [Previous](@previous)

import Foundation

/*
    Прототип - пораждающий шаблон проектирования. Паттерн создает копию созданного объекта.
*/

//MARK: Реализация паттерна Прототип

protocol CookieProtocol {
    var name: String { get set }
}

protocol Prototype {
    func copy() -> CookieProtocol
}

class Cookie: CookieProtocol, Prototype {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    public func copy() -> CookieProtocol {
        return Cookie(name: self.name)
    }
}

// Приминение паттерна Прототип

var cookie = Cookie(name: "Chocolate cookie")
var cookieArr: [CookieProtocol] = []

for _ in 0...5 {
    cookieArr.append(cookie.copy())
}

cookieArr.forEach { cokie in
    print(cookie.name)
}
//: [Next](@next)
