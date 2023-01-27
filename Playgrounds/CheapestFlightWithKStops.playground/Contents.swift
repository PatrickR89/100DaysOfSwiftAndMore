import UIKit

func findCheapestPrice(_ n: Int, _ flights: [[Int]], _ src: Int, _ dst: Int, _ k: Int) -> Int {
    var flightCosts = Array(repeating: Int.max, count: n)
    flightCosts[src] = 0
    var index = 0

    while index <= k {
        var temporaryCosts = flightCosts

        for flight in flights {
            let city = flight[0]
            let connection = flight[1]
            let cost = flight[2]

            if flightCosts[city] == Int.max { continue }
            temporaryCosts[connection] = min(temporaryCosts[connection], flightCosts[city] + cost)
        }

        flightCosts = temporaryCosts
        index += 1
    }
    return flightCosts[dst] == Int.max ? -1 : flightCosts[dst]
}

// MARK: from solutions - TIME LIMIT EXCEEDED!!! HOW???
/*
struct CityNode {
    var name: Int
    var stops: Int
    var cost: Int
}

typealias cityNode = (city: Int, stops: Int, cost: Int)

func findCheapestPrice(_ n: Int, _ flights: [[Int]], _ src: Int, _ dst: Int, _ k: Int) -> Int {

    var flightPrice = Int.max
    var connections = [Int: [[Int]]]()

    for flight in flights {
        connections[flight[0], default: [[Int]]()].append([flight[1], flight[2]])
    }

    var queue = [cityNode]()

    queue.append((city: src, stops: 0, cost: 0))

    while !queue.isEmpty {
        let (city, stops, cost) = queue.removeFirst()

        if city == dst {
            flightPrice = min(flightPrice, cost)
            continue
        }

        if stops > k || cost > flightPrice {
            continue
        }

        for nextCity in connections[city] ?? [] {
            queue.append((city: nextCity[0], stops: stops + 1, cost: cost + nextCity[1]))
        }

    }

    return flightPrice == Int.max ? -1 : flightPrice
}
 */

/*
// MARK: too phylosophical approach...
func findCheapestPrice(_ n: Int, _ flights: [[Int]], _ src: Int, _ dst: Int, _ k: Int) -> Int {

    var flightPrice = Int.max
    var visited = [Int: Bool]()
    var connections = [Int: [[Int]]]()
    var distance = [Int: Int]()

    for flight in flights {
        visited[flight[0]] = false
        visited[flight[1]] = false
        connections[flight[0], default: [[Int]]()].append([flight[1], flight[2]])
    }

    var queue = [Int]()

    queue.append(src)
    distance[src] = 0

    var currentPath = [Int]()
    var currentCost = 0

    while !queue.isEmpty {
        let city = queue.removeFirst()
        visited[city] = true
        connections[city]?.forEach({
            if !visited[$0[0]]! {
                queue.append($0[0])
            }
        })

        if currentPath.count == k + 2 && currentPath[currentPath.count - 1] != dst {
            let cost = connections[currentPath[currentPath.count - 2]]?.first(where: { dest in
                dest[0] == currentPath[currentPath.count - 1]
            })?[1]
            currentCost -= cost ?? 0
            currentPath.removeLast()
        } else {
            currentPath.append(city)
            if city != src {
                let cost = connections[currentPath[currentPath.count - 2]]?.first(where: { dest in
                    dest[0] == city
                })?[1]
                currentCost += cost ?? 0
            }
        }

        if currentPath.count <= k + 2 && currentPath[currentPath.count - 1] == dst {
            if currentCost < flightPrice {
                flightPrice = currentCost
            }
        }

        print(currentPath)
        print(currentCost)
    }


    return flightPrice == Int.max ? -1 : flightPrice
}
 */

findCheapestPrice(4, [[0,1,100],[1,2,100],[2,0,100],[1,3,600],[2,3,200]], 0, 3, 1)
findCheapestPrice(3, [[0,1,100],[1,2,100],[0,2,500]], 0, 2, 1)
findCheapestPrice(5, [[4,1,1],[1,2,3],[0,3,2],[0,4,10],[3,1,1],[1,4,3]], 2, 1, 1)
findCheapestPrice(3, [[0,1,2],[1,2,1],[2,0,10]], 1, 2, 1)
findCheapestPrice(4, [[0,1,1],[0,2,5],[1,2,1],[2,3,1]], 0, 3, 1)
