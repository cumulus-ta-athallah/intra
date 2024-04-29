# Define base image for backend (Python)
FROM python:3.12-slim AS backend

# Set working directory
WORKDIR /app

# Copy requirements file and install dependencies
COPY requirements.txt ./
RUN pip install -r requirements.txt

# Copy backend project code
COPY . .

# Apply model to database
RUN python manage.py migrate

# Expose Django port
EXPOSE 80

# Run command in the final image (choose either backend or frontend)
CMD ["python", "manage.py", "runserver", "0.0.0.0:80"]
