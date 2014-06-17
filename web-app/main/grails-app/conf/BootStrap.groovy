import com.partytime.Component
import com.partytime.Drink
import com.partytime.Ingredient
import com.partytime.MusicStyle
import com.partytime.Place
import com.partytime.Review
import com.partytime.User

class BootStrap {

	def init = { servletContext ->
		Ingredient ingredient1 = new Ingredient(name: "Ingredient1", price: 1.0).save()
		Ingredient ingredient2 = new Ingredient(name: "Ingredient2", price: 2.0).save()
		Ingredient ingredient3 = new Ingredient(name: "Ingredient3", price: 3.0).save()
		Ingredient ingredient4 = new Ingredient(name: "Ingredient4", price: 4.0).save()
		Ingredient ingredient5 = new Ingredient(name: "Ingredient5", price: 5.0).save()
		Ingredient ingredient6 = new Ingredient(name: "Ingredient6", price: 6.0).save()
		Ingredient ingredient7 = new Ingredient(name: "Ingredient7", price: 7.0).save()
		Ingredient ingredient8 = new Ingredient(name: "Ingredient8", price: 8.0).save()
		Ingredient ingredient9 = new Ingredient(name: "Ingredient9", price: 9.0).save()

		Component component11 = new Component(ingredient: ingredient1, amount: "1/2 Litro").save()
		Component component12 = new Component(ingredient: ingredient1, amount: "1 Litro").save()

		Component component21 = new Component(ingredient: ingredient2, amount: "1/4 Litro").save()
		Component component22 = new Component(ingredient: ingredient2, amount: "1/2 Litro").save()
		Component component23 = new Component(ingredient: ingredient2, amount: "1 Litro").save()

		Component component3 = new Component(ingredient: ingredient3, amount: "1 Litro").save()
		Component component4 = new Component(ingredient: ingredient4, amount: "1 Litro").save()
		Component component5 = new Component(ingredient: ingredient5, amount: "1 Litro").save()
		Component component6 = new Component(ingredient: ingredient6, amount: "1 Litro").save()
		Component component7 = new Component(ingredient: ingredient7, amount: "1 Litro").save()

		Drink drink1 = new Drink(name: "drink1", components: [component11, component12], preparation:"batir todo").save()
		Drink drink2 = new Drink(name: "drink2", components: [component21, component3], preparation:"batir todo").save()
		Drink drink3 = new Drink(name: "drink3", components: [component21, component22], preparation:"batir todo").save()
		Drink drink4 = new Drink(name: "drink4", components: [component7], preparation:"batir todo y agregar azucar").save()

		MusicStyle musicStyleRock = new MusicStyle(name: "Rock").save()
		MusicStyle musicStyleElectro = new MusicStyle(name: "Electro").save()
		MusicStyle musicStyleReggaeton = new MusicStyle(name: "Reggaeton").save()

		User user1 = new User(name: "User1", bornDate: new Date()).save()
		User user2 = new User(name: "User2", bornDate: new Date()).save()
		User user3 = new User(name: "User3", bornDate: new Date()).save()

		Review review1 = new Review(title:"review1", body:"body1", score:4, author: user1).save()
		Review review2 = new Review(title:"review2", body:"body2", score:4, author: user1).save()
		Review review3 = new Review(title:"review3", body:"body3", score:5, author: user2).save()

		Place place1 = new Place(name: "place1", minimumAge: 18, street: "Av Santa Fe", number:"1234", city:"CABA", reviews: [review1, review3]).save()
		Place place2 = new Place(name: "place2", minimumAge: 18, street: "Av Santa Fe", number:"1111", city:"CABA", reviews: [review2]).save()
		Place place3 = new Place(name: "place3", minimumAge: 21, street: "Av Cordoba", number:"1234", city:"CABA", reviews: []).save()
	}
	def destroy = {
	}
}
