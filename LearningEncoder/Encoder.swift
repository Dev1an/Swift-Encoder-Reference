//
//  Encoder.swift
//  LearningEncoder
//
//  Created by Damiaan on 27/01/18.
//  Copyright © 2018 Devian. All rights reserved.
//

import Foundation

class MyEncoder: Encoder, CustomStringConvertible {
	var codingPath = [CodingKey]()
	
	var userInfo = [CodingUserInfoKey : Any]()
	
	var container: Container?
	
	var description: String {
		return container?.description ?? "Nothing is encoded"
	}
	
	func container<Key>(keyedBy type: Key.Type) -> KeyedEncodingContainer<Key> where Key : CodingKey {
		let newContainer = DictionaryContainer<Key>(path: codingPath)
		container = newContainer
		return KeyedEncodingContainer(newContainer)
	}

	func unkeyedContainer() -> UnkeyedEncodingContainer {
		let newContainer = ListContainer(path: codingPath)
		container = newContainer
		return newContainer
	}

	func singleValueContainer() -> SingleValueEncodingContainer {
		let newContainer = SingleValueContainer(path: codingPath)
		container = newContainer
		return newContainer
	}
}
