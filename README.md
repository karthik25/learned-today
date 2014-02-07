# Rails :: Learned Today

This is a journal for interesting rails facts learned by me, parked on heroku! Currently under development!!!

Using this is pretty simple! In order for a "fact" to appear in the web page, just create a text file within the "facts/txt" folder. 
You can even use html in your text files!

For Disqus to work, in your local, add a "local_env.yml" file in the config folder. .gitignore has this file in its list, so it 
won't be checked in. The settings in this file will be available as environment variables for the application. However if you are 
deploying the app to heroku, you may have to use heroku config:add to add the environment variables. 

Here is a sample "local_env.yml":

```yml
DISQUS_SHORT_NAME: 'your_disqis_short_name'
SITE_BASE_URL: 'http://some_app.herokuapp.com'
```

Have fun :)
