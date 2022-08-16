<div id="top"></div>


<!-- PROJECT LOGO -->
<div align="center">
  <a href="https://moon-garden-fe.herokuapp.com/" target="_blank" rel="noopener noreferrer"><img src="./public/moon-garden-logo.svg" alt="logo" width="30%"/></a>
</div>

  <p align="center">
    <a href="https://moon-garden-fe.herokuapp.com/"><strong>Checkout Moon Garden Here! »</strong></a>
  </p>
  <p align="center">
    <a href="https://github.com/Moon-Garden/moon_garden_be"><strong>Explore the Moon Garden Backend Application »</strong></a>
  </p>
</div>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#background">Background</a></li>
        <li><a href="#built-with">Built With</a></li>
        <li><a href="#apis-consumed">API's Consumed</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#land-acknowledgments">Land Acknowledgments</a></li>
    <li><a href="#contributors">Contributors</a></li>
  </ol>
</details>
<br>  


<!-- ABOUT THE PROJECT -->
## About The Project
Whats growin on?
Moon Garden helps you track your gardens and plants while offering recommendations based on the moon phase at every step of the way. We even threw in the weather, as a treat.

Using __Moon Garden__, users are able to:

- Register or sign-in using Google OAuth.
- See the current lunar phase with the corresponding gardening recommendation.
- Create Gardens to display on their Garden Dashboard.
- Search for plants by keyword and receive growing recommendations, then add plants to their garden.
- Add personal track planting details to each plant in a user's garden. 
- View land acknowledgments based on IP address location or entered location.

<p align="right">(<a href="#top">back to top</a>)</p>

### Background 
The tradition of lunar gardening has been practiced for as long as folks have been planting seeds and working the soil. It is believed by many cultures that the combination of the moon's illumination and its gravitational effect on earth's waters impact the gardening process. Moon Garden gives planting recommendations based on the various moon phases and provides garden tracking services for users.

When working with the land it is important to acknowledge whose land it is that is being worked. If you're curious about the history of your region, check out our [Land Acknowledgments](https://moon-garden-fe.herokuapp.com/land_acknowledgments) page.

