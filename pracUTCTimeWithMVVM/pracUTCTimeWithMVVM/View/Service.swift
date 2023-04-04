//
//  Service.swift
//  pracUTCTimeWithMVVM
//
//  Created by Theo on 2023/04/04.
//

import Foundation

class Service {
	let repository = Repository()
	
	func fetchNow(onCompleted: @escaping (_ model: Model) -> Void) {
		repository.fetchNow { entity in
			let formatter = DateFormatter()
			formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSXXX"
			
			guard let now = formatter.date(from: entity.datetime) else { return }
			let model = Model(currentDateTime: now)
			onCompleted(model)
		}
	}
	
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
