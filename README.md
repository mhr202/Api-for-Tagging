# Tagging API

## Local Development (Mac OS / Ubuntu)

 - Ruby version 2.7.1

**System Level Dependencies:**

 - PostgreSQL 12.4

**Project Level Dependencies**

 - bundle install

**Setting up the Database**

 - rails db:create 
 - rails db:migrate 
 - rails db:seed

**Running the Rails Server**

 - rails server

**Running Tests**

- bundle exec rspec


# API Endpoints

## User:
### Sign-in
Method: `POST`
url:  `/api/v1/auth/sign_in`
Parameters:
 
    Login Headers (Parameters)
    { email: "some@email.com", password: "somepassword" }

### Sign-out
The sign-out is dependant on sign-in response header attributes
Method: `DELETE`
url:  `/api/v1/auth/sign_out`
Parameters:

    Logout Headers (Parameters)
     {
        'uid' => response.headers['uid'],
        'client' => response.headers['client'],
        'access-token' => response.headers['access-token']
     }

### Campaign
 API: Create Campaign
Method: `POST`
url:  `/api/v1/campaigns`
Parameters:
 
    Campaign Headers (Parameters)
    { 
        campaign:  { 
                        user_id: 1, 
                        title: 'C1', 
                        duration: 'within 1 week', 
                        purpose: 'test'
                    }
    }

### Campaign Topic
 API: Create a Campaign Topic
Method: `POST`
url:  `/api/v1/topics`
Parameters:
 
    Campaign Topic Headers (Parameters)
    { 
        campaign_topic: { 
                            campaign_id: 1,
                            title: 'Campaign Tag',
                         }
    }

### Comment
 API: Create a Campaign Topic
Method: `POST`
url:  `/api/v1/comments`
Parameters:
 
    Comment Headers (Parameters)
    {
        comments: {
                    campaign_id: 1,
                    topic_id: 1,
                    text: 'This is a test comment.'
                  }
    }

### Tag
 API: Create a Tag
Method: `POST`
url:  `/api/v1/tags`
Parameters:
 
    Tag Headers (Parameters)
    {
      tags: {
        name: Faker::Name.name
      }
    }

### Sub-Tag
 API: Create a Sub-Tag
Method: `POST`
url:  `/api/v1/sub_tags`
Parameters:
 
    Tag Headers (Parameters)
    {
      sub_tags: {
        tag_id: 1,
        name: Faker::Name.name
      }
    }

### Campaign Tag
 API: Tag a Campaign
Method: `POST`
url:  `/api/v1/campaigns/add_tag`
Parameters:
 
    Campaign Tag Headers (Parameters)
    { 
        campaign: {
            id: campaign.id,
            tag_id: tag.id
        }
    }
