
## THE LEARNING WALL ##

## PROJECT REQUIREMENTS ##


  • users should be able to save an external URL along with a title and description
      (resource.ejs, new_resource.js)

  • users should be able to categorize any resource under a topic
      (resource.ejs, new_resource.js)

  • users should be able to search for already-saved resources created by any user
      (in every ejs page, don't have a .js file for this yet)

  • users should be able to comment on any resource
       (user_page.ejs, resource_id.js)

  • users should be able to rate any resource
       (user_page.ejs, resource_id.js)

  • users should be able to like any resource
       (user_page.ejs, resource_id.js)     

  • users should be able to view all their own and all liked resources on one page ("My resources")
       (user_page.ejs)

  • users should be able to register, log in, log out and update their profile
       (register.ejs, registration.js)   (index.ejs, login.js, almost every page has logout)    (edit_profile.ejs, )








# DATABASE TABLES #


### USERS ###
id (PK), 
name, 
email, 
password

### RESOURCES ###
id (PK), 
user_id (FK), 
resource_url, 
created_at, 
title, 
description, 
avg_rating, 
likes_count

### RESOURCE TAGS ###
resource_id (PK, FK), 
tag_id (PK, FK)

### TAGS ###
id (PK), 
tag_name

### COMMENTS ###
id (PK), 
resource_id (FK), 
user_id (FK), 
c_text, 
created_at

### RATINGS ###
user_id (PK), 
resource_id (PK), 
value

### LIKES ###
user_id (PK), 
resource_id (PK)





## Project Setup

1. Create your own empty repo on GitHub
2. Clone this repository (do not fork)
  - Suggestion: When cloning, specify a different folder name that is relevant to your project
3. Remove the git remote: `git remote rm origin`
4. Add a remote for your origin: `git remote add origin <your github repo URL>`
5. Push to the new origin: `git push -u origin master`
6. Verify that the skeleton code now shows up in your repo on GitHub

## Getting Started

1. Create the `.env` by using `.env.example` as a reference: `cp .env.example .env`
2. Update the .env file with your correct local information
3. Install dependencies: `npm i`
4. Fix to binaries for sass: `npm rebuild node-sass`
5. Run migrations: `npm run knex migrate:latest`
  - Check the migrations folder to see what gets created in the DB
6. Run the seed: `npm run knex seed:run`
  - Check the seeds file to see what gets seeded in the DB
7. Run the server: `npm run local`
8. Visit `http://localhost:8080/`

## Dependencies

- Node 5.10.x or above
- NPM 3.8.x or above

