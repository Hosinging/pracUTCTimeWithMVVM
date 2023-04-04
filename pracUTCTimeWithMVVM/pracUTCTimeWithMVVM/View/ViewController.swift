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
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
	}
	
	
	
	func updateDateTime() {
		let formatter = DateFormatter()
		formatter.dateFormat = "yyyy년 MM월 dd일 HH시 mm분"
		dateTimeLabel.text = formatter.string(from: currentDateTime)
	}

}

