//
//  selection.swift
//  goodStore
//
//  Created by mac on 2021/08/12.
//

import UIKit
import RxSwift

var categorySelection = BehaviorSubject<String>(value: "")
var selectedStore = BehaviorSubject<String>(value: "")
var selectedDescription = BehaviorSubject<String>(value: "")
var selectedAddress = BehaviorSubject<String>(value: "")
var selectedWay = BehaviorSubject<String>(value: "")
var selectedNumber = BehaviorSubject<String>(value: "")
var selectedTime = BehaviorSubject<String>(value: "")

func getEndString(menu: String) -> String {
    switch menu {
    case "한식":
        return "001"
    case "중식":
        return "002"
    case "일식":
        return "003"
    case "기타 외식업":
        return "004"
    case "미용업":
        return "005"
    case "목욕업":
        return "006"
    case "세탁업":
        return "007"
    case "영화관람":
        return "008"
    case "숙박업":
        return "009"
    case "VTR 대여":
        return "010"
    case "노래방":
        return "011"
    case "수영∙볼링∙당구∙골프장":
        return "012"
    case "기타 서비스업종":
        return "013"
    default:
        return ""
    }
}
