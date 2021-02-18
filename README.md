## Flix Part 2

### User Stories

#### REQUIRED (10pts)
- [x] (5pts) User can tap a cell to see more details about a particular movie.
- [x] (5pts) User can tap a tab bar button to view a grid layout of Movie Posters using a CollectionView.

#### BONUS
- [x] (2pts) User can tap a poster in the collection view to see a detail screen of that movie.
- [ ] (2pts) In the detail view, when the user taps the poster, a new screen is presented modally where they can view the trailer.

### App Walkthrough GIF

![](https://i.imgur.com/f762s97.gif)


### Notes
When creating the detailed views of the movies, I noticed some of the movies did not have backdrop posters associated with them. This resulted in an error occuring when clicking on the movie. To fix this, I added some error handling to prevent the app from breaking if a movie without a backdrop view is clicked. 

# Flix

Flix is an app that allows users to browse movies from the [The Movie Database API](http://docs.themoviedb.apiary.io/#).


---

## Flix Part 1

### User Stories

#### REQUIRED (10pts)
- [x] (2pts) User sees an app icon on the home screen and a styled launch screen.
- [x] (5pts) User can view and scroll through a list of movies now playing in theaters.
- [x] (3pts) User can view the movie poster image for each movie.


#### BONUS
- [ ] (2pt) User can view the app on various device sizes and orientations.
- [ ] (1pt) Run your app on a real device.


### App Walkthrough GIF
![](https://i.imgur.com/7T5aNus.gif)


### Notes
While developing this app I experienced some issues with installing and working with different pods through CocoaPods. After reading some documentation, I was able to successfully install and use the AlamofireImage pod to add movie poster images within the application. 
