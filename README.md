# Roadmap

install the following technologies-

tailwindcss - done
rspec - done
factorybot - done
devise - done
policy gem cancancan or something else-

need the following models and associations

Team
- name
- Has many users
- id

User
- belongs_to Team

Month
- month
- year
- monthly_planned nullable
- belongs_to Team

Paycheck
- name
- payment - int
- pay_date
- belongs_to Month

Category
- name
- belongs_to month

Item
- name
- planned - int
- remaining - int
- is_fund - boolean or date
- belongs_to Month

Transactions
- name
- belongs_to item
- spent - int
- spent_date


