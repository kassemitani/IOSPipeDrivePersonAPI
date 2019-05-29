//
//  PersonViewModel.swift
//
//  Copyright © 2019 kassem Itani. All rights reserved.
//

struct PersonViewModel {

    var name: String
    var primaryPhone:String?
    var primaryEmail:String?
    var largePictureUrl: String?
    var smallPictureUrl: String?
    var updated_date: String?
    
    init(person: Person) {
        self.name = person.name ?? "No Name"
        self.updated_date = person.updated_time ?? ""
        for phone in person.phone {
            if phone.primary {
                self.primaryPhone = phone.value ?? ""
            }
        }
        for email in person.email {
            if email.primary {
                self.primaryEmail = email.value ?? ""
            }
        }
        for email in person.email {
            if email.primary {
                self.primaryEmail = email.value ?? ""
            }
        }
        for picture in person.pictureId.pictures {
            if picture.key == "128" {
                self.smallPictureUrl = picture.value
            }
            if picture.key == "512" {
                self.largePictureUrl = picture.value
            }
        }
    }
}
