//
//  DataTableInteractor.swift
//  BTCEURPredictor
//
//  Created by Mark Hoggatt on 04/08/2023.
//

import Foundation
import TabularData

struct DataTableInteractor
{
	fileprivate let sourceFile: String = "BTC-EUR"
	fileprivate let columnSet: [String : CSVType] =
	[
		"Date" : .date,
		"Open" : .double,
		"High" : .double,
		"Low" : .double,
		"Close" : .double,
		"Adj Close" : .double,
		"Volume" : .integer
	]

	func loadData() throws -> DataFrame
	{
		guard
			let sourceUrl = Bundle.main.url(forResource: sourceFile, withExtension: "txt")
		else
		{
			throw URLError(.badURL)
		}
		
		var options = CSVReadingOptions(delimiter: Character("\t"))
		let dateParsing = Date.ParseStrategy(format: "\(year:.defaultDigits)-\(month: .twoDigits)-\(day: .twoDigits)", timeZone: .gmt)
		options.addDateParseStrategy(dateParsing)
		
		return try DataFrame(contentsOfCSVFile: sourceUrl, columns: nil, rows: nil, types: columnSet, options: options)
	}
}
