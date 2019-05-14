package com.cmt.controller

import com.cmt.domain.Customer
import com.cmt.services.DashboardService
import com.cmt.domain.Item
import com.cmt.domain.Store

class HomeController {
    def DashboardService dashboardService
    def index() {

        def topcustomersMap = dashboardService.fetchtop3customers()
        def topcustomersMapResults=[:]
        topcustomersMap.each{ k, v ->
            def customer = Customer.findById(k)
            topcustomersMapResults.put(customer.firstName+" "+customer.lastName,v)
        }
        def topstoresMap = dashboardService.fetchtop3stores()
        def topstoresMapResults=[:]
        topstoresMap.each{ k, v ->
            def store = Store.findById(k)
            topstoresMapResults.put(store.storeName,v)
        }

        def topitemsMap = dashboardService.fetchtop3items()
        def topitemsMapResults=[:]
        topitemsMap.each{ k, v ->
            def item = Item.findById(k)
            topitemsMapResults.put("${item.descr} (${item.store.storeName})",v)
        }

        def topdatesMap = dashboardService.fetchtop3dates()
        def topdatesMapResults=[:]
        topdatesMap.each{ k, v ->
            topdatesMapResults.put(k,v)
        }


        render(view:'/index',model:['topcustomersMapResults' :topcustomersMapResults,'topstoresMapResults' :topstoresMapResults,'topitemsMapResults':topitemsMapResults,'topdatesMapResults' :topdatesMapResults])
    }
}
