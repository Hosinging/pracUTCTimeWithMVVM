//
//  ViewModel생성.swift
//  pracUTCTimeWithMVVM
//
//  Created by Theo on 2023/04/04.
//

import Foundation

class ViewModel {
	var onUpdated: () -> Void = {}
	var dateTimeString: String = "Loading..." {
		didSet {
			onUpdated()
		}
	}
		
	let service = Service()
	
	func viewDidLoad() {
		service.fetchNow { [weak self] model in
			guard let self = self else { return }
			let dateString = self.dateToString(date: model.currentDateTime)
			self.dateTimeString = dateString
		}
	}
	
   private func dateToString(date: Date) -> String {
	   let formatter = DateFormatter()
	   formatter.dateFormat = "yyyy년 MM월 dd일 HH시 mm분"
	   return formatter.string(from: date)
   }
	func reload() {
		self.viewDidLoad()
	}
	
	func moveDay(day: Int) {
		service.moveDay(day: day)
		dateTimeString = dateToString(date: service.currentModel.currentDateTime)
	}
	
}
