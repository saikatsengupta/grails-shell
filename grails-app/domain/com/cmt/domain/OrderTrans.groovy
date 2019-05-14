package com.cmt.domain

class OrderTrans implements Serializable{

    String id
    Customer customer
    Item item
    Date transDate
    Store store
    Integer qty
    String orderId //temp creating for view- TODO : will remove

    static mapping = {
        id generator:'assigned'
           }

    static constraints = {
        item blank: false, nullable: false
        qty blank: false, nullable: false,min:1
        transDate blank: true, nullable: true
        orderId blank: true, nullable: true

    }
    static transients = ['totalPrice']

    def beforeInsert() {
        if (transDate==null) {
            transDate = new Date()
        }
    }

    def getTotalPrice() {
        if ((item?.price) && (qty)) {
            return item?.price * qty
        }
    }

}
