Django Test app for deploying django app using postgres into kubernetes cluster
===============================================================================

# Run this app in local
- Pull the latest code from the repo
- Create .env file and add necessary environment variable (take reference from example.env)
- Create virtual environment using command **python -m venv env**
- Activate virtual env by **source env/bin/activate**
- Install requirements using command **pip install -r requirements.txt**
- Run **python manage.py makemigrations**
- Run **python manage.py migrate**
- Create superuser using command  **python manage.py createsuperuser**
- Collect staticfiles using command **python manage.py collectstatic**
- Run the server using command **python manage.py runserver**

# Create and publish docker image
- Create image using Dockerfile in the root directory of this project (next to manage.py file) using command **docker build -t kube-test:django .**
- Tag the created image using command **docker tag kube-test:django rashik07/kube-test:django**
- Login to dockerhub using command **docker login**
- Push the created image using command **docker push rashik07/kube-test:django**

# Run in Kubernetes cluster
- Start Minikube using command **minikube start**
- Run command **kubectl apply -f kubernetes/db-config.yaml**
- Run command **kubectl apply -f kubernetes/db-deployment.yaml**
- Run command **kubectl apply -f kubernetes/db-service.yaml**
- Run command **kubectl apply -f kubernetes/app-deployment.yaml**
- Run command **kubectl apply -f kubernetes/app-service.yaml**
- Expose port to local using command **kubectl port-forward svc/kube-test 8000:8000**
- Run inside django container
  - **python manage.py makemigrations**
  - **python manage.py migrate**
  - **python manage.py createsuperuser**
  - **python manage.py collectstatic**
- Access django admin panel in your browser **http://localhost:8000/admin/**



