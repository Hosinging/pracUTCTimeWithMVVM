//
//  ViewModel생성.swift
//  pracUTCTimeWithMVVM
//
//  Created by Theo on 2023/04/04.
//

import Foundation

class ViewModel {
	var dateTimeString: String = "Loading..."
		
	let service = Service()
	
	func viewDidLoad() {
		service.fetchNow()
	}
	
   private func dateToString(date: Date) {
	   let formatter = DateFormatter()
	   formatter.dateFormat = "yyyy년 MM월 dd일 HH시 mm분"
	   dateTimeString = formatter.string(from: date)
   }
	
}
