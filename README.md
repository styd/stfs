# README

Visit the web app in [http://stfs.herokuapp.com](http://stfs.herokuapp.com) .

This app is not fully responsive yet. Please open your laptop or desktop to view
the app.
The tweets search function is basically finished.
The facebook statuses search already has an authentication system but cannot be
finished for these reasons
([facebook permissions change](https://developers.facebook.com/docs/apps/changelog)):
* **Friend list is no longer part of the default permission set and has its own
  permission**: Asking for access to a person's friend list is now a separate
  permission that your app must request. The new permission is called `user_friends`.  
  Hence `user_friends` permission/scope in the `config/initializers/omnauth.rb`.
* **Friend list now only returns friends who also use your app**: The list of friends
  returned via the `/me/friends` endpoint is now limited to the list of friends that
  have authorized your app.
* In [user_friends](https://developers.facebook.com/docs/facebook-login/permissions#reference-user_friends)
  permission:  
  In order for a person to show up in one person's friend list, both people must
  have decided to share their list of friends with your app and not disabled that
  permission during login. Also both friends must have been asked for `user_friends`
  during the login process.  
  Therefore I cannot obtain the list of friends even though I've authenticate the
  user (it returns `nil`, click the `raw` button in the app), because the user's
  friends need to also approve this app first. Because of this, I cannot continue
  getting the user's friends' statuses.
