# Fuck

Copy www.shop248.com

1. The client will register their information (name, telephone number, and delivery address).
2. After registration, client will make a down payment at the shop.
3. The manager verifies the client identity and provides a client id and password to the client.
4. The client can make order on online with the given client id and password.

Client uses the given client id and the password to logs in to the system and uses the system to
- Place and manage order
- Check the last 10 orders history.
- Maintain the personal information and delivery address
- Check and collect bonus point
- Redeem gift.

```
function Reward (client, amount)
  If (amount > $1000)
    client.bonus = 100 * Math.floor(2500 / 1000)
  
Reward ("seafood001", 2500) #=> 200 point
```

- show all the available stationaries in different category.
- provide a search menu by entering keywords (item type, brand name, etc..)
- The list of stationaries can be sorted in different orders.
- Each stationery item has a unique number, name, descriptions, category and price.
- Similar search function also available for gift redemption. E.g. gift with less than 300 points

When client place an order online, the client will choose for delivery or self-pick up at main office.

If the client selected self-pickup, the client has to enter the pick-up time/date.

When an order is made successfully, a confirmation will show the ordered items.

When the client picks up an order, the manager will update the order status as picked-up.

**Client can cancel the order within 24 hours after ordered and at least 24 hours before deliver date.**

**However, the company will charge HKD$50 for the handling fees.**

Manager will login the administration system and handle the daily operations:

1. Maintain details of the item, such name, price, description etc.
2. Update the order status such as process, cancel, delivered, or picked-up.
3. Verify the client identity and provide client id and password.
4. Approve credit amount for client.
5. Obtain a report for incomplete orders.

# Marking

**Skills requirements**

3. Use JSP Action
4. Use Custom Tag.
5. Use Javabean
7. Use session checking + login control
10. Use EJB session bean for business logic
11. Other skills applied

**Functionalities and Web design**

1. Complete the user requirements
2. Consistent design and easy to use
3. Smooth navigation to and fro
4. Tidy Page Layout with logical and related graphics
5. Error free implementation
6. Creativity

# Submission of The Fucks
1. The front page of your submission should include the course title, module title, student identity
number, student name, and group number.

2. A written report should include the followings:

  - Assumption and the user and system requirements
  - Site map
  - System structure on how MVC Model is applied
  - Database structure
  - Tools, installation set, testing procedures and dataset (with suitable screen capture)
  - Test plan and Test cases
  - Brief description (1 or 2 pages only) on the characteristics or good design of your application
  - Conclusions

3. Upload all related documents and software project to garbage moodle on or before the deadline.

4. You are required to demonstrate your assignment. You will fail this module if you do not demonstrate the assignment in the lab session as required. 

# References

- Semantic UI  http://semantic-ui.com
- jQuery  http://jquery.com

# Skill checklist

- AJAX
- MVC
- REST
- SPA (https://en.wikipedia.org/wiki/Single-page_application)
