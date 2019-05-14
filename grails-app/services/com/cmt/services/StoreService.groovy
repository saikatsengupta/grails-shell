package com.cmt.services

import grails.transaction.Transactional

@Transactional
class StoreService {

    def save(store)
    {
        // In real application, we can call Micro Service to persist the data , or Call the database to persist.
        store.save()
        return true
    }
    def delete(store) {
        store.delete()
        return true
    }

}
