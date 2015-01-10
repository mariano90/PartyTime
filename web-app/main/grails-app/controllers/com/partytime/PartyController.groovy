package com.partytime



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class PartyController {
/*
 def index() {
		User user = User.findById(params.user)
		//render "All parties of ${user}<br/>"
		Set parties = Party.findAllWhere("host": user)
		//render "${parties}"
	}

	def create() {
		User user = User.findById(params.user)
		render "hola"
	}

	def edit() {
		render "TODO: edit party"
	}

	def save() {
		render "TODO: new party was saved"
	}
 */
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Party.list(params), model:[partyInstanceCount: Party.count()]
    }

    def show(Party partyInstance) {
        respond partyInstance
    }

    def create() {
    }

    @Transactional
    def save(Party partyInstance) {
        if (partyInstance == null) {
            notFound()
            return
        }

        if (partyInstance.hasErrors()) {
            respond partyInstance.errors, view:'create'
            return
        }

        partyInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'party.label', default: 'Party'), partyInstance.id])
                redirect partyInstance
            }
            '*' { respond partyInstance, [status: CREATED] }
        }
    }

    def edit(Party partyInstance) {
        respond partyInstance
    }

    @Transactional
    def update(Party partyInstance) {
        if (partyInstance == null) {
            notFound()
            return
        }

        if (partyInstance.hasErrors()) {
            respond partyInstance.errors, view:'edit'
            return
        }

        partyInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Party.label', default: 'Party'), partyInstance.id])
                redirect partyInstance
            }
            '*'{ respond partyInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Party partyInstance) {

        if (partyInstance == null) {
            notFound()
            return
        }

        partyInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Party.label', default: 'Party'), partyInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'party.label', default: 'Party'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
