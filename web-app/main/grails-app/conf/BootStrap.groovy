import com.partytime.Component
import com.partytime.Drink
import com.partytime.Ingredient
import com.partytime.MusicStyle
import com.partytime.Place
import com.partytime.Promo
import com.partytime.QuickParty
import com.partytime.Review
import com.partytime.ScheduledParty
import com.partytime.User

class BootStrap {

	def init = { servletContext ->
		Ingredient botellaGancia = new Ingredient(name: "Botella de Gancia", price: 40.0).save(failOnError: true)
		Ingredient botellaSprite = new Ingredient(name: "Botella de Sprite", price: 10.0).save(failOnError: true)
		Ingredient botellaCoca = new Ingredient(name: "Botella de Coca Cola", price: 10.0).save(failOnError: true)
		Ingredient botellaFernet = new Ingredient(name: "Botella de Fernet", price: 60.0).save(failOnError: true)
		Ingredient botellaCerveza = new Ingredient(name: "Botella de Cerveza", price: 25.0).save(failOnError: true)
		Ingredient botellaVodka = new Ingredient(name: "Botella de Vodka", price: 80.0).save(failOnError: true)
		Ingredient lataEnergizante = new Ingredient(name: "Lata de energizante", price: 5.0).save(failOnError: true)
		Ingredient botellaJugo = new Ingredient(name: "Botella de Jugo", price: 8.0).save(failOnError: true)
		Ingredient botellaChampagne = new Ingredient(name: "Botella de Champagne", price: 120.0).save(failOnError: true)

		Component fernetAl20 = new Component(ingredient: botellaFernet, amount: "20% del vaso").save(failOnError: true)
		Component ganciaAl50 = new Component(ingredient: botellaGancia, amount: "50% del vaso").save(failOnError: true)
		Component cocaAl80 = new Component(ingredient: botellaCoca, amount: "80% del vaso").save(failOnError: true)
		Component spriteAl50 = new Component(ingredient: botellaSprite, amount: "50% del vaso").save(failOnError: true)
		Component cervezaAl100 = new Component(ingredient: botellaCerveza, amount: "todo el vaso").save(failOnError: true)
		Component vodkaAl50 = new Component(ingredient: botellaVodka, amount: "50% del vaso").save(failOnError: true)
		Component energizanteAl30 = new Component(ingredient: lataEnergizante, amount: "30% del vaso").save(failOnError: true)
		Component energizanteAl50 = new Component(ingredient: lataEnergizante, amount: "50% del vaso").save(failOnError: true)
		Component jugoAl20 = new Component(ingredient: botellaJugo, amount: "20% del vaso").save(failOnError: true)
		Component champagneAl70 = new Component(ingredient: botellaChampagne, amount: "70% del vaso").save(failOnError: true)

		Drink ganciaConSprite = new Drink(name: "Gancia con Sprite", components: [ganciaAl50, spriteAl50], preparation:"batir todo y agregar Azucar").save(failOnError: true)
		Drink fernetConCoca = new Drink(name: "Fernet con Coca", components: [fernetAl20, cocaAl80], preparation:"servir primero el Fernet").save(failOnError: true)
		Drink cerveza = new Drink(name: "Cerveza", components: [cervezaAl100], preparation:"servir despacio").save(failOnError: true)
		Drink fuegoSagrado = new Drink(name: "Fuego Sagrado", components: [vodkaAl50, energizanteAl50], preparation:"").save(failOnError: true)
		Drink tropicalEnergy = new Drink(name: "Tropical Energy", components: [
			vodkaAl50,
			energizanteAl30,
			jugoAl20
		], preparation:"").save(failOnError: true)
		Drink acidPsycho = new Drink(name: "Acid Psycho", components: [
			champagneAl70,
			energizanteAl30
		], preparation:"").save(failOnError: true)

		MusicStyle musicStyleRock = new MusicStyle(name: "Rock").save(failOnError: true)
		MusicStyle musicStyleElectro = new MusicStyle(name: "Electro").save(failOnError: true)
		MusicStyle musicStyleReggaeton = new MusicStyle(name: "Reggaeton").save(failOnError: true)
		MusicStyle musicStyleCumbia = new MusicStyle(name: "Cumbia").save(failOnError: true)
		MusicStyle musicStyleUnder = new MusicStyle(name: "Under").save(failOnError: true)
		MusicStyle musicStyle80 = new MusicStyle(name: "80's").save(failOnError: true)

		User user1 = new User(name: "User1", bornDate: new Date()).save(failOnError: true)
		User user2 = new User(name: "User2", bornDate: new Date()).save(failOnError: true)
		User user3 = new User(name: "User3", bornDate: new Date()).save(failOnError: true)

		Review review1 = new Review(title:"review1", body:"body1", score:4, author: user1).save(failOnError: true)
		Review review2 = new Review(title:"review2", body:"body2", score:4, author: user1).save(failOnError: true)
		Review review3 = new Review(title:"review3", body:"body3", score:5, author: user2).save(failOnError: true)

		Promo promo1 = new Promo(title: "2x1 en tragos seleccionados", description: "toda la noche", drink: fernetConCoca).save(failOnError: true)
		Promo promo2 = new Promo(title: "Chicas gratis hasta 2:00 AM", description: "").save(failOnError: true)

		Place place1 = new Place(name: "Sabado fiestero", minimumAge: 18, street: "Av Santa Fe", number:"1234", city:"CABA", reviews: [review1, review3]).save(failOnError: true)
		Place place2 = new Place(name: "El rincon del mal", minimumAge: 18, street: "Av Santa Fe", number:"1111", city:"CABA", reviews: [review2], promos: [promo1, promo2]).save(failOnError: true)
		Place place3 = new Place(name: "Mucha-chica", minimumAge: 21, street: "Av Cordoba", number:"1234", city:"CABA", reviews: [], promos: [promo2]).save(failOnError: true)

		QuickParty quickParty1 = new QuickParty(meetingPoint: "La casa de Lito", host: user1, place: place1, description: "Mi cumple", startDateTime: new Date()).save(failOnError: true)
		QuickParty quickParty2 = new QuickParty(meetingPoint: "La puerta del Dunkue", host: user2, place: place2, description: "Festejemos que estamos vivos", startDateTime: new Date()).save(failOnError: true)

		ScheduledParty scheduledParty1 = new ScheduledParty(drinks: [], dj: user3, barman:user2, host: user3, place: place2, description: "", startDateTime: new Date()).save(failOnError: true)

		//ScheduledParty scheduledParty1 = new ScheduledParty().save()
	}
	def destroy = {
	}
}
