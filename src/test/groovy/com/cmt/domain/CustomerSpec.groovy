package com.cmt.domain

import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Customer)
class CustomerSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }



    void 'test name cannot be null'() {
        when:
        domain.firstName = null

        then:
        !domain.validate(['firstName'])
        domain.errors['firstName'].code == 'nullable'
    }

    void 'test name cannot be blank'() {
        when:
        domain.firstName = ''

        then:
        !domain.validate(['firstName'])
    }
    void 'first name can have a maximum of 30 characters'() {
        when: 'for a string of 31 characters'
        String str = 'a' * 31
        domain.firstName = str

        then: 'name validation fails'
        !domain.validate(['firstName'])


        when: 'for a string of 256 characters'
        str = 'a' * 30
        domain.firstName = str

        then: 'name validation passes'
        domain.validate(['firstName'])
    }
}
