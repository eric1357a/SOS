# Fucks

```
# for any order, total amount run:
function Reward (client, amount)
  If (amount > $1000)
    client.bonus = 100 * Math.floor(2500 / 1000)
  
Reward ("seafood001", 2500) #=> 200 point
```

- sortable search result list
- Similar search function also available for gift redemption. E.g. gift with less than 300 points

- Client place an order online
  - Delivery
  - self-pick up
    - enter the pick-up time/date.

Order success -> show confirmation of ordered items

Client picks up -> manager update order status

**Client can cancel the order within 24 hours after ordered and at least 24 hours before deliver date.**

**However, the company will charge HKD$50 for the handling fees.**

Manager will login the administration system and handle the daily operations:

1. Maintain details of the item, such name, price, description etc.
2. Update the order status such as process, cancel, delivered, or picked-up.
4. Approve credit amount for client.

# Submission of The Fucks
1. The front page of your submission should include the course & module title, student number & name, group number. also upload to suck moodle before the deadline.

2. A written report should include the followings:

  - Assumption and the user and system requirements
  - Site map
  - System structure on how MVC Model is applied (#1)
  - Database structure
  - Tools, installation set, testing procedures and dataset (with suitable screen capture)
  - Test plan and Test cases
  - Brief description (1 or 2 pages only) on good design of application
  - Conclusions

3. Demo your assignment or fail this module.

# References

- Semantic UI  http://semantic-ui.com
- jQuery  http://jquery.com

# Skill checklist (& good design)

- AJAX
- MVC
- REST
- SPA (https://en.wikipedia.org/wiki/Single-page_application)

# notes

**#1**: Model = sos.db.*, View = JSP, Controllers = Servlets
