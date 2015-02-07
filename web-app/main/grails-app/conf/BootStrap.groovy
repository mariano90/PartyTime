import com.grailsrocks.authentication.AuthenticationUser
import com.grailsrocks.authentication.AuthenticationService
import com.partytime.Bar
import com.partytime.Component
import com.partytime.Drink
import com.partytime.Ingredient
import com.partytime.MusicStyle
import com.partytime.News
import com.partytime.Party
import com.partytime.Promo
import com.partytime.PublicEvent
import com.partytime.Review
import com.partytime.User


class BootStrap {

	def init = { servletContext ->
		Ingredient botellaGancia = new Ingredient(name: "Gancia", price: 40.0).save(failOnError: true)
		Ingredient botellaSprite = new Ingredient(name: "Sprite", price: 10.0).save(failOnError: true)
		Ingredient botellaCoca = new Ingredient(name: "Coca Cola", price: 10.0).save(failOnError: true)
		Ingredient botellaFernet = new Ingredient(name: "Fernet", price: 60.0).save(failOnError: true)
		Ingredient botellaCerveza = new Ingredient(name: "Cerveza", price: 25.0).save(failOnError: true)
		Ingredient botellaVodka = new Ingredient(name: "Vodka", price: 80.0).save(failOnError: true)
		Ingredient lataEnergizante = new Ingredient(name: "Energizante", price: 5.0).save(failOnError: true)
		Ingredient botellaJugo = new Ingredient(name: "Jugo de naranja", price: 8.0).save(failOnError: true)
		Ingredient botellaChampagne = new Ingredient(name: "Champagne", price: 120.0).save(failOnError: true)

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

		User userf = new User(name: "qweqwe",
			bornDate: new Date(), mail: "qwe@qwe.com"
			).save(failOnError: true)
		userf.preferedDrinks.add(tropicalEnergy)
		userf.preferedDrinks.add(acidPsycho)
		userf.preferedMusicStyles.add(musicStyleRock)
		userf.preferedMusicStyles.add(musicStyleElectro)
		userf.save()
//		assert new AuthenticationUser( login:'fabricio',
//			password:'123456'.encodeAsMD5(),
//			email:'someone@somewhere.com',
//			status:AuthenticationService.STATUS_VALID).save()
		
		
		User user01 = new User(name: "asdasd",
			bornDate: new Date(), mail: "asd@asd.com").save(failOnError: true)
		User user02 = new User(name: "zxczxc",
			bornDate: new Date(), mail: "zxc@zxc.com").save(failOnError: true)
		User user03 = new User(name: "user03",
			bornDate: new Date(), mail: "user03@gmail.com").save(failOnError: true)
		User user04 = new User(name: "user04",
			bornDate: new Date(), mail: "user04@gmail.com").save(failOnError: true)
		User user05 = new User(name: "user05",
			bornDate: new Date(), mail: "user05@gmail.com").save(failOnError: true)
		User user06 = new User(name: "user06",
			bornDate: new Date(), mail: "user06@gmail.com").save(failOnError: true)

		user01.preferedDrinks.add(fernetConCoca)
		user01.preferedDrinks.add(ganciaConSprite)
		user01.preferedMusicStyles.add(musicStyle80)
		user01.save()
		
		user02.preferedDrinks.add(fernetConCoca)
		user02.preferedDrinks.add(fuegoSagrado)
		user02.preferedMusicStyles.add(musicStyleUnder)
		user02.save()
		
		user03.preferedDrinks.add(fuegoSagrado)
		user03.preferedDrinks.add(cerveza)
		user03.save()
		
		user04.preferedDrinks.add(ganciaConSprite)
		user04.preferedDrinks.add(fuegoSagrado)
		user04.save()
		
		user05.preferedDrinks.add(fuegoSagrado)
		user05.preferedDrinks.add(ganciaConSprite)
		user05.save()
		
		user06.preferedDrinks.add(fernetConCoca)
		user06.preferedDrinks.add(ganciaConSprite)
		user06.save()

		Review review1 = new Review(title:"Bueno en pareja",
			body:"Fue una increible salida conmi novia, y eso que soy informatico.",
			score:4,
			author: user02).save(failOnError: true)
		Review review2 = new Review(title:"Me gusta el ron",
			body:"Fuimos al lugar disfrazados de piratas, que mejor sorpresa que ordenar un buen ron y disfrutar el botin todos juntos, arrrghhh.",
			score:4,
			author: user02).save(failOnError: true)
		Review review3 = new Review(title:"Lo vi a Harry Potter!",
			body:"Al entrar al lugar note alguien haciendo magia, fue una noche increible con el show de luces.",
			score:5,
			author: user03).save(failOnError: true)

		Promo promo1 = new Promo(title: "2x1 en tragos seleccionados",
			description: "toda la noche",
			drink: fernetConCoca).save(failOnError: true)
		Promo promo2 = new Promo(title: "Chicas gratis hasta 2:00 AM",
			description: "").save(failOnError: true)

		Bar place0 = new Bar(name: "Groove",
			minimumAge: 0,
			street: "-",
			number:"0",
			city:"-",
			musicStyles: [musicStyleRock],
			reviews: []).save(failOnError: true)
		Bar place1 = new Bar(name: "Brook on brails",
			minimumAge: 18,
			street: "Av Santa Fe",
			number:"1234",
			city:"CABA",
			musicStyles: [musicStyleElectro],
			reviews: [review1, review3]
			).save(failOnError: true)
		Bar place2 = new Bar(name: "El rincon del mal",
			minimumAge: 18,
			street: "Av Santa Fe",
			number:"1111",
			city:"CABA",
			musicStyles: [musicStyleReggaeton, musicStyleUnder, musicStyleCumbia],
			reviews: [review2],
			promos: [promo1, promo2]
			).save(failOnError: true)
		Bar place3 = new Bar(name: "Mucha-chica",
			minimumAge: 21,
			street: "Av Cordoba",
			number:"1234",
			city:"CABA",
			musicStyles: [musicStyle80, musicStyleRock],
			reviews: [],
			promos: [promo2]).save(failOnError: true)
		Bar place4 = new Bar(name: "La casa embrujada de Palermo",
			minimumAge: 21,
			street: "Av Corrientes",
			number:"1234",
			city:"CABA",
			musicStyles: [musicStyleRock, musicStyleUnder],
			reviews: [],
			promos: []).save(failOnError: true)
			
			userf.favoriteBars.add(place1)
			userf.save()

		new News(title:"Lanzamos Party Time!",
			description: "Lorem ipsum dolor sit amet, vim ad affert putant verear. Accusata iracundia pro id.",
			date: new Date(1429066800000L),
			imageUrl:"").save(failOnError: true)
		new News(title:"Soportamos iPhone y Android",
			description: "Lorem ipsum dolor sit amet, vim ad affert putant verear. Accusata iracundia pro id.",
			date: new Date(1428066810000L),
			imageUrl:"").save(failOnError: true)
		new News(title:"Aniversario Party Time, 50% descuento en todo!",
			description: "Lorem ipsum dolor sit amet, vim ad affert putant verear. Accusata iracundia pro id.",
			date: new Date(1427066820000L),
			imageUrl:"").save(failOnError: true)
		new News(
			title:"Noticia 4",
			description: "Lorem ipsum dolor sit amet, vim ad affert putant verear. Accusata iracundia pro id.",
			date: new Date(1426066830000L),
			imageUrl:""
			).save(failOnError: true)

		new PublicEvent(
			title:"Creamfields",
			description:"La fiesta de musica electronica mas famosa del mundo",
			lineup:"Tiesto, Axwel, Swedish House Mafia",
			minimumAge:18,
			startDateTime: new Date(1429067000000L),
			externalUrl:"http://www.creamfields.com/",
			address:"Puerto Madero, CABA"
			).save(failOnError: true)
		new PublicEvent(
			title:"Ultramusic Festival",
			description:"",
			lineup:"Pinion Fijo, Bala y cirqueros",
			minimumAge:18,
			startDateTime: new Date(1429066100000L),
			externalUrl:"",
			address:"Autodromo, CABA"
			).save(failOnError: true)
		new PublicEvent(
			title:"Tomorrowland",
			description:"DJs lideres",
			lineup:"",
			minimumAge:0,
			startDateTime: new Date(1429066200000L),
			externalUrl:"http://www.tomorrowland.com/global-splash/",
			address:"Belgium"
			).save(failOnError: true)
		new PublicEvent(
			title:"Cirque du Soleil",
			description:"Veni a ver Ka, el show mas espectacular de circo a nivel mundial.",
			lineup:"",
			minimumAge:0,
			startDateTime: new Date(1420081200000L),
			externalUrl:"http://www.cirquedusoleil.com",
			address:"Teatro Colon, CABA"
			).save(failOnError: true)
		new PublicEvent(
			title:"David Copperfield",
			description:"¿Te gusta la magia?",
			lineup:"",
			minimumAge:9,
			startDateTime: new Date(1429066800000L),
			externalUrl:"",
			address:"Las Vegas, NV, USA"
			).save(failOnError: true)

		Party party1 = new Party(host: userf,
			place: place1,
			title: "Fiesta1",
			description: "...",
			startDateTime: new Date(1429066800000L),
			finsishDateTime: new Date(1429066900000L),
			guestsInvited: [user02, user03, user06]
			).save(failOnError: true)
		Party party2 = new Party(host: user01,
			place: place1,
			title: "Fiesta2",
			description: "...",
			startDateTime: new Date(1429066800000L),
			finsishDateTime: new Date(1429066900000L),
			guestsInvited: [user02, user03, userf]
			).save(failOnError: true)
		Party party3 = new Party(host: userf,
			place: place1,
			title: "Fiesta3",
			description: "...",
			startDateTime: new Date(1429076800000L),
			finsishDateTime: new Date(1429076900000L),
			guestsInvited: [user02, user03, user04, user05]
			).save(failOnError: true)
		Party party4 = new Party(host: userf,
			place: place1,
			title: "Fiesta4",
			description: "...",
			startDateTime: new Date(1420081200000L),
			finsishDateTime: new Date(1420082200000L),
			guestsInvited: [user01, user02, user03]
			).save(failOnError: true)
	}

	def destroy = {
	}
}
