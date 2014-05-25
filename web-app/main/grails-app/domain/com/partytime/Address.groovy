package com.partytime

class Address {
    String street
    int number
    String floor
    String apartment
    String city
    String province
    String country

    static constraints = {
        street blank: false, nullable: false
        number blank: false, nullable: false
        city blank: false, nullable: false
        province blank: false, nullable: false
        country blank: false, nullable: false
    }
}
