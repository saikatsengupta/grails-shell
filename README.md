# CRUD Project

## Objective
Create a basic CRUD (create, read, update, delete) web application using the [Grails framework](http://grails.org/). The application will track a customer's order history through multiple stores.

This is your chance to impress us. This project is a reflection of you so if you want to stand out, make it look good (not just UI but the code too)!

## What's provided
As it stands, this is an empty shell of a Grails application that was created with Grails 3.2.9 via the `grails create-app` command. All plugins and dependencies are already self-contained. On the client side, this project provides the [jQuery](https://jquery.com/) JavaScript library and [Bootstrap](http://getbootstrap.com/3.3.7/) framework.

## Learning Curve
This project assumes no previous Grails experience and will require research skills and general resourcefulness when working in an unfamiliar environment.

You will have to research and learn the basics of Grails in order to demonstrate the ability to get an application up and running quickly. That being said, the Grails [Getting Started](http://docs.grails.org/3.2.9/guide/gettingStarted.html) guide is excellent and should accelerate your understanding of the framework. In addition, countless of other resources exist online. It's up to you to explore and investigate any questions that may arise during the development process.

Grails was designed for rapid development. You'll find that most features and concepts that are required in a web application are baked into the framework. There's no need to re-invent the wheel on most things, this is a project that is meant to demonstrate rapid development, not sheer programming prowess.

If you've already got Grails experience (or something similar like Spring Boot), feel free to show us your skills! For example, Grails generates controllers with persistence related logic in them but a production app would probably use a services layer. If you know what you're doing, show us what you would do in a real application even though this one is pretty basic.

## Development
This project requires Java 7 or above and Grails 3.2.9. As of Grails 3, the [Gradle](https://gradle.org) build tool is used to build and run Grails apps. In development mode, apps can be run via Gradle from either an IDE ([IntelliJ IDEA](https://www.jetbrains.com/idea/download)) or the command line. Basic installation instructions are available via the [Grails website](https://grails.org/download.html).

## Requirements

#### Domain Model
Create a domain model which supports tracking a customer who can place orders with different stores. The customer has a name, address, city, state, zip, phone number, and date of birth. A store has a name, address, city, state, zip, phone number, and type of items sold (sporting goods, grocery, etc). An order has a date/time created, the store used, the customer the order is for, and the list of items purchased. An item has a catalog number, description, and price.

Where appropriate, these domain classes should constrain the values that they can contain. For example, if you have an email field, ensure that only a valid email address can be entered into the field.

*Tip: Grails uses Hibernate to map Java objects to a relational database. By default it uses an in-memory database in development that can be viewed at http://localhost:8080/dbconsole. There is no password, so just click connect to view the database.*

#### User Interface
Each domain class should have a corresponding CRUD interface: the ability to create, view, update, and delete objects from the UI. As mentioned before, Grails provides a great deal of functionality with minimal programmer effort. By default, Grails can easily provide a create, edit, show (detailed listing of a specific object), and listing page. Delete functionality is usually built in with the show/edit portion. There's no need to create any views in addition to these.

User Interface design should follow Bootstrap's design principles. It's up to you to decide how things should be laid out, but we've provided a structural framework to base your design on.

In addition to the views for each distinct domain class, modify the default view (index.gsp) to display a "dashboard" consisting of both the Customer and Order listings. It should have a "mini-view" of the list of the orders, and then the same for a list of the customers. This dashboard should be populated dynamically, that is, it should be empty when the page is initially rendered from the server, and populated via asynchronous JavaScript (AJAX). jQuery provides a number of handy methods for dealing with AJAX.

*Hint: This shouldn't necessarily require any additional server side code than what you've created to support the normal CRUD views.*

#### Extras
Tests are an important part of the Grails environment. Effective test-driven development ensures quality and stability while exposing bugs early and often. That being said, tests are out of the scope of this project. Add them if it's something you're used to doing and helps you work, but they're not required.

## Delivery
Commit your changes to this repository, or send an email with your completed project as an attachment. We'd like for you to complete this project without any assistance, but if you do run into major problems (issues installing Grails or just getting this empty application to run) feel free to get in contact with us. Starting with a new framework and development tools can be difficult!