//: [Previous](@previous)

//MARK: Описание
/*
 Строитель — это порождающий паттерн проектирования, который позволяет создавать сложные объекты пошагово.
 Строитель даёт возможность использовать один и тот же код строительства для получения разных представлений объектов.
*/

import Foundation

//MARK: Протокол описывающий класс "Контакт"

protocol ContactProtocol {
    
    var name: String { get set }
    var surname: String { get set }
    var phoneNumber: String { get set }
    var address: String { get set }
    
    func printContact()
    
}

//MARK: Протокол описывающий класс, реализующий паттерн строитель для класса "Контакт"

protocol ContacBuilderProtocol {
    func setName(_ name: String) -> Self
    func setSurname(_ surname: String) -> Self
    func setPhoneNumber(_ phoneNumber: String) -> Self
    func setAddress(_ address: String) -> Self
    func build() -> ContactProtocol?
}

//MARK: Реализация протокола "Контакт"

final class Contact: ContactProtocol {
    
    public var name: String
    public var surname: String
    public var phoneNumber: String
    public var address: String
    
    //MARK: Реализация протокола паттерна "Строитель"
    
    public class ContactBuilder: ContacBuilderProtocol {
        
        private var name: String?
        private var surname: String?
        private var phoneNumber: String?
        private var address: String?
        
        public func setName(_ name: String) -> Self {
            self.name = name
            return self
        }
        
        public func setSurname(_ surname: String) -> Self {
            self.surname = surname
            return self
        }
        
        public func setPhoneNumber(_ phoneNumber: String) -> Self {
            self.phoneNumber = phoneNumber
            return self
        }
        
        public func setAddress(_ address: String) -> Self {
            self.address = address
            return self
        }
        
        public func build() -> ContactProtocol? {
            guard let name = name,
                  let surname = surname,
                  let phoneNumber = phoneNumber,
                  let address = address
            else { return nil }
            return Contact(name, surname, phoneNumber, address)
        }
    }
    
    private init(_ name: String,_ surname: String,_ phoneNumber: String,_ address: String) {
        self.name = name
        self.surname = surname
        self.phoneNumber = phoneNumber
        self.address = address
    }
    
    public func printContact() {
        print(name + " " +
            surname + "\n" +
            phoneNumber + "\n" +
            address)
    }
}

//MARK: Применение паттерна

var contact = Contact.ContactBuilder().setName("Vlad")
    .setSurname("Miroshnichenko")
    .setPhoneNumber("123-22-22")
    .setAddress("Some Address")
    .build()

contact?.printContact()

//: [Next](@next)








