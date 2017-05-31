//
//  main.swift
//  BoostCamp
//
//  Created by Alpaca on 2017. 5. 31..
//  Copyright © 2017년 Alpaca. All rights reserved.
//

import Foundation

if let myJSON = myJSONParser(){
    
    // gradeDic을 key인 이름 순대로 정렬
    let sortedGradeArray = Array(gradeDic).sorted(by: {$0.0 < $1.0}) 
    
    // 전체 평균점수를 구함
    var totalScore: Float = 0.00
    for index in avgScoreArray.indices {
        totalScore += avgScoreArray[index]
    }
    let totalAvgScore = totalScore/Float(avgScoreArray.count)
    
    // 소수 둘째자리까지 반올림
    let roundedTotalAvgScore = place2Round(floatNum: totalAvgScore)
    
    // 수료생의 배열을 sortedGradeArray에서 받아옴
    var completeArray = [String]()
    for index in sortedGradeArray.indices {
        if (sortedGradeArray[index].value == "A") || (sortedGradeArray[index].value == "B") || (sortedGradeArray[index].value == "C"){
            completeArray.append(sortedGradeArray[index].key)
        }
    }
    
    // 결과 출력 String
    let startPrint = "성적결과표" + "\n"
                + "\n"
                + "전체 평균 : \(roundedTotalAvgScore)" + "\n"
                + "\n"
                + "개인별 학점"
                + "\n"
    var printSortedGrade = String()
    for index in sortedGradeArray.indices {
        if sortedGradeArray[index].key == "steve"{
            printSortedGrade += "\(sortedGradeArray[index].key)" + "      : " + "\(sortedGradeArray[index].value)" + "\n"
            
        } else {
            printSortedGrade += "\(sortedGradeArray[index].key)" + "       : " + "\(sortedGradeArray[index].value)" + "\n"
        }
    }
    let printComplete = "\n" + "수료생" + "\n" + "\(completeArray[0])" + ", " + "\(completeArray[1])" + ", " + "\(completeArray[2])"
    
    let result = startPrint + printSortedGrade + printComplete
    
    // 출력 결과를 result.txt에 생성
    createResultTxt(path: "/Users/alpaca/Desktop/result.txt", content: result)
}
