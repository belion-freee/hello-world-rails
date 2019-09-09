# Hello World Rails
You can easily create Rails web application with docker-compose.

The functions often used in web applications are implemented in advance.

It can be used for project and learning.

Please refer to [Wiki](https://github.com/belion-freee/hello-world-rails/wiki/Development-Wiki) for details of the library. But This is written in Japanese...Sorry.

## Including
There are includeing such tool and function, liblary.

- [Rspec](http://rspec.info/)
- [Capybara](https://github.com/teamcapybara/capybara)
- [Selenium](https://github.com/SeleniumHQ/selenium)
- [Bootstrap4](https://getbootstrap.com/)
- [Webpacker](https://github.com/rails/webpacker)
- [PostgerSQL](https://www.postgresql.org/)
- [JQuery](https://jquery.com/)
- [Animate.css](https://daneden.github.io/animate.css/)
- [Sweetalert2](https://sweetalert2.github.io/)
- [Chart.js](https://www.chartjs.org/)
- [Webmock](https://github.com/bblimke/webmock)
- [Babaloa](https://github.com/belion-freee/babaloa)
- [Bolo](https://github.com/belion-freee/bolo)

## Install Docker
Please install Docker on your PC first.
Refer to [here](https://docs.docker.com/install/) for the installation procedure.

If you are a Linux user you need to install docker-compose with [this operations](https://docs.docker.com/compose/install/#install-compose).

## Clone this repository
Then clone the repository and move to project folder.
Plese set your project name like `sample_app`.

```
git clone https://github.com/belion-freee/hello-world-rails.git <Project name>
cd <Project name>
```

## Execute Setup
Only you need to execute initializing script.

```
./qs init --webpack
```

### webpack-dev-server
If you wanna use webpack-dev-server, Plese add `webpacker` to links of web at docker-compose.yml

```
web: &app
    links:
      - db
      - chrome
      - webpacker # add this
```

## Hello World!!
Finally, please access `http://localhost:3000` as Rails is running.
Enjoy your Rails!
