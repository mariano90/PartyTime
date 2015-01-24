package com.partytime

class Review {
    String title
    String body
    int score
    User author

    static constraints = {
        title blank: false, nullable: false
        body blank: false, nullable: false
        score range: 1..5
        author nullable: false
    }
	
	String toString(){
		return "${title}(${score}/5)"
	}
}
