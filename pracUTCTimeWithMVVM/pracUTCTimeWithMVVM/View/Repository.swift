//
//  Repository.swift
//  pracUTCTimeWithMVVM
//
//  Created by Theo on 2023/04/04.
//

import Foundation

class Repository {
	func fetchNow(onCompleted: @escaping (_ date: Date) -> Void) {
		guard let url = URL(string: "http://worldtimeapi.org/api/timezone/Asia/Seoul") else { return }
		
		URLSession.shared.dataTask(with: url, completionHandler: { [weak self] data, response, error in
			guard let data = data else { return }
			guard let model = try? JSONDecoder().decode(UTCTimeModel.self, from: data) else { return }
			
			let formatter = DateFormatter()
			formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSXXX"
			
			guard let now = formatter.date(from: model.datetime) else { return }
			
			DispatchQueue.main.async {
				onCompleted(now)
			}
		}).resume()
	}
}
