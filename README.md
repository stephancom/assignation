```
               _                   _   _
  __ _ ___ ___(_) __ _ _ __   __ _| |_(_) ___  _ __  
 / _` / __/ __| |/ _` | '_ \ / _` | __| |/ _ \| '_ \ 
| (_| \__ \__ \ | (_| | | | | (_| | |_| | (_) | | | |
 \__,_|___/___/_|\__, |_| |_|\__,_|\__|_|\___/|_| |_|
                 |___/                 by stephan.com
```
> an appointment to meet someone in secret, typically one made by lovers.

# Assignation [![Build Status](https://travis-ci.org/stephancom/assignation.svg?branch=master)](https://travis-ci.org/stephancom/assignation) [![Maintainability](https://api.codeclimate.com/v1/badges/49a4792efdd173d88034/maintainability)](https://codeclimate.com/github/stephancom/assignation/maintainability) [![Test Coverage](https://api.codeclimate.com/v1/badges/49a4792efdd173d88034/test_coverage)](https://codeclimate.com/github/stephancom/assignation/test_coverage)

### Rightway Healthcare code challenge

## Spec

### Problem
As a company, we need to get various types of files securely from customers. For example, we get periodic insurance claims data. Our customers don't always have accounts, so they can't login to do the upload. We need a way for "anonymous" users to send us a file in a secure manner.

### Goal
Create a RubyOnRails application that allows an administrator to set up third party secure file uploads.

### Workflow
An admin will create a link for a third-party user. The admin will send the link to a third-party user. The third-party user will receive the link and follow it to a page where they can securely upload their file.

### Requirements
1. An admin should be able to log in and see a list of uploaded files.
2. Each file should have metadata associated with it. This includes things like:
  a. Filename
  b. Description
3. The file should be uploaded to Amazon S3. [ This isn't required for complete, but it should be easy to switch it to S3 when desired. ]
4. An admin should be able to create a "place" for a file to be uploaded.
5. An admin should be able to send a link to an email address. The link should point to a page allowing the upload of a file.
6. An anonymous user should be able to follow the link to a webpage allowing them to securely upload a file. Once uploaded, the page
should indicate that the file is there (and show it's name), but it should not be downloadable.

## Getting started

* `clone repo`
* `bundle`
* `cp .example.env .env`
* fill in a new password
* `rake db:setup`
* `guard`

## Testing

* rake spec

## deploy

```
heroku create your-assignation-app-name
heroku config:set ADMIN_PASSWORD="YourSecurePassword"
heroku config:set HOSTNAME="YourSecurePassword"
heroku buildpacks:set https://github.com/bundler/heroku-buildpack-bundler2
git push heroku master
heroku run rake db:migrate
heroku run rake db:seed
```