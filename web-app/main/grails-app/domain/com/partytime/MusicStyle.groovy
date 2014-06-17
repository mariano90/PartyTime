package com.partytime

class MusicStyle {
    String name

    static constraints = {
        name(inList: ["Rock", "Electro", "Reggaeton"]) // TODO more types
    }
	
	String toString(){
		return "${name}"
	}
}
