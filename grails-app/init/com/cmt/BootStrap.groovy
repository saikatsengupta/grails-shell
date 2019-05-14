package com.cmt

import com.cmt.domain.Customer
import com.cmt.domain.Item
import com.cmt.domain.OrderTrans
import com.cmt.domain.Store

class BootStrap {

    def init = { servletContext ->
            //Loaded dummy data to display the dashboard
            def customer,customer1,customer2,customer3,customer4
            if (Customer.count() == 0) {
                customer =new Customer(firstName: 'John', lastName: 'Doe', address1:'XXXX',address2:'AAAAA',city:'Madison',state:'WI',zip:'53719',dateofBirth:new Date())
                customer.id = UUID.randomUUID();
                customer.save();
                customer1 =new Customer(firstName: 'Kris', lastName: 'Smith', address1:'YYYYYY',address2:'',city:'Madison',state:'WI',zip:'53719',dateofBirth:new Date())
                customer1.id = UUID.randomUUID();
                customer1.save();
                customer2 =new Customer(firstName: 'Nick', lastName: 'Jones', address1:'AAAAAA',address2:'',city:'Madison',state:'WI',zip:'53719',dateofBirth:new Date())
                customer2.id = UUID.randomUUID();
                customer2.save();
                customer3 =new Customer(firstName: 'Sara', lastName: 'Boden', address1:'BBBBB',address2:'CCCCC',city:'Madison',state:'WI',zip:'53719',dateofBirth:new Date())
                customer3.id = UUID.randomUUID();
                customer3.save();
                customer4 =new Customer(firstName: 'Dana', lastName: 'Kim', address1:'CCCCC',address2:'',city:'Madison',state:'WI',zip:'53719',dateofBirth:new Date())
                customer4.id = UUID.randomUUID();
                customer4.save();

            }
            def store,store1,store2,store3,store4,store5
            if (Store.count() == 0) {
                store =new Store(storeName: 'Shopify',  address1:'AAAAAA',address2:'',city:'Madison',state:'WI',zip:'53719',typeofGoods:'Grocery,Handi-crafts')
                store.id = UUID.randomUUID();
                store.save();
                store1 =new Store(storeName: 'Etsy',  address1:'BBBBB',address2:'',city:'Madison',state:'CA',zip:'53719',typeofGoods:'Handicraft,Jewellery')
                store1.id = UUID.randomUUID();
                store1.save();
                store2 =new Store(storeName: 'Amazon',  address1:'CCCCCC',address2:'',city:'Madison',state:'IL',zip:'53719',typeofGoods:'Grocery,Jewellery,Books')
                store2.id = UUID.randomUUID();
                store2.save();
                store3 =new Store(storeName: 'Walmart',  address1:'DDDDD',address2:'',city:'Madison',state:'WI',zip:'53719',typeofGoods:'Furniture,Grocery,Jewellery')
                store3.id = UUID.randomUUID();
                store3.save();
                store4 =new Store(storeName: 'Bestbuy',  address1:'EEEEE',address2:'',city:'Madison',state:'MA',zip:'53719',typeofGoods:'Electronics,Appliances')
                store4.id = UUID.randomUUID();
                store4.save();
                store5 =new Store(storeName: 'Boston',  address1:'FFFFFFF',address2:'',city:'Madison',state:'WI',zip:'53719',typeofGoods:'Clothes,Furniture,Jewellery')
                store5.id = UUID.randomUUID();
                store5.save();

            }
            def item,item1,item2,item3,item4,item5,item6,item7,item8,item9,item10,item11,item12,item13,item14,item15,item16,item17,item18,item19,item20
            if (Item.count() == 0) {

                item =new Item(catalogId: 'Shopify-001',  descr:'Paper Machie',price:new Double(10.99),store:store)
                item.id = UUID.randomUUID();
                item.save();

                item1 =new Item(catalogId: 'Shopify-002',  descr:'Vegetable Bag',price:new Double(4),store:store)
                item1.id = UUID.randomUUID();
                item1.save();

                item2 =new Item(catalogId: 'Etsy-001',  descr:'Stone Earning',price:new Double(11.99),store:store1)
                item2.id = UUID.randomUUID();
                item2.save();
                item3 =new Item(catalogId: 'Etsy-002',  descr:'Brass Idol',price:new Double(19.99),store:store1)
                item3.id = UUID.randomUUID();
                item3.save();
                item4 =new Item(catalogId: 'Etsy-002',  descr:'Stone Necklace',price:new Double(21),store:store1)
                item4.id = UUID.randomUUID();
                item4.save();

                item5 =new Item(catalogId: 'Amazon-001',  descr:'Stone Earning',price:new Double(11.99),store:store2)
                item5.id = UUID.randomUUID();
                item5.save();
                item6 =new Item(catalogId: 'Amazon-003',  descr:'IT 5 Guidelines of design',price:new Double(21.99),store:store2)
                item6.id = UUID.randomUUID();
                item6.save();
                item7 =new Item(catalogId: 'Amazon-002',  descr:'Tomato Bags',price:new Double(3),store:store2)
                item7.id = UUID.randomUUID();
                item7.save();
                item8 =new Item(catalogId: 'Amazon-004',  descr:'Book on Yoga ',price:new Double(8),store:store2)
                item8.id = UUID.randomUUID();
                item8.save();

                item9 =new Item(catalogId: 'Walmart-001',  descr:'Bamboo Chair Table',price:new Double(69.99),store:store3)
                item9.id = UUID.randomUUID();
                item9.save();
                item10 =new Item(catalogId: 'Walmart-002',  descr:'Organic Eggs',price:new Double(34.99),store:store3)
                item10.id = UUID.randomUUID();
                item10.save();
                item11 =new Item(catalogId: 'Walmart-003',  descr:'Tomato Bags',price:new Double(3),store:store3)
                item11.id = UUID.randomUUID();
                item11.save();
                item12 =new Item(catalogId: 'Walmart-004',  descr:'Earings ',price:new Double(9.29),store:store3)
                item12.id = UUID.randomUUID();
                item12.save();

                item13 =new Item(catalogId: 'Bestbuy-001',  descr:'56 inch Flat TV',price:new Double(69.99),store:store4)
                item13.id = UUID.randomUUID();
                item13.save();
                item14 =new Item(catalogId: 'Bestbuy-002',  descr:'Frech Door Fridge',price:new Double(34.99),store:store4)
                item14.id = UUID.randomUUID();
                item14.save();
                item15 =new Item(catalogId: 'Bestbuy-003',  descr:'Oven Range',price:new Double(99),store:store4)
                item15.id = UUID.randomUUID();
                item15.save();
                item16 =new Item(catalogId: 'Bestbuy-004',  descr:'Mac Book Pro ',price:new Double(49),store:store4)
                item16.id = UUID.randomUUID();
                item16.save();

                item17 =new Item(catalogId: 'Boston-001',  descr:'Kids Clothes',price:new Double(5.99),store:store5)
                item17.id = UUID.randomUUID();
                item17.save();
                item18 =new Item(catalogId: 'Boston-002',  descr:'Brass Jewelery',price:new Double(15.99),store:store5)
                item18.id = UUID.randomUUID();
                item18.save();
                item19 =new Item(catalogId: 'Boston-003',  descr:'Mens Clothes',price:new Double(12),store:store5)
                item19.id = UUID.randomUUID();
                item19.save();
                item20 =new Item(catalogId: 'Boston-004',  descr:'Outdoor Furniture ',price:new Double(33.99),store:store5)
                item20.id = UUID.randomUUID();
                item20.save();


            }
            if (OrderTrans.count() == 0) {

                def orderTrans =new OrderTrans(customer: customer,  item:item,transDate: new Date()-2,store:store,qty:5,orderId:item?.id)
                orderTrans.id = UUID.randomUUID();
                orderTrans.save();
                 orderTrans =new OrderTrans(customer: customer,  item:item1,transDate: new Date()-1,store:store,qty:5,orderId:item1?.id)
                orderTrans.id = UUID.randomUUID();
                orderTrans.save();
                 orderTrans =new OrderTrans(customer: customer,  item:item6,transDate: new Date()-2,store:store2,qty:5,orderId:item6?.id)
                orderTrans.id = UUID.randomUUID();
                orderTrans.save();
                 orderTrans =new OrderTrans(customer: customer,  item:item8,transDate: new Date()-2,store:store2,qty:5,orderId:item8?.id)
                orderTrans.id = UUID.randomUUID();
                orderTrans.save();
                 orderTrans =new OrderTrans(customer: customer,  item:item17,transDate: new Date()-3,store:store5,qty:5,orderId:item17?.id)
                orderTrans.id = UUID.randomUUID();
                orderTrans.save();
                 orderTrans =new OrderTrans(customer: customer,  item:item18,transDate: new Date()-3,store:store5,qty:5,orderId:item18?.id)
                orderTrans.id = UUID.randomUUID();
                orderTrans.save();
                 orderTrans =new OrderTrans(customer: customer,  item:item14,transDate: new Date()-3,store:store4,qty:5,orderId:item14?.id)
                orderTrans.id = UUID.randomUUID();
                orderTrans.save();



                orderTrans =new OrderTrans(customer: customer1,  item:item1,transDate: new Date()-2,store:store,qty:5,orderId:item1?.id)
                orderTrans.id = UUID.randomUUID();
                orderTrans.save();
                orderTrans =new OrderTrans(customer: customer1,  item:item2,transDate: new Date()-1,store:store2,qty:5,orderId:item2?.id)
                orderTrans.id = UUID.randomUUID();
                orderTrans.save();
                orderTrans =new OrderTrans(customer: customer1,  item:item11,transDate: new Date(),store:store3,qty:5,orderId:item11?.id)
                orderTrans.id = UUID.randomUUID();
                orderTrans.save();
                orderTrans =new OrderTrans(customer: customer1,  item:item6,transDate: new Date()-3,store:store2,qty:5,orderId:item6?.id)
                orderTrans.id = UUID.randomUUID();
                orderTrans.save();
                orderTrans =new OrderTrans(customer: customer1,  item:item10,transDate: new Date()-3,store:store3,qty:5,orderId:item10?.id)
                orderTrans.id = UUID.randomUUID();
                orderTrans.save();



                orderTrans =new OrderTrans(customer: customer2,  item:item1,transDate: new Date(),store:store,qty:1,orderId:item1?.id)
                orderTrans.id = UUID.randomUUID();
                orderTrans.save();
                orderTrans =new OrderTrans(customer: customer2,  item:item2,transDate: new Date()-2,store:store1,qty:2,orderId:item2?.id)
                orderTrans.id = UUID.randomUUID();
                orderTrans.save();
                orderTrans =new OrderTrans(customer: customer2,  item:item18,transDate: new Date()-2,store:store5,qty:3,orderId:item18?.id)
                orderTrans.id = UUID.randomUUID();
                orderTrans.save();
                orderTrans =new OrderTrans(customer: customer2,  item:item9,transDate: new Date()-2,store:store3,qty:3,orderId:item9?.id)
                orderTrans.id = UUID.randomUUID();
                orderTrans.save();
                orderTrans =new OrderTrans(customer: customer2,  item:item7,transDate: new Date()-3,store:store2,qty:3,orderId:item7?.id)
                orderTrans.id = UUID.randomUUID();
                orderTrans.save();
                orderTrans =new OrderTrans(customer: customer2,  item:item2,transDate: new Date(),store:store1,qty:3,orderId:item2?.id)
                orderTrans.id = UUID.randomUUID();
                orderTrans.save();



                orderTrans =new OrderTrans(customer: customer3,  item:item3,transDate: new Date()-1,store:store1,qty:1,orderId:item3?.id)
                orderTrans.id = UUID.randomUUID();
                orderTrans.save();
                orderTrans =new OrderTrans(customer: customer3,  item:item6,transDate: new Date()-1,store:store2,qty:2,orderId:item6?.id)
                orderTrans.id = UUID.randomUUID();
                orderTrans.save();
                orderTrans =new OrderTrans(customer: customer3,  item:item10,transDate: new Date()-1,store:store3,qty:3,orderId:item10?.id)
                orderTrans.id = UUID.randomUUID();
                orderTrans.save();
                orderTrans =new OrderTrans(customer: customer3,  item:item14,transDate: new Date(),store:store4,qty:3,orderId:item14?.id)
                orderTrans.id = UUID.randomUUID();
                orderTrans.save();

                orderTrans =new OrderTrans(customer: customer4,  item:item20,transDate: new Date()-4,store:store5,qty:1,orderId:item20?.id)
                orderTrans.id = UUID.randomUUID();
                orderTrans.save();
                orderTrans =new OrderTrans(customer: customer4,  item:item8,transDate: new Date()-4,store:store2,qty:2,orderId:item8?.id)
                orderTrans.id = UUID.randomUUID();
                orderTrans.save();
                orderTrans =new OrderTrans(customer: customer4,  item:item11,transDate: new Date()-3,store:store3,qty:3,orderId:item11?.id)
                orderTrans.id = UUID.randomUUID();
                orderTrans.save();
                orderTrans =new OrderTrans(customer: customer4,  item:item15,transDate: new Date()-2,store:store2,qty:3,orderId:item15?.id)
                orderTrans.id = UUID.randomUUID();
                orderTrans.save();
                orderTrans =new OrderTrans(customer: customer4,  item:item16,transDate: new Date()-3,store:store4,qty:3,orderId:item16?.id)
                orderTrans.id = UUID.randomUUID();
                orderTrans.save();
                orderTrans =new OrderTrans(customer: customer4,  item:item3,transDate: new Date()-1,store:store1,qty:3,orderId:item3?.id)
                orderTrans.id = UUID.randomUUID();
                orderTrans.save();



            }
    }
    def destroy = {
    }
}
