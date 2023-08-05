//
//  ModelTrainInteractor.swift
//  BTCEURPredictor
//
//  Created by Mark Hoggatt on 04/08/2023.
//

import CreateML
import TabularData

struct ModelTrainInteractor
{
	func predictValues(basedOn table: DataFrame, for target: String) throws -> [Double]
	{
		let regressor = try MLLinearRegressor(trainingData: table, targetColumn: target)
		return []
	}
}
