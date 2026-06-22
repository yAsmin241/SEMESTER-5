# SECJ3253 Database Programming — Reflection
---

## Assignment 1 — Hostel Management Database

Building the hostel management system end-to-end — five related tables, inserts, a multi-table view, and aggregation queries — gave me a full picture of the relational database workflow. Having to `DROP` and recreate `payments` early on to fix a column constraint was a practical lesson in thinking through the schema before writing data, and the `v_room_status` view that joined four tables into one readable summary felt like the schema design properly paying off.

---
## Lab 1 — Indexes in MySQL

Lab 1 taught me the leftmost prefix rule through direct experimentation — creating a composite index on `(customer_id, product_id)` and using `EXPLAIN` to see that a filter on `product_id` alone couldn't use it, then swapping the column order and watching the behavior flip. It made the point that index column ordering is a genuine design decision, not an afterthought.

---

## Lab 2 — MongoDB Clinic System

Lab 2 was my first real MongoDB session, and the clinic domain made the document model click — embedding appointment details directly in a document felt more natural than a join. Writing aggregation pipelines with `$group`, `$sort`, and `$match` was a mental shift from SQL, and finishing with a compound index on `{department, status}` tied the lab back to Lab 1 and showed that index design principles transfer across paradigms even when the syntax doesn't.

---

## Project 1 — Movie Booking System (Group 5)

Designing a six-table movie booking database as a group made me appreciate how early schema decisions ripple forward — constraints like `ON DELETE CASCADE` and a `loyalty_point` column added post-design via `ALTER TABLE` all came from discussions that took longer than expected. By the end, writing multi-table joins and subqueries across a schema we built ourselves felt noticeably more confident than working with one handed to us.

---

## Project 2 — Food Delivery System (Group 3)

Project 2 showed me where MongoDB's document model genuinely wins — embedding menus inside restaurants and order items inside orders made the data feel application-ready without junction tables. It also showed the trade-off: inconsistent field names (`addresses` vs `address`) and a mismatched ID (`R002` vs `R2002`) slipped through unchecked, which relational constraints would have caught. That tension between flexibility and strictness is now something I think about when choosing a database model.

---

## Overall Reflection

Working across MySQL and MongoDB in the same course made the differences between relational and document databases feel concrete rather than theoretical. I came in stronger on SQL, but the MongoDB labs genuinely shifted my thinking — not as a simpler alternative but as a different design philosophy with its own trade-offs. The course built well from indexing fundamentals through full system design, and the skills connect directly to data engineering work where storage model choices and query performance matter every day.
