# React App + Django API

A simple integration between a Django API and a React App.

This is made from [@diogosouza](https://github.com/diogosouza)'s article.

This project consists of two internal projects:

- *students*: the Django project containing the REST API along with all the backend code;
- *students-fe*: the React project with all the Node dependencies, settings and things related to the frontend.

## Run it locally

In order to run the projects locally you need to have Node, `yarn` and `python3` installed on your machine.

### Running the Django project

First, create a Python virtual environment to isolate the projects:

```bash
python3 -m venv env
```

Then, activate it:

```bash
source env/bin/activate
```

`cd` into the *venv* and clone the project from GitHub:

```bash
git clone https://github.com/determinedguy/ta-boiler
```

Add the Django dependencies:

```bash
pip install django djangorestframework django-cors-headers
```

Finally, run the project:

```bash
python manage.py runserver
```

That's it!

Access the address <http://localhost:8000/api/students/> and check if the API is up.

### Running the React project

Enable [Corepack](https://yarnpkg.com/corepack) first (run with Administrator) if you haven't done it yet (`npm` is required):

```bash
corepack enable
```

Then, `cd` the *students-fe* directory and run:

```bash
yarn install
yarn start
```

## References

- [Creating an app with React and Django](https://blog.logrocket.com/creating-an-app-with-react-and-django/)
- [Using Docker and docker-compose to create a development environment for React + Django application](https://michelts.medium.com/using-docker-and-docker-compose-to-create-a-development-environment-for-react-django-application-c686368edfa2)
