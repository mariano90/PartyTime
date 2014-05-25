package com.partytime

class MusicStyle {
    String name

    static constraints = {
        name(inList: ["Rock", "Electro", "Reggaeton"])
    }
}
