Step1:  Create Order with two lines and 10 qty and schedule the order..
Step2. Inventory is not available at the shipnode(40) passed in createOrder.
Step3: Inventory availability for Line 1 at shipnode 103 is  20qty.
Step4: Inventory availability for Line 2 at shipnode 104, and 125 is 6 and 3 qty respectively.
Step5: Release Order.
Step6: Post backorderEWM message.
Step7: Reduce inventory for line1 at node 103 to 6 and add 3 qty at 104 and 125 respectively.
Step8: Add node 103 to excluded nodes and then schedule order.

Step 1 : Order Should get partially backordered.
OrderLine1 should be scheduled against Node 103.
OrderLine2 should be backordered.
Step6: Orderline1 should get backordered.
Step8: Line1 should remain in backordered status.