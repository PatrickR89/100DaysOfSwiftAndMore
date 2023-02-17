import UIKit

func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
    var candidates = candidates.sorted()
    var result = Set<[Int]>()
    var stack = [Int]()

    func findTargetValue(_ index: Int, _ currSum: Int) {

        if currSum > target {return}
        if currSum == target {
            result.insert(stack.sorted())
            return
        }
        for tempIndex in index..<candidates.count {
            if  (tempIndex != index && candidates[tempIndex] == candidates[tempIndex - 1]) { continue }
            stack.append(candidates[tempIndex])

            findTargetValue(tempIndex + 1, currSum + candidates[tempIndex])
            stack.removeLast()
        }
    }

    findTargetValue(0, 0)

    return Array(result)
}

/*
 var combinationSum2 = function(c, target) {
     c.sort((a,b)=>a-b)
     let res = []

     let iterate = (index,sum,temp) =>{
         if(sum>target) return;
         if(sum == target){
             res.push(temp)
             return;
         }
         // 1 1 2 5 6 7 10
         for(let i =index; i<c.length;i++){
             if(i != index && c[i] == c[i-1]) continue;
             iterate(i+1,sum+c[i],[...temp,c[i]])
         }
     }
     iterate(0,0,[])
     return res;
 */



combinationSum2([10,1,2,7,6,1,5], 8)
