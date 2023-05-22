//: [Previous](@previous)

import Foundation

/*
 Наблюдатель - поведенческий шаблон проектирования. Также известен как «подчинённые». Реализует у класса механизм,
 который позволяет объекту этого класса получать оповещения об изменении состояния других объектов
 и тем самым наблюдать за ними.
*/

//MARK: Реализаия паттерна Наблюдатель
//Протокол который описывает объект-издатель, на изменения которого будут подписываться другие объекты.
protocol Observable {
    func addObserver(for object: Observer)
    func removeObserver(for object: Observer)
}
//Протол который описывает объекты-наблюдатели, которые будут подписываться и наблюдать за изменениями объекта-издатель.
protocol Observer: class {
    func getData(data: String)
}

//MARK: Реализация протоколов
final class ObservableClass: Observable {

    var data: String = "" {
        didSet {
            notifyObservers()
        }
    }
    
    init(data: String) {
        self.data = data
    }
    
    private var observers: [Observer] = []
    
    public func addObserver(for object: Observer) {
        observers.append(object)
    }
    
    public  func removeObserver(for object: Observer){
        observers.removeAll { $0 === object }
    }
    
    private func notifyObservers() {
        observers.forEach { observer in
            observer.getData(data: data)
        }
    }
    
}

class ObserverClass: Observer {
    
    public var data: String = ""
    
    public func getData(data: String) {
        self.data = data
    }
    
}

//MARK: использование паттереа Наблюдатель
var observedObject = ObservableClass(data: "example data")

var subscriber1 = ObserverClass()
var subscriber2 = ObserverClass()

observedObject.addObserver(for: subscriber1)
observedObject.addObserver(for: subscriber2)

print(subscriber1.data.isEmpty)
print(subscriber2.data.isEmpty)

observedObject.data = "new example data"

print(subscriber1.data)
print(subscriber2.data)
//: [Next](@next)
