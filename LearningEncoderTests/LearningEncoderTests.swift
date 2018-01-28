//
//  LearningEncoderTests.swift
//  LearningEncoderTests
//
//  Created by Damiaan on 27/01/18.
//  Copyright © 2018 Devian. All rights reserved.
//

import XCTest
@testable import LearningEncoder

class Connection: Encodable {
	let start: String
	let end: String
	
	init(endpoints: (String, String)) {
		(start, end) = endpoints
	}
}

class TrainConnection: Connection {
	let trainId: String
	let duration: Int
	init(train: String, duration: Int, endpoints: (String, String)) {
		trainId = train
		self.duration = duration
		super.init(endpoints: endpoints)
	}
	
	enum CodingKeys: String, CodingKey { case trainId, duration }
	
	override func encode(to encoder: Encoder) throws {
		var container = encoder.unkeyedContainer()
		try container.encode(trainId)
		try container.encode(duration)
		try super.encode(to: container.superEncoder())
	}
}

class LearningEncoderTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testExample() {
        let encoder = JSONEncoder()
		let myEncoder = MyEncoder()
		let connection = TrainConnection(
			train: "IC3200",
			duration: 40,
			endpoints: ("Halle", "Leuven")
		)
		do {
			let data = try encoder.encode(connection)
			print(String(data: data, encoding: .utf8)!)
			try connection.encode(to: myEncoder)
			print(myEncoder)
		} catch {
			print(error)
		}
    }

}
