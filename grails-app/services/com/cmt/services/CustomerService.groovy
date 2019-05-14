package com.cmt.services

import grails.transaction.Transactional

@Transactional
class CustomerService {

    def save(customer)
    {
        // In real application, we can call Micro Service to persist the data , or Call the database to persist.
        customer.save()
        return true
    }
    def delete(customer) {
        customer.delete()
        return true
    }

}
