package com.cmt.controller

import com.cmt.domain.Item
import com.cmt.services.ItemService
import com.cmt.domain.OrderTrans

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ItemController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    def ItemService itemService

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Item.list(params), model:[itemCount: Item.count()]
    }

    def show(Item item) {
        respond item
    }

    def create() {
        respond new Item(params)
    }

    @Transactional
    def save(Item item) {
        if (item == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (item.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond item.errors, view:'create'
            return
        }
        else {
            item.id =UUID.randomUUID()
        }


        itemService.save(item)
        flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'item.label', default: 'Item'), item.id])
                redirect(uri:'/store/edit/'+item?.store?.id)
            }
            '*' { respond item, [status: CREATED] }
        }
    }

    def edit(Item item) {
        respond item
    }

    @Transactional
    def update(Item item) {
        if (item == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (item.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond item.errors, view:'edit'
            return
        }

        itemService.save(item)
        flush:true


        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'item.label', default: 'Item'), item.id])
                redirect(uri:'/store/edit/'+item?.store?.id)
            }
            '*'{ respond item, [status: OK] }
        }
    }

    @Transactional
    def delete(Item item) {
        if (item == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }
        def orderList = OrderTrans.findAllByItem(item)
        if (orderList.size()>0) {
            flash.message = "Sorry, unable to delete, you have items order"}
        else
        {
            flash.message = "Item deleted, sucessfully !"

            itemService.delete(item)
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
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'item.label', default: 'Item'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
