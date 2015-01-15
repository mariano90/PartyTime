import com.grailsrocks.authentication.AuthenticationUser
import com.grailsrocks.authentication.AuthenticationService
import com.partytime.Bar
import com.partytime.Component
import com.partytime.Drink
import com.partytime.Ingredient
import com.partytime.MusicStyle
import com.partytime.News
import com.partytime.Promo
import com.partytime.PublicEvent
import com.partytime.Review
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

		User userf = new User(name: "fabricio", bornDate: new Date()).save(failOnError: true)
		// TODO: link mode users with plugin authentication users.
//		assert new AuthenticationUser( login:'fabricio', password:'123456'.encodeAsMD5(), email:'someone@somewhere.com',
//		status:AuthenticationService.STATUS_VALID).save()
		User userm = new User(name: "mariano", bornDate: new Date()).save(failOnError: true)
		User user1 = new User(name: "user1", bornDate: new Date()).save(failOnError: true)
		User user2 = new User(name: "user2", bornDate: new Date()).save(failOnError: true)
		User user3 = new User(name: "user3", bornDate: new Date()).save(failOnError: true)
		User user4 = new User(name: "user4", bornDate: new Date()).save(failOnError: true)
		User user5 = new User(name: "user5", bornDate: new Date()).save(failOnError: true)
		
		userm.preferedDrinks.add(fernetConCoca)
		userm.preferedDrinks.add(cerveza)
		userm.save()

		Review review1 = new Review(title:"review1", body:"body1", score:4, author: user1).save(failOnError: true)
		Review review2 = new Review(title:"review2", body:"body2", score:4, author: user1).save(failOnError: true)
		Review review3 = new Review(title:"review3", body:"body3", score:5, author: user2).save(failOnError: true)

		Promo promo1 = new Promo(title: "2x1 en tragos seleccionados", description: "toda la noche", drink: fernetConCoca).save(failOnError: true)
		Promo promo2 = new Promo(title: "Chicas gratis hasta 2:00 AM", description: "").save(failOnError: true)

		Bar place0 = new Bar(name: "Ninguno", minimumAge: 0, street: "-", number:"0", city:"-", reviews: []).save(failOnError: true)
		Bar place1 = new Bar(name: "Sabado fiestero", minimumAge: 18, street: "Av Santa Fe", number:"1234", city:"CABA", reviews: [review1, review3]).save(failOnError: true)
		Bar place2 = new Bar(name: "El rincon del mal", minimumAge: 18, street: "Av Santa Fe", number:"1111", city:"CABA", reviews: [review2], promos: [promo1, promo2]).save(failOnError: true)
		Bar place3 = new Bar(name: "Mucha-chica", minimumAge: 21, street: "Av Cordoba", number:"1234", city:"CABA", reviews: [], promos: [promo2]).save(failOnError: true)

		new News(title:"Noticia 1", description: "Lorem ipsum dolor sit amet, vim ad affert putant verear. Accusata iracundia pro id."
		,date: "2015/01/01",	imageUrl:"").save(failOnError: true)
		new News(title:"Noticia 2", description: "Lorem ipsum dolor sit amet, vim ad affert putant verear. Accusata iracundia pro id."
		,date: "2015/01/01",	imageUrl:"").save(failOnError: true)
		new News(title:"Noticia 3", description: "Lorem ipsum dolor sit amet, vim ad affert putant verear. Accusata iracundia pro id."
		,date: "2015/01/04",	imageUrl:"").save(failOnError: true)
		new News(title:"Noticia 4", description: "Lorem ipsum dolor sit amet, vim ad affert putant verear. Accusata iracundia pro id."
		,date: "2015/01/07",	imageUrl:"").save(failOnError: true)

		new PublicEvent(
				title:"Creamfields",
				description:"...",
				lineup:"...",
				minimumAge:18,
				startDateTime: new Date(),
				externalUrl:"...",
				address:"..."
				).save(failOnError: true)
		new PublicEvent(
				title:"Ultramusic Festival",
				description:"...",
				lineup:"...",
				minimumAge:18,
				startDateTime: new Date(),
				externalUrl:"...",
				address:"..."
				).save(failOnError: true)
		new PublicEvent(
				title:"Tomorrowland",
				description:"...",
				lineup:"...",
				minimumAge:0,
				startDateTime: new Date(),
				externalUrl:"...",
				address:"..."
				).save(failOnError: true)
		new PublicEvent(
				title:"Cirque du Soleil",
				description:"...",
				lineup:"...",
				minimumAge:0,
				startDateTime: new Date(),
				externalUrl:"...",
				address:"..."
				).save(failOnError: true)
		new PublicEvent(
				title:"David Copperfield",
				description:"...",
				lineup:"...",
				minimumAge:18,
				startDateTime: new Date(),
				externalUrl:"...",
				address:"..."
				).save(failOnError: true)
	}

	def destroy = {
	}
}
