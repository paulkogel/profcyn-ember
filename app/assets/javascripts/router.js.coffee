App.Router.map ->
  @resource 'galleries', ->
    @resource 'gallery', { path: ':gallery_id' }

# special route: "App.ApplicationRoute is entered when your app first boots up. It renders the application template."
# App.ApplicationRoute = Ember.Route.extend

# special root for '/'. "App.IndexRoute is the default route, and will render the index template when the user visits / (unless / has been overridden by your own custom route)."
App.IndexRoute = Ember.Route.extend
  redirect: ->
    @transitionTo 'galleries'

App.GalleriesRoute = Ember.Route.extend
  model: ->
    console.log 'galleriesRoute'
    @store.find('gallery') # findAll doesn't work

App.GalleryRoute = Ember.Route.extend
  model: (params) ->
    console.log 'galleryRoute with params:', params
    @store.find('gallery', params.gallery_id)

App.GalleriesIndexRoute = Ember.Route.extend
  setupController: (controller, model) ->
    # console.log controller, model
    # galleries = @store.findAll('foo')
    # controller.set('galleries', galleries)
