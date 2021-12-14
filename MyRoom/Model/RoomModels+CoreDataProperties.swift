//
//  RoomModels+CoreDataProperties.swift
//  MyRoom
//
//  Created by 김우성 on 2021/12/12.
//
//

import Foundation
import CoreData


extension RoomModels {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RoomModels> {
        return NSFetchRequest<RoomModels>(entityName: "RoomModels")
    }

    @NSManaged public var ableDate: Date?
    @NSManaged public var address: String?
    @NSManaged public var buildNum: Int16
    @NSManaged public var completionDate: Date?
    @NSManaged public var deposit: Int16
    @NSManaged public var estateNum: String?
    @NSManaged public var excluSpace: Double
    @NSManaged public var floorNum: Int16
    @NSManaged public var id: Int16
    @NSManaged public var isElevator: Bool
    @NSManaged public var isHeatingIndiv: Bool
    @NSManaged public var isParking: Int16
    @NSManaged public var isShortTerm: Bool
    @NSManaged public var manageFee: Int16
    @NSManaged public var memo: String?
    @NSManaged public var parkingFee: Int16
    @NSManaged public var rentFee: Int16
    @NSManaged public var rentType: String?
    @NSManaged public var roomType: String?
    @NSManaged public var supplySpace: Double
    @NSManaged public var url: String?
    @NSManaged public var windowDir: String?

}

extension RoomModels : Identifiable {

}
