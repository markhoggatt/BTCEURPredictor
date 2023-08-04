//
//  DataFrameTests.swift
//  BTCEURPredictorTests
//
//  Created by Mark Hoggatt on 04/08/2023.
//

import TabularData
import XCTest

final class DataFrameTests: XCTestCase
{
    override func setUpWithError() throws
	{
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws
	{
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

	func testDataFrameColumns() throws
	{
		let table = DataTableInteractor()
		let frame: DataFrame = try table.loadData()
		XCTAssertGreaterThan(frame.columns.count, 1)
	}
	
	func testDataFrameRows() throws
	{
		 let table = DataTableInteractor()
		 let frame: DataFrame = try table.loadData()
		 XCTAssertGreaterThan(frame.rows.count, 1800)
	}

    func testPerformanceExample() throws
	{
        // This is an example of a performance test case.
        self.measure
		{
            // Put the code you want to measure the time of here.
        }
    }

}
