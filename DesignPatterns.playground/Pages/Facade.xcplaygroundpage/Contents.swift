//: [Previous](@previous)

import Foundation

/*
    Фасад - структурный паттерн проектирования, который предоставляет
    простой интерфейс к сложной системе классов, библиотеке или вреймворку.
*/

//MARK: Модель данных Пользователь

protocol UserProtocol: Codable {
    var id: Int { get set }
    var firstName: String { get set }
    var lastName: String { get set }
    var maidenName: String { get set }
    var age: Int { get set }
    var gender: String { get set }
    var email: String { get set }
    var phone: String { get set }
    var username: String { get set }
}

struct User: UserProtocol {
    var id: Int
    var firstName: String
    var lastName: String
    var maidenName: String
    var age: Int
    var gender: String
    var email: String
    var phone: String
    var username: String
}

//MARK: Реализация классов ковертеров для JSON и Plist

protocol ConverterProtocol {
    associatedtype T: Codable
    func convert(to data: T) throws -> Data
    func convert(from data: Data) throws -> T
}

final class JsonConverter<T: Codable>: ConverterProtocol {

    private let decoder = JSONDecoder()
    private let encoder = JSONEncoder()
    
    public init() {
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        encoder.keyEncodingStrategy = .convertToSnakeCase
    }
    
    public func convert(to data: T) throws -> Data {
        return try encoder.encode(data)
    }
    
    public func convert(from data: Data) throws -> T {
        return try decoder.decode(T.self, from: data)
    }
    
}

final class PlistConverter<T: Codable>: ConverterProtocol {
    private let decoder = PropertyListDecoder()
    private let encoder = PropertyListEncoder()
    
    public func convert(to data: T) throws -> Data {
        return try encoder.encode(data)
    }
    
    public func convert(from data: Data) throws -> T {
        return try decoder.decode(T.self, from: data)
    }
}

//MARK: Реалзация паттерна Фасад

protocol ConverterFacade {
    associatedtype T: Codable
    
    func convert(from data: Data, type: FileType) throws -> T
    func convert(to data: T, type: FileType) throws -> Data
}
enum FileType {
    case json
    case plist
}

final class Converter<T: Codable>: ConverterFacade {
    private let jsonConverter = JsonConverter<T>()
    private let plistConverter = PlistConverter<T>()
    
    public func convert(from data: Data, type: FileType) throws -> T {
        switch type {
        case .json:
            return try jsonConverter.convert(from: data)
        case .plist:
            return try plistConverter.convert(from: data)
        }
    }
    
    public func convert(to data: T, type: FileType) throws -> Data {
        switch type {
        case .json:
            return try jsonConverter.convert(to: data)
        case .plist:
            return try plistConverter.convert(to: data)
        }
    }
}


//MARK: Использование паттерна Фасад

var filePath = Bundle.main.path(forResource: "UserJson", ofType: "json")
let jsonData = FileManager.default.contents(atPath: filePath!)

filePath = Bundle.main.path(forResource: "UserPlist", ofType: "plist")
let plistData = FileManager.default.contents(atPath: filePath!)

let converter = Converter<User>()
var userJson: User?
var userPlist: User?
    
do {
    userJson = try converter.convert(from: jsonData!, type: .json)
    userPlist = try converter.convert(from: plistData!, type: .plist)
} catch {
    print(error)
}

if let userJson = userJson, let userPlist = userPlist {
    print(userJson.firstName)
    print(userPlist.firstName)
}

//: [Next](@next)
