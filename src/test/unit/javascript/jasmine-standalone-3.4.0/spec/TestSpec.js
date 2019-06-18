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



        it("Hide Div on Btn Click", function() {
            var spyEvent = spyOnEvent('.mybtn', 'click');
            $('.mybtn').click();
            expect('click').toHaveBeenTriggeredOn('.mybtn');
            expect(spyEvent).toHaveBeenTriggered();

            expect('.div').toBeHidden();
        });

        it("Visible Div on Btn1 Click", function() {
            var spyEvent = spyOnEvent('.mybtn1', 'click');
            $('.mybtn1').click();
            expect('click').toHaveBeenTriggeredOn('.mybtn1');
            expect(spyEvent).toHaveBeenTriggered();

            expect('.div').toBeVisible();
        });

    });
});
