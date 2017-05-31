//
//  func.swift
//  BoostCamp
//
//  Created by Alpaca on 2017. 5. 31..
//  Copyright © 2017년 Alpaca. All rights reserved.
//

import Foundation

// JSON를 받아오는 함수
func myJSONParser() -> [[String:Any]]? {
    
    let path = URL(fileURLWithPath: file)
    if let data = try? Data(contentsOf: path) {
        do {
            let jsonData = try JSONSerialization.jsonObject(with: data, options: []) as? [[String:Any]] ?? [[:]]
            for index in jsonData.indices {
                nameArray.append(jsonData[index]["name"] as! String)
            }
            for index in jsonData.indices {
                scoreDic.append(jsonData[index]["grade"] as! [String : Float])
            }
            for index in scoreDic.indices {
                avgScoreArray.append(getAvgScore(dic: scoreDic[index]))
            }
            for index in nameArray.indices {
                finalDic.updateValue(avgScoreArray[index], forKey: nameArray[index])
            }
            for index in nameArray.indices {
                gradeDic.updateValue(checkGrade(score: avgScoreArray[index]), forKey: nameArray[index])
            }
            
            return jsonData
        }
        catch {
            print("ERROR")
        }
    }
    return nil
}

// 개인별 평균 점수를 뽑아낼 때 사용하는 함수
func getAvgScore(dic: [String:Float]) -> Float {
    var result: Float = 0.00
    
    for score in dic.values {
        result += score
    }
    result = result / Float(dic.count)
    return result
}

// 등급 계산 함수
func checkGrade(score: Float) -> String {
    if score >= 90 {
        return "A"
    }
    else if score >= 80 {
        return "B"
    }
    else if score >= 70 {
        return "C"
    }
    else if score >= 60 {
        return "D"
    }
    else {
        return "F"
    }
}

// 소수 둘째 자리 반올림 함수
func place2Round(floatNum: Float) -> Float {
    let numberOfPlaces = 2.0
    let multiplier = powf(10.0, Float(numberOfPlaces))
    let ans = round(floatNum * multiplier) / multiplier
    return ans
}

// 결과 txt파일 생성 함수
func createResultTxt(path: String, content: String) {
    do {
    try content.write(toFile: path, atomically: false, encoding: String.Encoding.utf8)
    }
    catch {
        print("ERROR")
    }
}
