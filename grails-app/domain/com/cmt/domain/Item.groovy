package com.cmt.domain

class Item implements Serializable{

    String id
    String catalogId
    String descr
    Double price
    Store store
    static mapping = {
        id generator:'assigned'
    }
    static belongsTo = [store: Store]

    static constraints = {
        catalogId blank: false, nullable: false,size:1..30
        descr blank: false, nullable: false,size:1..50
        price blank: false, nullable: false



    }
    static transients = ['longDescr','idDescr']

    public String getLongDescr()
    {
       return descr+'-'+catalogId
    }
    public String getIdDescr()
    {
        return id+','+price
    }

}
