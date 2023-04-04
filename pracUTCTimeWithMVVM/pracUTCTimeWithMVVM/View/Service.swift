//
//  Service.swift
//  pracUTCTimeWithMVVM
//
//  Created by Theo on 2023/04/04.
//

import Foundation

class Service {
	func onYesterday(now: Date) -> Date {
		guard let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: now) else { return now }
		return yesterday
	}
	
	func onNow() {
		
	}
	
	func onTomorrow(now: Date) -> Date {
		guard let tomorrow = Calendar.current.date(byAdding: .day, value: 1, to: now) else { return now }
		return tomorrow
	}
}
