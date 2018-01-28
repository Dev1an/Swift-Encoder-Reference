//
//  DictionaryContainer.swift
//  LearningEncoder
//
//  Created by Damiaan on 27/01/18.
//  Copyright © 2018 Devian. All rights reserved.
//

import Foundation

class DictionaryContainer<K: CodingKey>: ClassContainer, KeyedEncodingContainerProtocol {
	typealias Key = K
	
	var values = [String: Container]()
	
	final override var description: String {
		var values = self.values
		if let superContainer = superContainer { values["super"] = superContainer }
		return "{ " + values.map{key, value in "\(key): \(value.description)" }.joined(separator: ", ") + " }"
	}

	func encodeSingle(_ key: K, encode: (SingleValueContainer) throws -> Void ) throws {
		let container = SingleValueContainer(path: codingPath)
		try encode(container)
		self.values[key.stringValue] = container
	}

	func encodeNil(forKey key: K) throws {
		try encodeSingle(key) { try $0.encodeNil() }
	}

	func encode(_ value: Bool, forKey key: K) throws {
		try encodeSingle(key) { try $0.encode(value) }
	}
	
	func encode(_ value: Int, forKey key: K) throws {
		try encodeSingle(key) { try $0.encode(value) }
	}
	
	func encode(_ value: Int8, forKey key: K) throws {
		try encodeSingle(key) { try $0.encode(value) }
	}
	
	func encode(_ value: Int16, forKey key: K) throws {
		try encodeSingle(key) { try $0.encode(value) }
	}
	
	func encode(_ value: Int32, forKey key: K) throws {
		try encodeSingle(key) { try $0.encode(value) }
	}
	
	func encode(_ value: Int64, forKey key: K) throws {
		try encodeSingle(key) { try $0.encode(value) }
	}
	
	func encode(_ value: UInt, forKey key: K) throws {
		try encodeSingle(key) { try $0.encode(value) }
	}
	
	func encode(_ value: UInt8, forKey key: K) throws {
		try encodeSingle(key) { try $0.encode(value) }
	}
	
	func encode(_ value: UInt16, forKey key: K) throws {
		try encodeSingle(key) { try $0.encode(value) }
	}
	
	func encode(_ value: UInt32, forKey key: K) throws {
		try encodeSingle(key) { try $0.encode(value) }
	}
	
	func encode(_ value: UInt64, forKey key: K) throws {
		try encodeSingle(key) { try $0.encode(value) }
	}
	
	func encode(_ value: Float, forKey key: K) throws {
		try encodeSingle(key) { try $0.encode(value) }
	}
	
	func encode(_ value: Double, forKey key: K) throws {
		try encodeSingle(key) { try $0.encode(value) }
	}
	
	func encode(_ value: String, forKey key: K) throws {
		try encodeSingle(key) { try $0.encode(value) }
	}
	
	func encode<T>(_ value: T, forKey key: K) throws where T : Encodable {
		try encodeSingle(key) { try $0.encode(value) }
	}
	
	func nestedContainer<NestedKey>(keyedBy keyType: NestedKey.Type, forKey key: K) -> KeyedEncodingContainer<NestedKey> where NestedKey : CodingKey {
		let container = DictionaryContainer<NestedKey>(path: codingPath + [key])
		values[key.stringValue] = container
		return KeyedEncodingContainer(container)
	}
	
	func nestedUnkeyedContainer(forKey key: K) -> UnkeyedEncodingContainer {
		let container = ListContainer(path: codingPath + [key])
		values[key.stringValue] = container
		return container
	}
		
	func superEncoder(forKey key: K) -> Encoder {
		let superEncoder = encoder()
		values[key.stringValue] = superEncoder.container
		return superEncoder
	}
}
