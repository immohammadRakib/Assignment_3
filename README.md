# Football Ticket Booking System ⚽🎫

A relational database design crafted for managing football match ticket bookings. This system handles user roles, match scheduling, dynamic pricing tiers, and ticket sales tracking with strict data integrity.

---

## 🛠️ Key Architectural Features

### 1. Unified User Management
* **Role-Based Profiles:** Differentiates between 'Football Fan' and 'Ticket Manager' seamlessly using database-level validations.
* **Strict Unique Identifiers:** Prevents duplicate registrations by enforcing structural constraint safety on crucial data like email addresses.

### 2. Match Control & Availability Engine
* **Dynamic Status Tracking:** Monitors match availability dynamically using clean categorization ('Available', 'Selling Fast', 'Sold Out', 'Postponed').
* **Financial Safety Checks:** Built-in pricing validation guarantees that a ticket's price can never drop below zero, preventing financial data corruption.

### 3. Smart Booking Engine
* **Manual Identity Alignment (`INT` Approach):** Designed using custom explicit integer identifiers instead of auto-generated sequences. This ensures pre-determined legacy IDs map perfectly without database tracking conflicts.
* **Automated Cascade Cleanups:** Integrated with `ON DELETE CASCADE` constraints. If a match is cancelled or a user is removed, the system wipes related booking histories automatically to maintain clean storage.
* **Fault-Tolerant Structuring:** The schema explicitly permits unassigned seats or empty transaction states, making the system highly testable for pending checkouts.

---

## 🔍 Implemented System Operations & Logic

The architecture is pre-optimized to execute 7 critical operational logics required for a ticket-booking workflow:

1. **Premier Tournament Filtering:** Isolates available seat slots specifically within marquee competitions (e.g., Champions League).
2. **Case-Insensitive Identity Search:** Executes smart text pattern searching to locate customers regardless of partial inputs or letter-casing variances.
3. **Graceful Null Handling:** Uses fallback logic to scan incomplete checkouts and automatically convert empty fields into actionable alerts like "Action Required" for front-end safety.
4. **Relational Data Consolidation:** Connects transactional rows back to specific buyer profiles and stadium fixtures simultaneously for a clean overview.
5. **Passive Client Auditing:** Tracks all users in the system, explicitly filtering out inactive customers who have registered but never bought a ticket.
6. **Dynamic Financial Baseline Calculations:** Employs nested math filters to isolate purchases that cost strictly higher than the current average system ticket baseline.
7. **Outlier Pagination Trick:** Utilizes skipping mechanisms to bypass the absolute highest premium-priced matches, allowing the system to dynamically generate secondary listings or leaderboard pages.
