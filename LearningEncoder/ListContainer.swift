//
//  ListContainer.swift
//  LearningEncoder
//
//  Created by Damiaan on 27/01/18.
//  Copyright © 2018 Devian. All rights reserved.
//

import Foundation

class ListContainer: ClassContainer, UnkeyedEncodingContainer {
	var count: Int { return values.count }
	
	var values = [Container]()
	
	final override var description: String {
		let values: [Container]
		if let superContainer = superContainer {
			values = self.values + [superContainer]
		} else {
			values = self.values
		}
		return "[ " + values.map{$0.description}.joined(separator: ", ") + " ]"
	}
	
	struct IndexKey: CodingKey {
		init(intValue: Int) { self.intValue = intValue }
		init?(stringValue: String) { return nil }
		
		let intValue: Int?
		var stringValue: String { return "list element \(intValue?.description ?? "unkown index")" }
	}
	
	func encodeSingle(encode: (SingleValueContainer)throws->Void) throws {
		let index = values.count
		let svc = SingleValueContainer(path: codingPath + [IndexKey(intValue: index)])
		try encode(svc)
		values.insert(svc, at: index)
	}
	
	func encodeNil() throws {
		try encodeSingle{try $0.encodeNil()}
	}
	
	func encode(_ value: Int) throws {
		try encodeSingle{try $0.encode(value)}
	}
	
	func encode(_ value: Int8) throws {
		try encodeSingle{try $0.encode(value)}
	}
	
	func encode(_ value: Int16) throws {
		try encodeSingle{try $0.encode(value)}
	}
	
	func encode(_ value: Int32) throws {
		try encodeSingle{try $0.encode(value)}
	}
	
	func encode(_ value: Int64) throws {
		try encodeSingle{try $0.encode(value)}
	}
	
	func encode(_ value: UInt) throws {
		try encodeSingle{try $0.encode(value)}
	}
	
	func encode(_ value: UInt8) throws {
		try encodeSingle{try $0.encode(value)}
	}
	
	func encode(_ value: UInt16) throws {
		try encodeSingle{try $0.encode(value)}
	}
	
	func encode(_ value: UInt32) throws {
		try encodeSingle{try $0.encode(value)}
	}
	
	func encode(_ value: UInt64) throws {
		try encodeSingle{try $0.encode(value)}
	}
	
	func encode(_ value: Float) throws {
		try encodeSingle{try $0.encode(value)}
	}
	
	func encode(_ value: Double) throws {
		try encodeSingle{try $0.encode(value)}
	}
	
	func encode(_ value: String) throws {
		try encodeSingle{try $0.encode(value)}
	}
	
	func encode<T>(_ value: T) throws where T : Encodable {
		try encodeSingle{try $0.encode(value)}
	}
	
	func encode(_ value: Bool) throws {
		try encodeSingle{try $0.encode(value)}
	}
	
	func nestedContainer<NestedKey>(keyedBy keyType: NestedKey.Type) -> KeyedEncodingContainer<NestedKey> where NestedKey : CodingKey {
		let index = values.count
		let container = DictionaryContainer<NestedKey>(path: codingPath + [IndexKey(intValue: index)])
		values.insert(container, at: index)
		return KeyedEncodingContainer(container)
	}
	
	func nestedUnkeyedContainer() -> UnkeyedEncodingContainer {
		let index = values.count
		let container = ListContainer(path: codingPath + [IndexKey(intValue: index)])
		values.insert(container, at: index)
		return container
	}
	
}
