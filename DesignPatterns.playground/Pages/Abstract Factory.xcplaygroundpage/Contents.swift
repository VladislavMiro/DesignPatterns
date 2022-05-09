//MARK: Опсание
/*
 Абстрактная фабрика — это порождающий паттерн проектирования, который позволяет создавать семейства связанных объектов,
 не привязываясь к конкретным классам создаваемых объектов.
*/

import Foundation

//MARK: Протоколы описывающие классы продуктов

protocol ProductProtocol {
    var price: Int { get set }
    var name: String { get set }
}

protocol LaptopProtocol: ProductProtocol {
    var screenSize: Float { get set }
    var weight: Float { get set }
}

protocol SmartPhoneProtocol: ProductProtocol {
    var screenSize: Float { get set }
    var memorySize: Float { get set }
    
    init(name: String, price: Int, screenSize: Float, memorySize: Float)
}

//MARK: Протокол описывающий класс абстрактной фабрики

protocol AbstractFactoryProtocol {
    func createLaptop() -> LaptopProtocol
    func createSmartphone() -> SmartPhoneProtocol
}

//MARK: Классы реализующие протоколы продуктов
final class CheapSmartPhone: SmartPhoneProtocol {
    
    public var screenSize: Float = 0.0
    public var memorySize: Float
    public var price: Int
    public var name: String
    
    init(name: String, price: Int, screenSize: Float, memorySize: Float) {
        self.name = name
        self.price = price
        self.screenSize = screenSize
        self.memorySize = memorySize
    }
    
}

final class ExpensiveSmartPhone: SmartPhoneProtocol {
    
    public var screenSize: Float = 0.0
    public var memorySize: Float
    public var price: Int
    public var name: String
    
    init(name: String, price: Int, screenSize: Float, memorySize: Float) {
        self.name = name
        self.price = price
        self.screenSize = screenSize
        self.memorySize = memorySize
    }
    
}

final class CheapLaptop: LaptopProtocol {
    
    public var screenSize: Float
    public var weight: Float
    public var price: Int
    public var name: String
    
    init(name: String, price: Int, screenSize: Float, weight: Float) {
        self.name = name
        self.price = price
        self.screenSize = screenSize
        self.weight = weight
    }
    
}

final class ExpensiveLaptop: LaptopProtocol {
    public var screenSize: Float
    public var weight: Float
    public var price: Int
    public var name: String
    
    init(name: String, price: Int, screenSize: Float, weight: Float) {
        self.name = name
        self.price = price
        self.screenSize = screenSize
        self.weight = weight
    }
    
}

//MARK: Класс реализующий абстрактную фабрику дешевых продуктов

final class CheapProductFactory: AbstractFactoryProtocol {
    
    public func createLaptop() -> LaptopProtocol {
        let laptop = CheapLaptop(name: "CheapLaptop", price: 400, screenSize: 15.0, weight: 2.0)
        return laptop
    }
    
    public func createSmartphone() -> SmartPhoneProtocol {
        let smartPhone = CheapSmartPhone(name: "CheapSmartphone", price: 250, screenSize: 5.5, memorySize: 16)
        return smartPhone
    }
    
}

//MARK: Класс реализующий абстрактную фабрику дорогих продуктов

final class ExpensiveProductFactory: AbstractFactoryProtocol {
    
    public func createLaptop() -> LaptopProtocol {
        let laptop = ExpensiveLaptop(name: "ExpensiveLaptop", price: 900, screenSize: 16.0, weight: 1.5)
        return laptop
    }
    
    public func createSmartphone() -> SmartPhoneProtocol {
        let smartPhone = ExpensiveSmartPhone(name: "ExpensiveSmartphone", price: 600, screenSize: 8.0, memorySize: 128)
        return smartPhone
    }
    
}

//MARK: Применение паттерна

let cheapFactory = CheapProductFactory()
let expensiveFactory = ExpensiveProductFactory()

let cheapSmartPhone = cheapFactory.createSmartphone()
let cheapLaptop = cheapFactory.createLaptop()
let expensiveSmartPhone = expensiveFactory.createSmartphone()
let expensiveLaptop = expensiveFactory.createLaptop()

cheapSmartPhone.name
expensiveSmartPhone.name

cheapLaptop.name
expensiveLaptop.name

//: [Next](@next)
