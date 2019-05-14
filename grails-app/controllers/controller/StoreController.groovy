package controller

import com.cmt.domain.Item
import com.cmt.domain.OrderTrans
import com.cmt.domain.Store
import com.cmt.domain.StoreService

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class StoreController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    def StoreService storeService

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Store.list(params), model:[storeCount: Store.count()]
    }

    def show(Store store) {
        respond store
    }

    def create() {
        respond new Store(params)
    }

    @Transactional
    def save(Store store) {
        store.typeofGoods =store?.typeofGoods?.toString()
        if (store == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (store.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond store.errors, view:'create'
            return
        }else {
            store.id =UUID.randomUUID()
        }

        storeService.save(store)
        flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'store.label', default: 'Store'), store.id])
                redirect(action: "index")
            }
            '*' { respond store, [status: CREATED] }
        }
    }

    def edit(Store store) {
        def itemList= Item.findAllByStore(store)
        respond store, model:[itemList: itemList]
    }

    @Transactional
    def update(Store store) {
        if (store == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (store.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond store.errors, view:'edit'
            return
        }

        storeService.save(store)
        flush:true


        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'store.label', default: 'Store'), store.id])
                redirect(action: "index")
            }
            '*'{ respond store, [status: OK] }
        }
    }

    @Transactional
    def delete(Store store) {
        if (store == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }
        if (store?.items?.size()>0){
            flash.message = "Store cannot be deleted, since items found  !"
        }
        else {

            def orderList = OrderTrans.findAllByStore(store)
            if (orderList.size()>0) {
                flash.message = "Sorry, unable to delete, you have items order under this Store"}
            else
            {
                storeService.delete(store)
                flush:true
                flash.message = "Store deleted, sucessfully !"
            }

        }
        request.withFormat {
            form multipartForm {
                //flash.message = message(code: 'default.deleted.message', args: [message(code: 'store.label', default: 'Store'), store.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'store.label', default: 'Store'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
