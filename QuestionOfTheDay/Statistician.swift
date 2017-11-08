


import Foundation
 
 class Statistician: NSObject {
    
    let APPLICATION_ID = "5513637F-4493-F39A-FF33-E672594D1900"
    let API_KEY = "685533CD-EE06-6BE3-FFB6-53FD37320000"
    let SERVER_URL = "https://api.backendless.com"
    let backendless = Backendless.sharedInstance()!
    var dataStoreQuestionOfTheDay: IDataStore!
    var dataStoreOpinion: IDataStore!
    
    func findPercentage() -> [Double] {
        let Allopinion:[Opinion] = GetOpinions()
        var answer0:Double = 0.0
        var answer1:Double = 0.0
        var answer2:Double = 0.0
        var PercentOfOpinion:[Double] = []
        for n in Allopinion{
            if n.answer == 0{
                answer0 = answer0 + 1 }
            
            if n.answer == 1{
                answer1 = answer1 + 1 }
            
            if n.answer == 2{
                answer2 = answer2 + 1 }
            
        }
        PercentOfOpinion.append(Double(answer0/Double(Allopinion.count))*100.0)
        PercentOfOpinion.append(Double(answer1/Double(Allopinion.count))*100.0)
        PercentOfOpinion.append(Double(answer2/Double(Allopinion.count))*100.0)
        return PercentOfOpinion
    }
    
    
    
    func saveOpinion(Opinion: Opinion) {
        dataStoreOpinion = backendless.data.of(Opinion.ofClass())
        _ = dataStoreOpinion?.save(Opinion) as! Opinion
        
    }
    
    func  fetchQuestionOfTheDay() ->QuestionOfTheDay {
        dataStoreQuestionOfTheDay = backendless.data.of(QuestionOfTheDay.ofClass())
        let DatabaseQuestion = dataStoreQuestionOfTheDay.find(byId: "6D46A611-2E57-6484-FF3D-D10682422400") as! QuestionOfTheDay
        return DatabaseQuestion    }
    
    
    func GetOpinions() ->[Opinion]{
        dataStoreOpinion = backendless.data.of(Opinion.ofClass())
        let numberOfTheOpinionsToPull = dataStoreOpinion?.getObjectCount() as! Int
        let sizeOfPage = 10
        let buildQuery = DataQueryBuilder()
        var numberOfTheOpnionsPulled = 0
        var eachAndEveryOpinion:[Opinion] = []
        buildQuery!.setPageSize(Int32(sizeOfPage)).setOffset(0)
        
        while numberOfTheOpnionsPulled < numberOfTheOpinionsToPull {
            let Opinion = self.dataStoreOpinion?.find(buildQuery) as! [Opinion]
            eachAndEveryOpinion += Opinion
            numberOfTheOpnionsPulled += Opinion.count
            buildQuery!.prepareNextPage()
        }
        return eachAndEveryOpinion
    }
    
    override init(){
        backendless.hostURL = SERVER_URL
        backendless.initApp(APPLICATION_ID, apiKey: API_KEY)
    }
 }
