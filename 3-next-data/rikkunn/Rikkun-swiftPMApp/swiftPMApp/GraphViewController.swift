//
//  GraphViewController.swift
//  swiftPMApp
//
//  Created by Rikuminamisawa on 2021/12/10.
//

import UIKit
import Charts

class GraphViewController: UIViewController {
    
    var chartView: LineChartView!
    var chartDataSet: LineChartDataSet!
    // 今回使用するサンプルデータ
    let sampleData = [88.0, 99.0, 93.0, 67.0, 45.0, 72.0, 58.0, 91.0, 81.0]
    var dataArray: [Double]!
    let saveData = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArray = saveData.object(forKey: "score") as? [Double] ?? [Double]()
        displayChart(data: dataArray)
    }
    
    @IBAction func removeLastData(_ sender: Any) {
        dataArray.removeLast()
        saveData.set(dataArray, forKey: "score")
        self.loadView()
        self.viewDidLoad()
    }
    
    func displayChart(data: [Double]) {
        chartView = LineChartView(frame: CGRect(x: 0, y: 200, width: view.frame.width, height: 400))
        var dataEntries = [ChartDataEntry]()
        for (xValue, yValue) in data.enumerated() {
            let dataEntry = ChartDataEntry(x: Double(xValue), y: yValue)
            dataEntries.append(dataEntry)
        }
        chartDataSet = LineChartDataSet(entries: dataEntries, label: "SampleDataChart")
        chartDataSet.lineWidth = 5.0
        chartDataSet.mode = .cubicBezier
        chartView.data = LineChartData(dataSet: chartDataSet)
        chartView.xAxis.labelPosition = .bottom
        chartView.leftAxis.axisMaximum = 100
        chartView.leftAxis.axisMinimum = 0
        chartView.leftAxis.labelCount = 6
        chartView.rightAxis.enabled = false
        chartView.highlightPerTapEnabled = false
        chartView.legend.enabled = false
        chartView.pinchZoomEnabled = false
        chartView.doubleTapToZoomEnabled = false
        chartView.extraTopOffset = 20
        chartView.animate(xAxisDuration: 1.25)
        view.addSubview(chartView)
    }
}
