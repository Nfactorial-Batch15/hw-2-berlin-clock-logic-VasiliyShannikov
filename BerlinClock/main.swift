//
//  main.swift
//  BerlinClock
//
//  Created by Vasiliy Shannikov on 02.12.2021.
//

import Foundation
print ("Please input the time in hh:mm:ss ")
var inpTime: String
if let a = readLine(){
    inpTime = a
} else {
    inpTime = "defalt"
    print("You've entered unvalid value")
}
var hours: Int
var minutes:Int
var seconds: Int
var arr: [String] = inpTime.components(separatedBy: [":","/"," "])
var resSeconds = "O"
var resFiveHours = "OOOO"
var resSingleHours = "OOOO"
var resFiveMinutes = "OOOOOOOOOOO"
var resSingleMinutes = "OOOO"

func strToInt(val: String) -> Int {
    if let a = Int(val){
        return a
    }
    return -1
}
hours = strToInt(val: arr[0])
minutes = strToInt(val: arr[1])
seconds = strToInt(val: arr[2])
let valid: Bool = -1 < hours && hours < 24 && -1 < minutes && minutes < 60 && -1 < seconds && seconds < 60

func strResult(base: String,color: Character, range: Int, type: Int) -> String {
    if range > 0 {
        var baseToArr = Array(base)
        for index in 1...range {
            if type < 11 {
                baseToArr[index - 1] = color
            }
            else {
                if index % 3 == 0 {
                    baseToArr[index - 1] = "R"
                } else {
                    baseToArr[index - 1] = "Y"
                }
            }
        }
        return String(baseToArr)
    } else {return base}
}

if valid {
    if seconds % 2 == 0 {
     resSeconds = "Y"
    }
    resFiveHours = strResult(base: resFiveHours, color: "R", range: hours / 5, type: 4)
    resSingleHours = strResult(base: resSingleHours, color: "R", range: hours % 5, type: 4)
    resFiveMinutes = strResult(base: resFiveMinutes, color: "Y", range: minutes/5, type: 11)
    resSingleMinutes = strResult(base: resSingleMinutes, color: "Y", range: minutes % 5, type: 4 )
    print("Single seconds line is " + resSeconds)
    print("5 hours line is " + resFiveHours)
    print("1 hours line is " + resSingleHours)
    print("5 minutes line is " + resFiveMinutes)
    print("1 minutes line is " + resSingleMinutes)
    print("Entry line is " + resSeconds + resFiveHours + resSingleHours + resFiveMinutes + resSingleMinutes  )

} else {
    print("You've entered wrong data. The programm will close.")
}



// YRRROROOOYYRYYRYYRYOOOOO
