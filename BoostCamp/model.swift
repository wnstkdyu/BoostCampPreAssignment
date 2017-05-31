//
//  model.swift
//  BoostCamp
//
//  Created by Alpaca on 2017. 5. 31..
//  Copyright © 2017년 Alpaca. All rights reserved.
//

import Foundation

// json파일의 경로
let file = "/Users/alpaca/Desktop/Students.json"

// json을 받아오는 컬렉션
var nameArray = [String]()          // 이름의 배열(정렬x)
var scoreDic = [[String:Float]]()   // 학생별로 과목:점수를 받아옴
var avgScoreArray = [Float]()       // 학생별 평균점수의 배열
var finalDic = [String:Float]()     // 학생:평균점수
var gradeDic = [String:String]()    // 학생:학점의 딕셔너리




