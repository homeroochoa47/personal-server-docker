
<div align="center">
<h1 align="center">
<br>personal-server-docker
</h1>
<h3>An old project documenting my experimentation with Docker, Django, AWS EC2, and more.</h3>
<h3>◦ Readme generated with README-AI using ChatGPT for fun :)</h3>

<p align="center">
<img src="https://img.shields.io/badge/HTML5-E34F26.svg?style&logo=HTML5&logoColor=white" alt="HTML5" />
<img src="https://img.shields.io/badge/Gunicorn-499848.svg?style&logo=Gunicorn&logoColor=white" alt="Gunicorn" />

<img src="https://img.shields.io/badge/Python-3776AB.svg?style&logo=Python&logoColor=white" alt="Python" />
<img src="https://img.shields.io/badge/Docker-2496ED.svg?style&logo=Docker&logoColor=white" alt="Docker" />
<img src="https://img.shields.io/badge/Django-092E20.svg?style&logo=Django&logoColor=white" alt="Django" />
<img src="https://img.shields.io/badge/Markdown-000000.svg?style&logo=Markdown&logoColor=white" alt="Markdown" />
</p>
</div>

---

## 📒 Table of Contents
- [📒 Table of Contents](#-table-of-contents)
- [📍 Overview](#-overview)
- [⚙️ Features](#-features)
- [📂 Project Structure](#project-structure)
- [🧩 Modules](#modules)
- [🚀 Getting Started](#-getting-started)
- [🗺 Roadmap](#-roadmap)
- [🤝 Contributing](#-contributing)
- [📄 License](#-license)
- [👏 Acknowledgments](#-acknowledgments)

---


## 📍 Overview

This project was originally my portfolio website, which turned into an experiment with deploying a Django project with AWS in a docker container. It stored and retrieved personal and project information from a PostgreSQL database in AWS RDS, and used NGNIX in a docker container to serve the project from an EC2 instance.

---

## ⚙️ Features

| Feature                | Description                           |
| ---------------------- | ------------------------------------- |
| **⚙️ Architecture**     | The codebase follows a typical Django architecture, with a separation of concerns into different modules for models, views, tests, and configurations. It utilizes Docker for containerization and Nginx as a reverse proxy server for serving the application. The architecture allows for scalability and ease of deployment.    |
| **🔗 Dependencies**    | The primary dependencies for this project are Django, PostgreSQL, Gunicorn, Nginx, and Docker. Django provides the web framework, PostgreSQL is used as the database, Gunicorn runs the application server, and Nginx handles reverse proxy. Docker is used for containerization. These external libraries and systems enable the reliable development and deployment of the project.    |
| **🧩 Modularity**      | The project exhibits good modularity by separating functionality into distinct Django modules, such as models, views, and tests. Each module has a specific purpose, making them easier to understand and modify. This modularity enables better code maintenance and reusability.    |
| **🔐 Security**        | The project does not have explicit security measures documented in the repository. However, Django provides built-in security features such as CSRF protection, secure session management, built-in defenses against common web vulnerabilities, and authentication and authorization systems. Security best practices, such as secure site configurations and regular security audits, can further enhance the system's security posture.    |
| **🔀 Version Control** | Git has been used for version control in this project, as evidenced by the repository link. The team can leverage Git's branching and merging capabilities for collaborative development, code review, and managing different versions or feature branches. However, the repository does not mention any specific version control strategies or tools beyond using Git itself.    |
| **🔌 Integrations**    | The codebase integrates with PostgreSQL for data storage and retrieval. Additionally, Docker is used to create a Docker container for the application, and Nginx is utilized as a reverse proxy server for serving the Django application. These integrations enhance the resilience, ease of deployment, and flexibility

---

## 🧩 Modules

<details closed><summary>Root</summary>

| File                                                                                                 | Summary                                                                                                                                                                                                          |
| ---                                                                                                  | ---                                                                                                                                                                                                              |
| [Dockerfile](https://github.com/homeroochoa47/personal-server-docker.git/blob/main/Dockerfile)       | This code snippet sets up a Docker container for a Python application. It installs dependencies, sets environment variables, copies the project files, modifies file permissions, and runs an entrypoint script. |
| [manage.py](https://github.com/homeroochoa47/personal-server-docker.git/blob/main/manage.py)         | This code snippet is Django's command-line utility for administrative tasks. It sets the necessary environment variable and uses the Django management module to execute commands from the command line.         |
| [entrypoint.sh](https://github.com/homeroochoa47/personal-server-docker.git/blob/main/entrypoint.sh) | This code snippet waits for a PostgreSQL database to start by continuously checking if it is accessible. Once the database is available, the script proceeds to execute other commands specified by the user.    |

</details>

<details closed><summary>Core</summary>

| File                                                                                                  | Summary                                                                                                                                                                                                                                                                                                               |
| ---                                                                                                   | ---                                                                                                                                                                                                                                                                                                                   |
| [asgi.py](https://github.com/homeroochoa47/personal-server-docker.git/blob/main/core/asgi.py)         | This code snippet is the ASGI configuration file for a Django project. It sets up and exposes the ASGI app as the module-level variable named "application". It also defines the project's default settings module.                                                                                                   |
| [settings.py](https://github.com/homeroochoa47/personal-server-docker.git/blob/main/core/settings.py) | This Django settings file contains the core functionalities of the project. It includes configuration for database, static files, middleware, template engines, internationalization, logging, authentication, and other features such as CORS and HTTPS. It also allows customization through environment variables. |
| [urls.py](https://github.com/homeroochoa47/personal-server-docker.git/blob/main/core/urls.py)         | This code sets up the main URL patterns for a Django project. It includes the admin site URL and routes all other requests to the'mysite' app. It also handles serving static files and loads project settings.                                                                                                       |
| [wsgi.py](https://github.com/homeroochoa47/personal-server-docker.git/blob/main/core/wsgi.py)         | This code snippet is the WSGI configuration for a Django project. It sets up the WSGI callable as a module-level variable named "application" and gets the Django WSGI application object.                                                                                                                            |

</details>

<details closed><summary>Mysite</summary>

| File                                                                                                | Summary                                                                                                                                                                                                                                                                                                                                                                                                                                |
| ---                                                                                                 | ---                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| [models.py](https://github.com/homeroochoa47/personal-server-docker.git/blob/main/mysite/models.py) | The provided code includes two models: MyInformation and Projects. MyInformation stores personal information such as first name, profile picture, location, resume, and email. It also includes links to GitHub and LinkedIn profiles.Projects model stores information about projects, including title, cover image URL, and description.Both models have a string representation that returns the corresponding title or first name. |
| [apps.py](https://github.com/homeroochoa47/personal-server-docker.git/blob/main/mysite/apps.py)     | The code snippet is defining a Django app configuration class called MysiteConfig. It sets the default type for auto-generated primary keys to a BigAutoField, and assigns the app's name to "mysite".                                                                                                                                                                                                                                 |
| [admin.py](https://github.com/homeroochoa47/personal-server-docker.git/blob/main/mysite/admin.py)   | The code snippet registers the MyInformation and Projects models with the Django admin site, allowing management and administration of these models through the admin interface.                                                                                                                                                                                                                                                       |
| [tests.py](https://github.com/homeroochoa47/personal-server-docker.git/blob/main/mysite/tests.py)   | The code snippet imports the Django TestCase class for testing. It contains a placeholder for creating tests, allowing developers to define test cases to verify the functionality of their Django applications.                                                                                                                                                                                                                       |
| [urls.py](https://github.com/homeroochoa47/personal-server-docker.git/blob/main/mysite/urls.py)     | This code snippet sets up a Django URL pattern to map the root URL ("/") to the main view function from views.py. The main view function will be invoked when the root URL is accessed.                                                                                                                                                                                                                                                |
| [views.py](https://github.com/homeroochoa47/personal-server-docker.git/blob/main/mysite/views.py)   | This code fetches a specific record from the database, based on a filter condition, and renders it in a template named "main.html". The record is retrieved from the "MyInformation" model and filtered based on the "first_name" field equal to "Homero". The retrieved record is passed to the template as "my_info".                                                                                                                |

</details>

<details closed><summary>Migrations</summary>

| File                                                                                                                       | Summary                                                                                                                                                                                                                                                                              |
| ---                                                                                                                        | ---                                                                                                                                                                                                                                                                                  |
| [0001_initial.py](https://github.com/homeroochoa47/personal-server-docker.git/blob/main/mysite/migrations/0001_initial.py) | The code snippet defines two models: MyInformation and Projects. MyInformation model has fields for personal information like name, profile picture, location, resume, email, GitHub, and LinkedIn links. Projects model has fields for project title, cover image, and description. |

</details>

<details closed><summary>Templates</summary>

| File                                                                                                          | Summary                                                                                                                                                                                                                                                                                                                                                                                             |
| ---                                                                                                           | ---                                                                                                                                                                                                                                                                                                                                                                                                 |
| [main.html](https://github.com/homeroochoa47/personal-server-docker.git/blob/main/mysite/templates/main.html) | The provided code snippet is an HTML file that represents a personal portfolio website. It includes various sections such as a navigation menu, an "About Me" section, a "My Work" section, and a "Contact Me" section. It also includes external libraries and stylesheets for styling and animations. The website showcases the developer's name, skills, work examples, and contact information. |

</details>

<details closed><summary>Nginx</summary>

| File                                                                                                 | Summary                                                                                                                                                                                                                                                                                 |
| ---                                                                                                  | ---                                                                                                                                                                                                                                                                                     |
| [Dockerfile](https://github.com/homeroochoa47/personal-server-docker.git/blob/main/nginx/Dockerfile) | This code snippet sets the base image to an Nginx Alpine version, copies a custom nginx configuration file, and replaces the default Nginx configuration with the custom configuration.                                                                                                 |
| [nginx.conf](https://github.com/homeroochoa47/personal-server-docker.git/blob/main/nginx/nginx.conf) | This code snippet configures the server to listen on port 80 and handle requests for homeroochoa.com. It proxies requests to the web application running on port 8000, sets headers for IP address and host, and handles static file requests by aliasing to the appropriate directory. |

</details>

---

## 🚀 Getting Started
It's worth noting that the setup for this project is quite tedious with respect to the AWS side of things, and as a result, I would recommend against going about setting it up. I have this more for the purpose of documenting and displaying my work.
