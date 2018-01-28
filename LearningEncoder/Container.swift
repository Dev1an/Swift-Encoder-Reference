//
//  Container.swift
//  LearningEncoder
//
//  Created by Damiaan on 27/01/18.
//  Copyright © 2018 Devian. All rights reserved.
//

import Foundation

class Container: CustomStringConvertible {
	let codingPath: [CodingKey]
	
	var description: String {return "Encoding unimplemented"}
	
	init(path: [CodingKey]) {
		codingPath = path
	}
}
