package com.cmt.domain

class Customer implements Serializable{

    String id
    String firstName
    String lastName
    String address1
    String address2
    String city
    String state
    String zip
    String phone
    Date dateofBirth

    static mapping = {
        id generator:'assigned'
    }
    static transients = ['displayName']

    static constraints = {
        firstName blank: false, nullable: false,size:1..30
        lastName blank: false, nullable: false,size:1..30
        address1 blank: false, nullable: false,size:1..50
        address2 blank: true, nullable: true,size:1..50
        city blank: false, nullable: false,size:1..30
        state(blank: false, nullable: false,  inList: ["AL","AK","AS","AZ","AR","CA","CO","CT","DE","DC","FM","FL","GA","GU","HI","ID","IL","IN","IA","KS","KY","LA","ME","MH","MD","MA","MI","MN","MS","MO","MT","NE","NV","NH","NJ","NM","NY","NC","ND","MP","OH","OK","OR","PW","PA","PR","RI","SC","SD","TN","TX","UT","VT","VI","VA","WA","WV","WI","WY"])
        zip blank: false, nullable: false,size:1..5
        phone blank: true, nullable: true,size:1..10
        dateofBirth blank: true, nullable: true


    }

    public String getDisplayName() {
        return firstName+' ' +lastName
    }


}
