//
//  Tarea.swift
//  Session04c
//
//  Created by DAMII on 25/11/24.
//

import SwiftUI

struct Tarea: Identifiable, Codable {
    let id: UUID
    let titulo: String
}

/////////
///
/// String "Hola mundo" -> codificación -> "Hola mundo"
/// Int 2 -> codificación -> "2"
/// [Proyecto]:
///  [
///  Proyecto(titulo: "proyecto 01", tareas: [Tarea(titulo:"Tarea A"), Tarea(titulo:"Tarea B")]),
///  Proyecto(titulo: "proyecto 02", tareas: [Tarea(titulo:"Tarea C"), Tarea(titulo:"Tarea D")])
///  ]
///  > codificación ->
///         [
///             {"titulo": "proyecto 01", "tareas": [ {...} , {...} ]},
///             {"titulo": "proyecto 02", "tareas": [ {...} , {...} ]}
///         ]
