//
//  Producto.swift
//  Session04c
//
//  Created by DAMII on 25/11/24.
//

import SwiftUI

struct Proyecto : Identifiable, Codable {
    let id: UUID
    let titulo: String
    var tareas: [Tarea]
}
