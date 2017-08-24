# MeetScheduler

Basic useful feature list:

 * User can Create an event or multiple events for meeting and invite other users
 * User can see list of his upcoming meeting and past meetings
 * User can see Details of individual meeting
 * Send notification to user for scheduled meeting via email


Models
 * User
 * Employee
 * Admin
 * Meeeting
 * Venue
 * M.O.M.
 * Agenda
 * Suggestion

### Associations between Models

* Employee **is a** User
* Admin **is a** User
* Meeting - users :  **Many to Many**  Association
* Meeting - MOM  : **One to One** Association
* MOM - Agenda : **One to Many** Association
* Angenda - Suggestion : **One to Many** Association
* User - Suggestion : **Many to Many** Association
