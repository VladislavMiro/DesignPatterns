//: [Previous](@previous)

//MARK:Описание:
/*
 Singleton — порождающий шаблон проектирования, гарантирующий, что в однопоточном приложении будет
 единственный экземпляр некоторого класса, и предоставляющий глобальную точку доступа к этому экземпляру.
*/

import Foundation


//MARK: Реализация паттерна "Одиночка"

protocol SingletoneProtocol {
    static var shared: Self { get }
}

protocol UserProtocol: SingletoneProtocol {
    var name: String { get set }
    var lastName: String { get set }
    
    func printUser()
}

final class User: UserProtocol {

    public var name: String = ""
    public var lastName: String = ""
    // Статическое поле, управляющие доступом к экземпляру одиночки.
    private(set) static var shared: User = User()
    // Инициализатор Одиночки всегда должен быть скрытым.
    private init() {}
    //Бизнес-логика
    public func printUser() {
        print(name + " " + lastName)
    }

}

//MARK: Применение паттерна

User.shared.name = "Jhon"
User.shared.lastName = "Smith"
User.shared.printUser()

//: [Next](@next)
