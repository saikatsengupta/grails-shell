package com.cmt.services

import grails.transaction.Transactional

@Transactional
class ItemService {

    def save(item)
    {
        // In real application, we can call Micro Service to persist the data , or Call the database to persist.
        item.save()
        return true
    }
    def delete(item) {
        item.delete()
        return true
    }

}
