//
//  Repository.swift
//  pracUTCTimeWithMVVM
//
//  Created by Theo on 2023/04/04.
//

import Foundation

class Repository {
	func fetchNow(onCompleted: @escaping (_ entity: UTCTimeModel) -> Void) {
		guard let url = URL(string: "http://worldtimeapi.org/api/timezone/Asia/Seoul") else { return }
		
		URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
			guard let data = data else { return }
			guard let model = try? JSONDecoder().decode(UTCTimeModel.self, from: data) else { return }
			
			onCompleted(model)
		}).resume()
	}
}
