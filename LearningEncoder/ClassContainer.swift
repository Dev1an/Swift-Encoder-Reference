//
//  ClassContainer.swift
//  LearningEncoder
//
//  Created by Damiaan on 28/01/18.
//  Copyright © 2018 Devian. All rights reserved.
//

import Foundation

class ClassContainer: Container {
	var superEncoderReference: MyEncoder?
	var superContainer: Container? { return superEncoderReference?.container }
	
	private enum SuperCodingKey: String, CodingKey { case `super` }
	
	func encoder() -> MyEncoder {
		let encoder = MyEncoder()
		encoder.codingPath = codingPath + [SuperCodingKey.super]
		return encoder
	}
	
	func superEncoder() -> Encoder {
		let encoder = self.encoder()
		superEncoderReference = encoder
		return encoder
	}
}
