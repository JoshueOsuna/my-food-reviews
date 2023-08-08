# README
Setting up Rails 7 with React using esbuild is extremely easy.
Simplify unnecessary generation editing the application.rb file.

## Where does this tutorial lack?
- Doesn't go into database constraints or model level validations
  - For example, ensuring that no fields are null at the DB level and model level
- Doesn't explain associations and how they work
- Doesn't go into utilizing indexes
  - For example, an index to easily find the restaurant by name and ensure it's unique
  - When does Rails 5+ automatically add an index?
- Setting up Github, debugging gems, and creating the DB
- How migrations work in case you need to add or remove fields
- Handling seeds in transactions w/ destroy_all to easily reset the DB
- Utilizing gems like Faker to generate seed data
- Using the active fork of fast_jsonapi (jsonapi-serializer) instead, though I 
considered using blueprinter because supposedly it's very flexible
- Using generators for migrations, models, controllers, serializers, etc
- Understanding exactly what's going on in routes.rb
- Using Rails best practices with Rubocop
- Rails naming conventions: plural controllers, singular models, etc
- More details about what's going on in the Controller layer
- Since we're using a React frontend, no need to use instance variables in controller
- Since React frontend, not thinking about flash/flash.now and redirecting
- No need for new and edit pages due to React frontend
- Error handling in controllers
- Insomnia vs Postman vs VSCode RapidAPI client
- Can do nothing or call .serializable_hash.to_json, but .serialized_json doesn't work
- rails server, bin/dev (equiv of running rails server and yarn build --watch)
- utilizing esbuild instead of webpacker, meaning no more javascript_pack_tag
  - simply include the file into the view with javascript_include_tag 'application'
  (or whatever the name of the entrypoint file is)
- https://ryanbigg.com/2023/06/rails-7-react-typescript-setup
- Basically: install esbuild, change build script (optional), 
install react and react-dom using yarn, then create a root element that the 
React code can attach to
- Utilizing createRoot over ReactDom.render so no need to wrap in a DOMContentLoaded 
event listener
- react-router-dom and modern react router aka version 6... many differences!
- Use of axios vs fetch
- async await vs promises vs callback hell
- can no longer pass props via router, have to use hooks provided by react-router-dom aka useParams
- utilizing Rail's assets pipeline vs just doing everything in frontend utilizing yarn
