import Foundation

struct Evses : Codable {
	let id : Int?
//	let groupName : String?
	let connectors : [Connectors]?

	enum CodingKeys: String, CodingKey {

		case id = "id"
//		case groupName = "groupName"
		case connectors = "connectors"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
//		groupName = try values.decodeIfPresent(String.self, forKey: .groupName)
		connectors = try values.decodeIfPresent([Connectors].self, forKey: .connectors)
	}

}
