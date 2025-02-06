Step1:  Create Order with one line and 10 qty.
Step2. Inventory is not available at the shipnode(103) passed in createOrder.
Step3: Inventory is completely available at shipnode 104.
Step4: Schedule the order.

Step1: Order Should get backordered. No child order is created.
Step4: Order should get scheduled against node 104.