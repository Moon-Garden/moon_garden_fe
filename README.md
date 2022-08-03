<div id="top"></div>


<!-- PROJECT LOGO -->
<div align="center">
  <a href="https://moon-garden-fe.herokuapp.com/" target="_blank" rel="noopener noreferrer"><img src="./public/moon-garden-logo.svg" alt="logo" width="30%"/></a>
</div>

  <p align="center">
    <a href="https://github.com/bwbolt/moon_garden_be"><strong>Explore the Moon Garden backend application »</strong></a>
  </p>
</div>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
        <li><a href="#apis-consumed">API's Consumed</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#contact">Contributors</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>
<br>  


<!-- ABOUT THE PROJECT -->
## About The Project

The tradition of lunar gardening has been practiced for as long as folks have been planting seeds and working the soil. It is believed by many cultures that the combination of the illumination of the moon and gravitational effect of the moon on earth's waters impact the gardening process. Moon Garden gives recommendations based on the various phases of the moon and provides garden tracking services for users.

When working with the land it is important to acknowledge who's land it is that is being worked. If you're curious about the history of your land, checkout our Land Acknowledgment page - link - gracefully provided by: link

Using __Moon Garden__, users are able to:

- Register or sign-in using Google OAuth.
- See the current lunar phase with the corresponding gardening recommendation.
- Create Gardens to display on their Garden Dashboard.
- Search for plants by keyword and receive growing recommendations, then add plants and their recommendation to a garden.
- Add personal track planting details to each plant in a user's garden. 
- View land acknowledgments based on IP address location.

<p align="right">(<a href="#top">back to top</a>)</p>


### Built With
Language badges here - bootstrap, ruby, css, html, postgres, heroku, miro, etc

### API's Consumed
- [FarmSense](https://www.farmsense.net/api)
- [OpenFarm](https://openfarm.cc/pages/about)
- [Native Land](https://native-land.ca/resources/api-docs/)
- [Google OAuth](https://developers.google.com/identity/protocols/oauth2)

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- GETTING STARTED -->
## Getting Started

This is an example of how you may give instructions on setting up your project locally.
To get a local copy up and running follow these simple example steps.

### Prerequisites

This is an example of how to list things you need to use the software and how to install them.
* npm
  ```sh
  other things we might have to tell them that I havent figured out yet
  ```

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

  * Follow the [figaro](https://github.com/laserlemon/figaro) installation with the docs and get your [googlemaps.org](#apis-consumed) and [google client](#apis-consumed) keys. Add the google maps and google client keys to your newly created `config/application.yml` file and add it to your `.gitignore` file. Be sure to read the [google API docs](https://developers.google.com/docs/api) for a deeper undestanding of the app.

    ```shell
    $ bundle exec figaro install
    ```
  6. Start up your local server

      ```shell
      $ rails s
      ```
  7. Open web browser and visit link to access the front end application [http://localhost:3000](http://localhost:3000). At this point, you should see the Moon Graden landing page!
  

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- USAGE EXAMPLES -->
## Usage

Use this space to show useful examples of how a project can be used. Additional screenshots, code examples and demos work well in this space. You may also link to more resources.

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


![Alt Text](https://giphy.com/gifs/jcFvUVDojVkeeuMeuO)

<!-- CONTACT -->
## Contributors


<p align="right">(<a href="#top">back to top</a>)</p>



<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

* []()
* []()
* []()

<p align="right">(<a href="#top">back to top</a>)</p>
