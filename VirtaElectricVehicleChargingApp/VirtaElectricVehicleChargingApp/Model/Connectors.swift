import Foundation

struct Connectors : Codable {
	let type : String?
	let maxKw : Int?

	enum CodingKeys: String, CodingKey {

		case type = "type"
		case maxKw = "maxKw"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		type = try values.decodeIfPresent(String.self, forKey: .type)
		maxKw = try values.decodeIfPresent(Int.self, forKey: .maxKw)
	}

}
