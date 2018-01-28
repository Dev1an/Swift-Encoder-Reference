//
//  SingleValueContainer.swift
//  LearningEncoder
//
//  Created by Damiaan on 27/01/18.
//  Copyright © 2018 Devian. All rights reserved.
//

import Foundation

enum Value {
	case end(String)
	case extended(Container)
}

class SingleValueContainer: Container, SingleValueEncodingContainer {
	
	var value: Value?
	
	final override var description: String {
		if let value = value {
			switch value {
			case .end(let string):
				return string
			case .extended(let container):
				return container.description
			}
		} else {
			fatalError("single value container without value")
		}
	}
	
	func encodeNil() throws {
		value = .end("nill")
	}
	
	func encode(_ value: Bool) throws {
		self.value = .end(value.description)
	}
	
	func encode(_ value: Int) throws {
		self.value = .end(value.description)
	}
	
	func encode(_ value: Int8) throws {
		self.value = .end(value.description)
	}
	
	func encode(_ value: Int16) throws {
		self.value = .end(value.description)
	}
	
	func encode(_ value: Int32) throws {
		self.value = .end(value.description)
	}
	
	func encode(_ value: Int64) throws {
		self.value = .end(value.description)
	}
	
	func encode(_ value: UInt) throws {
		self.value = .end(value.description)
	}
	
	func encode(_ value: UInt8) throws {
		self.value = .end(value.description)
	}
	
	func encode(_ value: UInt16) throws {
		self.value = .end(value.description)
	}
	
	func encode(_ value: UInt32) throws {
		self.value = .end(value.description)
	}
	
	func encode(_ value: UInt64) throws {
		self.value = .end(value.description)
	}
	
	func encode(_ value: Float) throws {
		self.value = .end(value.description)
	}
	
	func encode(_ value: Double) throws {
		self.value = .end(value.description)
	}
	
	func encode(_ value: String) throws {
		self.value = .end(value.description)
	}
	
	func encode<T>(_ value: T) throws where T : Encodable {
		let encoder = MyEncoder()
		encoder.codingPath = codingPath
		try value.encode(to: encoder)
		if let container = encoder.container {
			self.value = .extended(container)
		}
	}
}
