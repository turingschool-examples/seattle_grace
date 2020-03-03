## Seattle Grace
Please follow the setup directions below. Stories for the assessment will be sent out in class.

### Setup
- Fork this repository
- Clone down your forked repository
- Perform the usual setup steps after cloning a Rails application:
    - bundle install,
    - rake db:{drop,create,migrate,seed}

# BEM2 Final Technical Assessment Retake
## Description
Seattle Grace is based off of Grey's Anatomy (Mike's favorite show), but you need NO knowledge of Grey's Anatomy to complete this final.
Hospitals have many Doctors, Doctors work for just one hospital. Doctors have many surgeries and surgeries can have many doctors. A one to many relationship is already set up for you. Make sure to read all instructions, tasks, and user stories before getting started. Also, take a look at your schema to see what you're working with to start.

## Instructions
* Work on this assessment independently. DO NOT discuss with anyone.
* Fork this repository
* Clone your fork
* Run `bundle install`
* Run `rake db:{drop,create,migrate,seed}`
* Complete the tasks below
* Push your code to your fork once the time is up (not before!)

## Tasks
1. Create a surgeries table
  - Surgeries will have a title, day of the week ("Monday", "Tuesday", "Friday", etc...), and operating_room_number
2. Set up a many to many relationship between doctors and surgeries
3. Complete the following user stories:

### User Story 1, Surgery Show Page
As a visitor 
When I visit a surgery's show page
I see the title and operating room number of that surgery
And I see the count of doctors that are on this surgery
And I see a section of the page that says "Other surgeries happening this day of the week:"
And under that header I see titles of all surgeries that happen on the same day of the week as this surgery 

### User Story 2, Add a Doctor to a Surgery
As a visitor
When I visit a surgery's show page
I see a surgery's title, date, and 
I see a field with instructions to "Add A Doctor To This Surgery" 
When I input a doctor's unique id into that field
And click submit
I'm taken back to that surgery's show page
And I see the name of that doctor listed on the page
