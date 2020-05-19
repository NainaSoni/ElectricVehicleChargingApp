import Foundation

struct StationModel : Codable {
	let id : Int?
//	let latitude : Double?
//	let longitude : Double?
//	let icon : Int?
	let name : String?
	let city : String?
	let address : String?
//	let provider : String?
//	let evses : [Evses]?
//	let isRemoved : Bool?
//	let isPrivate : Bool?

	enum CodingKeys: String, CodingKey {

		case id = "id"
//		case latitude = "latitude"
//		case longitude = "longitude"
//		case icon = "icon"
		case name = "name"
		case city = "city"
		case address = "address"
//		case provider = "provider"
//		case evses = "evses"
//		case isRemoved = "isRemoved"
//		case isPrivate = "isPrivate"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
//		latitude = try values.decodeIfPresent(Double.self, forKey: .latitude)
//		longitude = try values.decodeIfPresent(Double.self, forKey: .longitude)
//		icon = try values.decodeIfPresent(Int.self, forKey: .icon)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		city = try values.decodeIfPresent(String.self, forKey: .city)
		address = try values.decodeIfPresent(String.self, forKey: .address)
//		provider = try values.decodeIfPresent(String.self, forKey: .provider)
//		evses = try values.decodeIfPresent([Evses].self, forKey: .evses)
//		isRemoved = try values.decodeIfPresent(Bool.self, forKey: .isRemoved)
//		isPrivate = try values.decodeIfPresent(Bool.self, forKey: .isPrivate)
	}

}
