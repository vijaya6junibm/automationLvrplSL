Step1:  Create Order with one line and 10 qty.
Step2. Inventory is not available at  single shipnode.
Step3: Inventory availability at nodes 103, 104 and 125 is 7qty respectively.
Step4: Schedule the order. and release on of the child order.
Step5: Backorder childorder 9500000019 by posting Backorder EWM message.
Step6: Schedule the order.

Step4: 
Parent order  is backordered. 
Child Order 9500000020 is created with 7 qty's and scheduled against node 103.
Child Order 9500000019 is created with 3 qty's and scheduled against node 104.
Step5: child order 9500000019 got backordered.
Step6: child order 9500000019 got scheduled against node 125.