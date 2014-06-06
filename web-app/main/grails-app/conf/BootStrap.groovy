import com.partytime.Component
import com.partytime.Ingredient

class BootStrap {

	def init = { servletContext ->
		Ingredient ingredient1 = new Ingredient(name: "nam1", price: 1.0).save()
		Component component1 = new Component(ingredient: ingredient1, amount: "1 L").save()
	}
	def destroy = {
	}
}
