describe("Test", function() {


    it("test add method", function () {
        var i = 1;
        var j = 1;
        expect(j + i).toEqual(2);


    });


    describe("Button Click Event Tests", function () {
        var spyEvent;

        beforeEach(function () {
            setFixtures('<input class="clickMe"></input>');
        });



        it("comp move resulted in an X", function() {
            var spyEvent = spyOnEvent('.clickMe', 'click');
            $('.clickMe').click();
            expect('click').toHaveBeenTriggeredOn('.clickMe');
            expect(spyEvent).toHaveBeenTriggered();
        });

    });
});
