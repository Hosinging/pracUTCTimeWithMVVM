//
//  ViewController.swift
//  pracUTCTimeWithMVVM
//
//  Created by Theo on 2023/04/04.
//

import UIKit

class ViewController: UIViewController {
	//MARK: - View
	@IBOutlet weak var dateTimeLabel: UILabel!
	
	@IBAction func onYesterday(_ sender: UIButton) {
		guard let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: currentDateTime) else { return }
		currentDateTime = yesterday
		updateDateTime()
	}
	
	@IBAction func onNow(_ sender: UIButton) {
		fetchNow()
	}
	
	@IBAction func onTomorrow(_ sender: UIButton) {
		guard let tomorrow = Calendar.current.date(byAdding: .day, value: 1, to: currentDateTime) else { return }
				currentDateTime = tomorrow
				updateDateTime()
	}
	
	//MARK: - Controller
	var currentDateTime = Date()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
	}
	
	func fetchNow() {
		guard let url = URL(string: "http://worldtimeapi.org/api/timezone/Asia/Seoul") else { return }
		
		dateTimeLabel.text = "Loading..."
		
		URLSession.shared.dataTask(with: url, completionHandler: { [weak self] data, response, error in
			guard let data = data else { return }
			guard let model = try? JSONDecoder().decode(UTCTimeModel.self, from: data) else { return }
			
			let formatter = DateFormatter()
			formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSXXX"
			
			guard let now = formatter.date(from: model.datetime) else { return }
			
			self?.currentDateTime = now
			
			DispatchQueue.main.async {
				self?.updateDateTime()
			}
		}).resume()
	}
	
	func updateDateTime() {
		let formatter = DateFormatter()
		formatter.dateFormat = "yyyy년 MM월 dd일 HH시 mm분"
		dateTimeLabel.text = formatter.string(from: currentDateTime)
	}

}

