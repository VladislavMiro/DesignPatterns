//: [Previous](@previous)
import Foundation

/*
 Делегирование (англ. Delegation) — основной шаблон проектирования, в котором объект внешне выражает некоторое поведение,
 но в реальности передаёт ответственность за выполнение этого поведения связанному объекту.
*/

//MARK: Реализация паттерна "Делегирование"

//Для делегирования используют протоколы
protocol DelegationProtocol: class {
    func delegationPrint(text: String)
}

//Описание класса который будет делеировать печать на консоль классу Printer
final class PrintDelegation {
    //Делегат класса printer
    private weak var delegate: DelegationProtocol?
    
    init(delegate: DelegationProtocol) {
        self.delegate = delegate
    }
    //Реализация делегирования
    public func print(_ text: String) {
        delegate?.delegationPrint(text: text)
    }
    
}

//Описание класса делегата которому делегируют печать в консоль
final class Printer: DelegationProtocol {
    
    public func delegationPrint(text: String) {
        print(text)
    }
    
}

//MARK: Использование паттерна


let printer = Printer()
let a = PrintDelegation(delegate: printer)

a.print("test delegation")

//: [Next](@next)
