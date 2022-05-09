//: [Previous](@previous)

//MARK:Описание
/*
 Фабричный метод — это порождающий паттерн проектирования, который определяет общий интерфейс для создания объектов в суперклассе,
 позволяя подклассам изменять тип создаваемых объектов.
*/

import Foundation

//MARK: Протокол описывающий класс "Продукт"

protocol ProductProtocol {
    var name: String { get set }
    var price: Int { get set }
}

//MARK: Перечисление предназанченное дла класса "Содатель"

enum ProductType {
    case A
    case B
}

//MARK: Протокол описывающий класс "Создатель"

protocol ProductCreatorProtocol {
    //Метод класса, реализующий паттерн "Фабричный метод"
    static func factoryMethod(type: ProductType) -> ProductProtocol
}

//MARK: Классы реализующие протокол "Продукт"

final class ProductA: ProductProtocol {
    var name: String
    var price: Int
    
    required init(name: String, price: Int) {
        self.name = name
        self.price = price
    }
}

final class ProductB: ProductProtocol {
    var name: String
    var price: Int
    
    required init(name: String, price: Int) {
        self.name = name
        self.price = price
    }
}

//MARK: Класс реализующий протокол "Создатель"

final class ProductCreator: ProductCreatorProtocol {
    
    static func factoryMethod(type: ProductType) -> ProductProtocol {
        var product: ProductProtocol
        
        switch type {
        case .A: product = ProductA(name: "ProductA", price: 100)
        case .B: product = ProductB(name: "ProductB", price: 200)
        }
        
        return product
    }
}

//MARK: Применение паттерна "Фабричный метод"

let productA = ProductCreator.factoryMethod(type: .A)
let productB = ProductCreator.factoryMethod(type: .B)

productA.name
productA.price
productB.name
productB.price

//: [Next](@next)
