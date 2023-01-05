import UIKit

func findRestaurant(_ list1: [String], _ list2: [String]) -> [String] {

    var indexRestaurants = [String:Int]()
    var minIndex = -1
    for index in list1.indices {
        if let secondIndex = list2.firstIndex(of: list1[index]) {
            indexRestaurants[list1[index]] = index + secondIndex
            if index + secondIndex < minIndex || minIndex == -1 {
                minIndex = index + secondIndex
            }
        }
    }

    var result = [String]()

    indexRestaurants.forEach {
        if $0.value == minIndex {
            result.append($0.key)
        }
    }

    return result
    }

findRestaurant(["Shogun","Tapioca Express","Burger King","KFC"], ["Piatti","The Grill at Torrey Pines","Hungry Hunter Steakhouse","Shogun"])
findRestaurant(["Shogun","Tapioca Express","Burger King","KFC"], ["KFC","Shogun","Burger King"])
