package com.cmt.controller

import com.cmt.services.CustomerService
import com.cmt.domain.OrderTrans

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import com.cmt.domain.Customer
@Transactional(readOnly = true)
class CustomerController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    def CustomerService customerService
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Customer.list(params), model:[customerCount: Customer.count()]
    }

    def show(Customer customer) {
        respond customer
    }

    def create() {
        respond new Customer(params)
    }

    @Transactional
    def save(Customer customer) {
        if (customer == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }
        else {
            customer.id =UUID.randomUUID()
        }

        if (customer.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond customer.errors, view:'create'
            return
        }

        customerService.save(customer)
        flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'customer.label', default: 'Customer'), customer.id])
                redirect(action: "index")
            }
            '*' { respond customer, [status: CREATED] }
        }
    }

    def edit(Customer customer) {
        def orderTransList= OrderTrans.findAllByCustomer(customer)
        respond customer, model:['orderTransList': orderTransList]
    }

    @Transactional
    def update(Customer customer) {
        if (customer == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (customer.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond customer.errors, view:'edit'
            return
        }

        customerService.save(customer)
        flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'customer.label', default: 'Customer'), customer.id])
                redirect(action: "index")
            }
            '*'{ respond customer, [status: OK] }
        }


    }

    @Transactional
    def delete(Customer customer) {
        if (customer == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        def orderList = OrderTrans.findAllByCustomer(customer)
        if (orderList.size()>0) {
            flash.message = "Sorry, unable to delete, you have items order under this customer"}
        else
        {
            flash.message = "Customer deleted, sucessfully !"

            customerService.delete(customer)
            flush:true

        }


        request.withFormat {
            form multipartForm {
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }



    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'customer.label', default: 'Customer'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