### Built With
![Ruby](https://img.shields.io/badge/Ruby_on_Rails-CC0000?style=for-the-badge&logo=ruby-on-rails&logoColor=white)
![Postman](https://img.shields.io/badge/Postman-FF6C37?style=for-the-badge&logo=Postman&logoColor=white)
![Postgresql](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white)
![Heroku](https://img.shields.io/badge/Heroku-430098?style=for-the-badge&logo=heroku&logoColor=white)
![HTML](https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=html5&logoColor=white)
![GitHub](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)
![Bootstrap](https://img.shields.io/badge/Bootstrap-563D7C?style=for-the-badge&logo=bootstrap&logoColor=white)
![CSS](https://img.shields.io/badge/CSS3-1572B6?style=for-the-badge&logo=css3&logoColor=white)
![Miro](https://img.shields.io/badge/Miro-F7C922?style=for-the-badge&logo=Miro&logoColor=050036)

### API's Consumed
- [FarmSense](https://www.farmsense.net/api)
- [OpenFarm](https://openfarm.cc/pages/about)
- [Native Land](https://native-land.ca/resources/api-docs/)
- [Google OAuth](https://developers.google.com/identity/protocols/oauth2)
- [OpenWeather](https://openweathermap.org/api/one-call-api)
- [GeoPlugin](https://www.geoplugin.com/)
- [MapQuest](http://www.mapquestapi.com)

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- GETTING STARTED -->
## Getting Started

To get a local copy up and running follow these simple example steps.

### Installation

1. Clone this repository using SSH key
   ```shell
   $ git clone git@github.com:Moon-Garden/moon_garden_fe.git
   ```
2. Once cloned, you will have local copies of the directories you ran the clone command in. Use `$ cd` to  navigate to the front end application directory.
   ```shell
   $ cd moon_garden_fe
   ```
3. Install the required gems utilizing Bundler: 
  - If Bundler is not installed, first run the following command.

    ```shell
    $ gem install bundler
    ```
   - If Bundler is already installed or after you have installed it, run the following command.

      ```shell
      $ bundle install
      ```
4. There should be be text diplayed of the installation process that looks similar to below.

    ```shell
    Fetching gem metadata from https://rubygems.org/........
    Resolving dependencies...
    Using bundler 2.1.4
    Using byebug 11.1.3
    Fetching coderay 1.1.2
    Installing coderay 1.1.2
    Using diff-lcs 1.4.4
    Using method_source 1.0.0
    Using pry 0.13.1
    Fetching pry-byebug 3.9.0
    Installing pry-byebug 3.9.0
    Fetching rspec-support 3.10.1
    Installing rspec-support 3.10.1
    Fetching rspec-core 3.10.1
    Installing rspec-core 3.10.1
    Fetching rspec-expectations 3.10.1
    Installing rspec-expectations 3.10.1
    Fetching rspec-mocks 3.10.1
    Installing rspec-mocks 3.10.1
    Fetching rspec 3.10.0
    Installing rspec 3.10.0
    Bundle complete! 3 Gemfile dependencies, 12 gems now installed.
    Use `bundle info [gemname]` to see where a bundled gem is installed.
    ```
  If there are any errors, verify that bundler, Rails, and your ruby environment are correctly setup.

  5. Figaro installation

  * Follow the [figaro](https://github.com/laserlemon/figaro) installation with the docs and get your [OpenFarm, MapQuest, OpenWeather](#apis-consumed) and [Google Client](#apis-consumed) keys. 
  
    ```shell
    $ bundle exec figaro install
    ```
  
  6. Add the keys to your newly created `config/application.yml` file and add it to your `.gitignore` file. Be sure to read the [google API docs](https://developers.google.com/docs/api) for a deeper undestanding of the app. Your `config/application.yml` file should look something like this:

      ```ruby 
      GOOGLE_CLIENT_ID: (YOUR CLIENT ID HERE)
      GOOGLE_CLIENT_SECRET: (YOUR CLIENT SECRET HERE)
      PLANT_TOKEN: (YOUR KEY HERE)
      MAPQUEST_KEY: (YOUR KEY HERE)
      WEATHER_KEY: (YOUR KEY HERE)
      ```

  7. Start up your local server

      ```shell
      $ rails s
      ```
  8. Open web browser and visit link to access the front end application [http://localhost:3000](http://localhost:3000). At this point, you should see the Moon Graden landing page!
  
  
<p align="right">(<a href="#top">back to top</a>)</p>



<!-- USAGE EXAMPLES -->
## Usage
<div align="center">

![](https://media.giphy.com/media/BJx3cDJrPwdnNtqkJr/giphy.gif)

</div>

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- ACKNOWLEDGMENTS -->
## Land Acknowledgments
Moon Garden strives to join Native Land Digital in their mission to create spaces where non-Indigenous people can be challenged to learn more about the lands they inhabit, the history of those lands, and how to actively be part of a better future going forward together. As we learn more about the land surrounding each of us, we would like to take time to acknowledge the history of the territories we each garden in.
* Long Island Area - [Montauk](https://native-land.ca/maps/languages/montauk-2/) 
* Denver Area - [Dakȟóta (Western Dakota)](https://native-land.ca/maps/languages/dakhota-2/), [Dakhóta (Eastern Dakota)](https://native-land.ca/maps/languages/dakhota/), [Ute](https://native-land.ca/maps/languages/ute-2/), [Lakȟótiyapi (Lakota)](https://native-land.ca/maps/languages/lakotayapi/), [Cheyenne](https://native-land.ca/maps/languages/cheyenne-2/), [Arapaho](https://native-land.ca/maps/languages/arapaho-2/)
* Chesapeake Area - [Chesapeake](https://native-land.ca/maps/languages/chesapeake/)
* Chicago Area - [Dakȟóta (Western Dakota)](https://native-land.ca/maps/languages/dakhota-2/), [Dakhóta (Eastern Dakota)](https://native-land.ca/maps/languages/dakhota/), [Illinois](https://native-land.ca/maps/languages/illinois/), [Potawatomi](https://native-land.ca/maps/languages/bodwewadmimwen/)
* Kenosha, Wisconsin Area - [Dakȟóta (Western Dakota)](https://native-land.ca/maps/languages/dakhota-2/), [Dakhóta (Eastern Dakota)](https://native-land.ca/maps/languages/dakhota/), [Hoocąk (Ho-Chunk)](https://native-land.ca/maps/languages/ho-chunk/), [Illinois](https://native-land.ca/maps/languages/illinois/), [Potawatomi](https://native-land.ca/maps/languages/bodwewadmimwen/)

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- CONTACT -->
## Contributors


Thanks go to these wonderful people:

<table>

  <tr>
   <td align="center"><a href="https://github.com/jimriddle1"><img src="https://avatars.githubusercontent.com/u/99755958?v=4" width="100px;" alt=""/><br /><sub><b>Jim R. (he/him)</b></sub></a><br /><a href="https://www.linkedin.com/in/jim-riddle-b6718037/" title ="Linked In"><img src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white" /> </a> <p> </td>

   <td align="center"><a href="https://github.com/devAndrewK/"><img src="https://media-exp1.licdn.com/dms/image/C4E03AQFWtQ3Z48P8ng/profile-displayphoto-shrink_200_200/0/1649703988715?e=1665014400&v=beta&t=mTFNRWT5IIgNrV9E53BxaI-N6rA6mP13d279OYD4cCE" width="100px;" alt=""/><br /><sub><b>Andrew K. (he/him)</b></sub></a><br /><a href="https://www.linkedin.com/in/andrewkingdev/" title ="Linked In"><img src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white" /></a></td>

   <td align="center"><a href="https://github.com/casefaz"><img src="https://avatars.githubusercontent.com/u/98674727?v=4" width="100px;" alt=""/><br /><sub><b>Casey F. (they/she)</b></sub></a><br /><a href="https://www.linkedin.com/in/casey-fazio-7ba04149/" title ="Linked In"><img src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white" /></a></td>

   <td align="center"><a href="https://github.com/jenniferhalloran"><img src="https://avatars.githubusercontent.com/u/48455658?v=4" width="100px;" alt=""/><br /><sub><b>Jennifer H. (she/her)</b></sub></a><br /><a href="https://www.linkedin.com/in/jenniferlhalloran/" title ="Linked In"><img src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white" /></a></td>

   <td align="center"><a href="https://github.com/bwbolt"><img src="https://avatars.githubusercontent.com/u/85247765?v=4" width="100px;" alt=""/><br /><sub><b>Bryce W. (he/him)</b></sub></a><br /><a href="https://www.linkedin.com/in/bryce-wein/" title ="Linked In"><img src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white" /></a></td>

   <td align="center"><a href="https://github.com/StephenWilkens"><img src="https://avatars.githubusercontent.com/u/98788282?v=4" width="100px;" alt=""/><br /><sub><b>Stephen W. (he/him)</b></sub></a><br /><a href="https://www.linkedin.com/in/stephen-wilkens/" title ="Linked In"><img src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white" /></a></td>


  </tr>
</table>

This project follows the [all-contributors](https://github.com/all-contributors/all-contributors) specification.


<p align="right">(<a href="#top">back to top</a>)</p>


<div align="center">
  
  ![Moon Booty](https://media.giphy.com/media/XPydpT9cmZaUxF23iX/giphy.gif)

  </div>
