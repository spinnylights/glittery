# Glittery

Glittery is an app to allow an artist to upload and show their work. It has a pretty, spartan aesthetic designed to minimize visual distraction from your work without being sterile or unstylish.

You can see a [demo](https://glittery.herokuapp.com/) of it if you'd like.

## Deployment

Pull the repo. Then, cd into the repo's directory and run `config/create_admin`, which will prompt you for a username and password. It will store them in a temporary YAML file which will be destroyed as your app loads.

After this, you can put the app on your server. If you're using Git, make sure to open the .gitignore and remove "config/admin.yml" before pushing or the app will not be able to store your login credentials.

Point your browser to the app's url. You should see "GLITTERY" in big white letters and nothing else. Now go to "{ your app's url }/login" and enter your login info. From this page you can change your bio (a bio link will appear under the site's title once you add some information), upload images, change the site title, and so on.

### If you're using Heroku

By default Glittery is set up to store images you upload on the server it's hosted on. Heroku's [read-only filesystem](https://devcenter.heroku.com/articles/read-only-filesystem) breaks this. As a result, you'll need to store your images elsewhere, like on [Amazon's S3 service](http://aws.amazon.com/s3/). You'll also need to modify Paperclip to make this work. Using S3 is the easiest option because Paperclip has built-in support for it--see the Storage section of the [Paperclip readme](https://github.com/thoughtbot/paperclip) and [Paperclip::Storage::S3 ](http://rubydoc.info/gems/paperclip/Paperclip/Storage/S3) in the RDoc. Change the calls to `has_attached_file` in the models to behave as you wish.
