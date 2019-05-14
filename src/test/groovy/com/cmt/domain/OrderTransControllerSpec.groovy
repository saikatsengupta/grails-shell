package com.cmt.domain

import com.cmt.controller.OrderTransController
import grails.test.mixin.*
import spock.lang.*

@TestFor(OrderTransController)
@Mock(OrderTrans)
class OrderTransControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null

        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
        assert false, "TODO: Provide a populateValidParams() implementation for this generated test suite"
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.orderTransList
            model.orderTransCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.orderTrans!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'POST'
            def orderTrans = new OrderTrans()
            orderTrans.validate()
            def customer =new Customer(firstName: 'John', lastName: 'Doe', address1:'XXXX',address2:'AAAAA',city:'Madison',state:'WI',zip:'53719',dateofBirth:new Date())
            customer.id = UUID.randomUUID();
            def store =new Store(storeName: 'Shopify',  address1:'AAAAAA',address2:'',city:'Madison',state:'WI',zip:'53719',typeofGoods:'Grocery,Handi-crafts')
            store.id = UUID.randomUUID();
            def item =new Item(catalogId: 'Shopify-001',  descr:'Paper Machie',price:new Double(10.99),store:store)
            item.id = UUID.randomUUID();
            orderTrans =new OrderTrans(customer: customer,  item:item,transDate: new Date()-2,store:store,qty:5,orderId:item?.id)
            orderTrans.id = UUID.randomUUID();
            controller.save(orderTrans)

        then:"The create view is rendered again with the correct model"
            model.orderTrans!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            orderTrans = new OrderTrans(params)

            controller.save(orderTrans)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/orderTrans/show/1'
            controller.flash.message != null
            OrderTrans.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def orderTrans = new OrderTrans(params)
            controller.show(orderTrans)

        then:"A model is populated containing the domain instance"
            model.orderTrans == orderTrans
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def orderTrans = new OrderTrans(params)
            controller.edit(orderTrans)

        then:"A model is populated containing the domain instance"
            model.orderTrans == orderTrans
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'PUT'
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/orderTrans/index'
            flash.message != null

        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def orderTrans = new OrderTrans()
            orderTrans.validate()
            controller.update(orderTrans)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.orderTrans == orderTrans

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            orderTrans = new OrderTrans(params).save(flush: true)
            controller.update(orderTrans)

        then:"A redirect is issued to the show action"
            orderTrans != null
            response.redirectedUrl == "/orderTrans/show/$orderTrans.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'DELETE'
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/orderTrans/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def orderTrans = new OrderTrans(params).save(flush: true)

        then:"It exists"
            OrderTrans.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(orderTrans)

        then:"The instance is deleted"
            OrderTrans.count() == 0
            response.redirectedUrl == '/orderTrans/index'
            flash.message != null
    }
}
