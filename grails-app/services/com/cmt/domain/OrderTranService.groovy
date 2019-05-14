package com.cmt.domain

import grails.transaction.Transactional

@Transactional
class OrderTranService {

    def save(orderTrans)
    {
        // In real application, we can call Micro Service to persist the data , or Call the database to persist.
        orderTrans.save()
        return true
    }
    def delete(orderTrans) {
        orderTrans.delete()
        return true
    }

}