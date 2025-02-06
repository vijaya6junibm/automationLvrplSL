Step1:  Create Order with two lines and 10 qty and schedule it.
Step2. Inventory is not available at the shipnode(40) passed in createOrder.
Step3: Inventory availability for Line 1 at shipnode 103, 104 and 125 is 7qty respectively.
Step4: Inventory availability for Line 2 at shipnode 103, 104 and 125 is 5, 2 and 8 qty respectively.

Step 1 : Order Should get backordered.
OrderLine 1 should have two child orders, Child order1 should be shceudled against node 103 and 7 qty.
Child order2 should be scheduled against node 104 and 3 qty.
OrderLine 2 should also have two child orders.
Child order 1 should be scheduled against node 103 with 2 qty.
Child order 2 should be scheduled against node 125 with 8 qty.
