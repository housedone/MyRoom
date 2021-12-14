/*
See LICENSE folder for this sample’s licensing information.

Abstract:
Convenience extensions on system types.
*/

import Foundation
import ARKit

@available(iOS 12.0, *)
extension ARPlaneAnchor.Classification {
    var description: String {
        switch self {
        case .wall:
            return "벽"
        case .floor:
            return "바닥"
        case .ceiling:
            return "천장"
        case .table:
            return "테이블"
        case .seat:
            return "좌석"
        case .none(.unknown):
            return "기타"
        default:
            return ""
        }
    }
}

extension SCNNode {
    func centerAlign() {
        let (min, max) = boundingBox
        let extents = float3(max) - float3(min)
        simdPivot = float4x4(translation: ((extents / 2) + float3(min)))
    }
}

extension float4x4 {
    init(translation vector: float3) {
        self.init(float4(1, 0, 0, 0),
                  float4(0, 1, 0, 0),
                  float4(0, 0, 1, 0),
                  float4(vector.x, vector.y, vector.z, 1))
    }
}
