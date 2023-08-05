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
	
	fileprivate let dateId = ColumnID("Date", Date.self)
	fileprivate let openId = ColumnID("Open", Double.self)
	fileprivate let highId = ColumnID("High", Double.self)
	fileprivate let lowId = ColumnID("Low", Double.self)
	fileprivate let closeId = ColumnID("Close", Double.self)
	fileprivate let adjCloseId = ColumnID("Adj Close", Double.self)
	fileprivate let volumeId = ColumnID("Volume", Double.self)
	fileprivate let ocMedianId = ColumnID("OCMedian", Double.self)
	fileprivate let hlMedianId = ColumnID("HLMedian", Double.self)
	
	func loadData() throws -> DataFrame
	{
		let columnNames = [dateId.name, openId.name, highId.name, lowId.name,
						   closeId.name, adjCloseId.name, volumeId.name,
						   ocMedianId.name, hlMedianId.name]
		
		let columnTypeSet: [String : CSVType] =
		[
			dateId.name : .date,
			openId.name : .double,
			highId.name : .double,
			lowId.name : .double,
			closeId.name : .double,
			adjCloseId.name : .double,
			volumeId.name : .integer,
			ocMedianId.name : .double,
			hlMedianId.name : .double
		]

		guard
			let sourceUrl = Bundle.main.url(forResource: sourceFile, withExtension: "txt")
		else
		{
			throw URLError(.badURL)
		}
		
		var options = CSVReadingOptions(delimiter: Character("\t"))
		let dateParsing = Date.ParseStrategy(format: "\(year:.defaultDigits)-\(month: .twoDigits)-\(day: .twoDigits)", timeZone: .gmt)
		options.addDateParseStrategy(dateParsing)
		
		return try DataFrame(contentsOfCSVFile: sourceUrl, columns: columnNames, types: columnTypeSet, options: options)
	}
	
	func extractRange(from source: DataFrame, from start: Date, to end: Date) -> DataFrame
	{
		return DataFrame(source.filter(on: "Date", Date.self) { ($0! >= start) && ($0! <= end) })
	}
}
