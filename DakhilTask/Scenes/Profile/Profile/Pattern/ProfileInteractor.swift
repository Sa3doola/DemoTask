//
//  ProfileInteractor.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/29/21.
//

import Alamofire

class ProfileInteractor {
    
    func getProfileData(completion: @escaping completion<UserProfileModel>) {
        AF.request(APIRouter.profile).responseDecodable { (response) in
            completion(response.result)
        }
    }
    var headers:HTTPHeaders{
        var headers = HTTPHeaders()
        headers["Accept"] = "application/json"
        headers["Authorization"] = "Bearer " + (UserDefaults.standard.loadToken() ?? "")
        headers["lang"] = "en"
        return headers
    }
    
    func uploadImage(name: String, phone: String, cityID: Int, uuid: String, image: Data, fileName: String, completion: @escaping completion<UserProfileModel>) {
        let body: [String: String] = ["name": name,
                                      "phone": phone,
                                      "city_id": "\(cityID)",
                                      "uuid": uuid
        ]
        
        AF.upload(multipartFormData: { (MultipartFormData) in
            MultipartFormData.append(image, withName: "avatar", fileName: fileName, mimeType: "image/png")
            for (key, value) in body {
                MultipartFormData.append(value.data(using: .utf8)!, withName: key)
            }
        }, with: APIRouter.updateProfile(name: name, phone: phone, cityId: cityID, uuid: uuid)).responseDecodable { (response) in
            completion(response.result)
        }
    }
}


//func updateAccount(username: String?, phone: String?, cityId: Int?, catId: Int?, storeName: String?, address: String?, lat: String?, lng: String?, image: UIImageView?, commercialNum: String?, liceneimage: UIImageView?){
//
//        var body : [String: String] = ["name": username ?? "",
//                                      "phone": phone ?? "",
//                                      "city_id": "\(cityId ?? 0)",
//                                      "lat":lat ?? "",
//                                      "lng":lng ?? "",
//                                      "address":address ?? "",
//                                      "category_id":"\(catId ?? 0)",
//                                      "store_name":storeName ?? "",
//                                      "uuid":Defaults.getUserUUID() ?? "",
//                                      "commercial_num":commercialNum ?? ""
//        ]
//
//        self.startAnimating()
//
//        let timestamp = NSDate().timeIntervalSince1970 // just for some random name.
//
//        AF.upload(multipartFormData: { (multipartFormData) in
//
//            if !self.showImg.isEmpty {
//                multipartFormData.append(self.showImg[0].imgData, withName: "avatar", fileName: "\(timestamp).png", mimeType: "image/png")
//
//            }
//
//            if !self.showLicene.isEmpty {
//                multipartFormData.append(self.showLicene[0].imgData, withName: "licence", fileName: "\(timestamp).png", mimeType: "image/png")
//
//            }
//
//            for (key , value) in body {
//
//                multipartFormData.append(value.data(using: .utf8)!, withName: key)
//            }
//
//
//
//        }, to: URLs.updateProvider , headers: Headers.header ).responseJSON { (response) in
//
//
//            do {
//                let data = try JSONDecoder().decode(ProviderProfileSuccessModel.self, from: response.data!)
//                print(data.code ?? 0)
//
//                self.stopAnimating()
//
//                Defaults.saveUserName(name: self.profileData?.data?.userBaseInfo?.name)
//                Defaults.saveUserAvetear(avatar: self.profileData?.data?.userBaseInfo?.image)
//                Defaults.saveUserPhone(phone: self.profileData?.data?.userBaseInfo?.phone)
//                Defaults.saveUserCity(city: self.profileData?.data?.userBaseInfo?.cityName)
//
//                Alert.createSuccessAlert(msg: data.msg ?? "")
//
//                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+2) {
//                    self.dismiss(animated: true, completion: nil)
//                    self.navigationController?.popViewController(animated: true)
//                }
//
//            }catch{
//                print(error)
//                self.stopAnimating()
//                Alert.createFailAlert(msg: "")
//
//                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+2) { [self] in
//                    self.dismiss(animated: true, completion: nil)
//                }
//            }
//
//
//        }
//    }
