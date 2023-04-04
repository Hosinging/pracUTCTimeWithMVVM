//
//  Service.swift
//  pracUTCTimeWithMVVM
//
//  Created by Theo on 2023/04/04.
//

import Foundation

class Service {
	let repository = Repository()
	var currentModel = Model(currentDateTime: Date())
	
	func fetchNow(onCompleted: @escaping (_ model: Model) -> Void) {
		repository.fetchNow { [weak self] entity in
			let formatter = DateFormatter()
			formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSXXX"
			
			guard let now = formatter.date(from: entity.datetime) else { return }
			let model = Model(currentDateTime: now)
			self?.currentModel = model
			onCompleted(model)
		}
	}
	
	func moveDay(day: Int) {
		guard let moveDay = Calendar.current.date(byAdding: .day, value: day, to: currentModel.currentDateTime) else { return }
		currentModel.currentDateTime = moveDay
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
