import Foundation

class APIService {
    
	func getAccount(completion: @escaping (AccountInfo?, Error?) -> ()) {
        API.account.request(objectType: AccountInfo.self) { object, error in
            if let account = object {
                DispatchQueue.main.async {
                    completion(account, nil)
                }
            } else {
                completion(nil, error)
            }
        }
	}
    
    func getRewardsInfo(completion: @escaping (RewardInfo?, Error?) -> ()) {
        API.rewards.request(objectType: RewardInfo.self) { object, error in
            if let reward = object {
                DispatchQueue.main.async {
                    completion(reward, nil)
                }
            } else {
                completion(nil, error)
            }
        }
    }
    
    func getRewardsTransections(completion: @escaping ([RewardDetail]?, Error?) -> ()) {
        API.transactions.request(objectType: [RewardDetail].self) { object, error in
            if let transections = object {
                DispatchQueue.main.async {
                    completion(transections, nil)
                }
            } else {
                completion(nil, error)
            }
        }
    }
    
    func getRewardTransectionDetail(id:String,completion: @escaping (RewardDetail?, Error?) -> ()) {
        API.transactionDetail.request(urlParameter:id, objectType: RewardDetail.self) { object, error in
            if let transectionDetail = object {
                DispatchQueue.main.async {
                    completion(transectionDetail, nil)
                }
            } else {
                completion(nil, error)
            }
        }
    }
}
