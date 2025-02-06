Step1:  Create Order with one line and 10 qty and schedule it.
Step2: Inventory availability for Line 1 at shipnode 103 and  176 is 5qty respectively, and its 3 qty at 104 and 170.
Step3: Backorder Child order1 by posting backorderEWM message.
Step3: Release childorder.
Step4: Post backorder EWM message against child order 9500000015.
Step5 : Schedule child order 9500000015.

Step1: Parent order should get backordered.
OrderLine1 should have two childorders.
Child order1 should be against 176 for 5qty.
Child order2 should be against 103 for 5qty.
Step4: Child order 9500000015 should get backordered.
Step5: Child order 9500000015 should get cancelled and two new child orders should get created.