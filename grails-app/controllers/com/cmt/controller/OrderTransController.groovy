package com.cmt.controller

import com.cmt.domain.Customer
import com.cmt.services.OrderTranService
import com.cmt.domain.OrderTrans
import com.cmt.domain.Store
import com.cmt.domain.Item

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class OrderTransController {
    def OrderTranService orderTranService
    static allowedMethods = [save: "POST", storeChanged: "POST",update: "PUT", delete: "DELETE"]

    def storeChanged(String storeId) {
        Store store = Store.get(storeId)
        def items = []
        if ( store != null ) {
            items = Item.findAllByStore(store)
        }
        render g.select(id:'xxx', name:'xxx',
                from:items, optionKey:'idDescr',optionValue:'longDescr',class:'form-control', noSelection:[null:' ']
                ,onchange:'getPrice(this.value)'
        )
    }

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        if (params?.sortName == 'storeName') {
            respond OrderTrans.list(sort: "store.storeName"), model: [orderTransCount: OrderTrans.count()]
        } else if (params?.sortName == 'itemName')
        {
            respond OrderTrans.list(sort: "item.descr,item.store.storeName"), model: [orderTransCount: OrderTrans.count()]
        }
        else if (params?.sortName == 'transDate')
        {
            respond OrderTrans.list(sort: "transDate",order: 'desc'), model: [orderTransCount: OrderTrans.count()]
        }
        else {
            respond OrderTrans.list(sort: "customer.firstName"), model: [orderTransCount: OrderTrans.count()]
        }
    }

    def show(OrderTrans orderTrans) {
        respond orderTrans
    }

    def create() {
        respond new OrderTrans(params)
    }

    @Transactional
    def save(OrderTrans orderTrans) {
        def customer = Customer.findById(orderTrans.customer)

        def item = Item.findById(orderTrans.orderId);
        def store = Store.findById(orderTrans.store);

        orderTrans.customer = orderTrans.customer;
        orderTrans.item = item;
        orderTrans.store = orderTrans.store;

        if (orderTrans == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        orderTrans.id =UUID.randomUUID()

        orderTrans.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'orderTrans.label', default: 'OrderTrans'), orderTrans.id])
                redirect(uri:'/customer/edit/'+orderTrans?.customer?.id)
            }
            '*' { respond orderTrans, [status: CREATED] }
        }
    }

    def edit(OrderTrans orderTrans) {
        respond orderTrans
    }

    @Transactional
    def update(OrderTrans orderTrans) {
        if (orderTrans == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (orderTrans.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond orderTrans.errors, view:'edit'
            return
        }

        orderTrans.save flush:true


        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'orderTrans.label', default: 'OrderTrans'), orderTrans.id])
                redirect(uri:'/customer/edit/'+orderTrans?.customer?.id)
            }
            '*'{ respond orderTrans, [status: OK] }
        }
    }

    @Transactional
    def delete(OrderTrans orderTrans) {

        if (orderTrans == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }
        def customerId = orderTrans?.customer?.id
        orderTrans.delete flush:true


        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'orderTrans.label', default: 'OrderTrans'), orderTrans.id])
                redirect(uri:'/customer/edit/'+customerId)
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'orderTrans.label', default: 'OrderTrans'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
