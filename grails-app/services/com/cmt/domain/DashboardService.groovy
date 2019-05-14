package com.cmt.domain

import grails.transaction.Transactional
import groovy.sql.Sql

@Transactional
class DashboardService {
    def dataSource;
    def fetchtop3customers = {



        def queryResults = OrderTrans.executeQuery("Select  a.customer.id, b.price*a.qty  from OrderTrans a," +
              "Item b where a.item.id = b.id group by a.customer.id, b.price*a.qty ")

        def i=0;

        def topcustomers =[:]
        queryResults.each {
            def customerPrice =topcustomers?.get(it[0])
            def addcustomerPrice=new Double(0)
            if (customerPrice) {
                 addcustomerPrice = customerPrice + it[1]
            }
            else
            {
                addcustomerPrice =new Double(it[1])
            }

            topcustomers.put(it[0],addcustomerPrice)
        }

        def sortedTopCustomers=    topcustomers.sort { new Double(it.value?.toString()) }
        def onlythreecustomers = sortedTopCustomers.iterator().reverse().take(3)
        def onlythreecustomersMap=[:]
        onlythreecustomers.each {
            onlythreecustomersMap.put(it?.key,it?.value)
        }
        return onlythreecustomersMap
    }

    def fetchtop3stores = {



        def queryResults = OrderTrans.executeQuery("Select  a.item.store.id, b.price*a.qty  from OrderTrans a," +
                "Item b where a.item.id = b.id group by a.item.store.id, b.price*a.qty ")

        def i=0;
        def topstores =[:]
        queryResults.each {
            def storePrice =topstores?.get(it[0])
            def addstorePrice=new Double(0)
            if (storePrice) {
                addstorePrice = storePrice + it[1]
            }
            else
            {
                addstorePrice =new Double(it[1])
            }

            topstores.put(it[0],addstorePrice)
        }

        def sortedTopStores=    topstores.sort { new Double(it.value?.toString()) }
        def onlythreestores = sortedTopStores.iterator().reverse().take(3)
        def onlythreestoresMap=[:]
        onlythreestores.each {
            onlythreestoresMap.put(it?.key,it?.value)
        }
        return onlythreestoresMap
    }


    def fetchtop3items = {



        def queryResults = OrderTrans.executeQuery("Select  a.item.id, a.qty  from OrderTrans a" +
                " group by a.item.id, a.qty ")

        def i=0;
        def topitems =[:]
        queryResults.each {
            def itemPrice =topitems?.get(it[0])
            def additemPrice=new Double(0)
            if (itemPrice) {
                additemPrice = itemPrice + it[1]
            }
            else
            {
                additemPrice =new Double(it[1])
            }

            topitems.put(it[0],additemPrice)
        }

        def sortedTopItems=    topitems.sort { new Double(it.value?.toString()) }
        def onlythreeitems = sortedTopItems.iterator().reverse().take(3)
        def onlythreeitemsMap=[:]
        onlythreeitems.each {
            onlythreeitemsMap.put(it?.key,it?.value)
        }
        return onlythreeitemsMap
    }


    def fetchtop3dates = {



        def queryResults = OrderTrans.executeQuery("Select  count(*),concat(month(a.transDate), '-', day(a.transDate),'-', year(a.transDate))  from OrderTrans a" +
                " group by  concat(month(a.transDate), '-', day(a.transDate),'-', year(a.transDate)) ")

        def i=0;
        def topdates =[:]
        queryResults.each {
            topdates.put(it[0],it[1])
        }

        def sortedTopDates=    topdates.sort { new Double(it.key?.toString()) }
        def onlythreedates = sortedTopDates.iterator().reverse().take(3)
        def onlythreedatesMap=[:]
        onlythreedates.each {
            onlythreedatesMap.put(it?.key,it?.value)
        }
        return onlythreedatesMap
    }


    def serviceMethod() {


    }
}
