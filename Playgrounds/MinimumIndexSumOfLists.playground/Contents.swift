import UIKit

func findRestaurant(_ list1: [String], _ list2: [String]) -> [String] {

    var indexRestaurants = [String:Int]()

    for index in list1.indices {
        if let secondIndex = list2.firstIndex(of: list1[index]) {
            indexRestaurants[list1[index]] = index + secondIndex
        }
    }

    let minValue = indexRestaurants.values.reduce(into: list1.count + list2.count) { result, index in
        index < result ? (result = index) : (result = result)
    }

    let result = indexRestaurants.filter {
        $0.value == minValue
    }.map {
        return $0.key
    }

    return result
    }

findRestaurant(["Shogun","Tapioca Express","Burger King","KFC"], ["Piatti","The Grill at Torrey Pines","Hungry Hunter Steakhouse","Shogun"])
findRestaurant(["Shogun","Tapioca Express","Burger King","KFC"], ["KFC","Shogun","Burger King"])
