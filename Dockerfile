# Define base image for backend (Python)
FROM python:3.12-slim AS backend

# Set working directory
WORKDIR /app

# Copy requirements file and install dependencies
COPY requirements.txt ./
RUN pip install -r requirements.txt

# Copy backend project code
COPY . .

# Load environment variables
ARG DB_NAME=${DB_NAME}
ARG DB_USER=${DB_USER}
ARG DB_PASSWORD=${DB_PASSWORD}
ARG DB_HOST=${DB_HOST}
ARG DB_PORT=${DB_PORT}

# Set environment variables
ENV DB_NAME=${DB_NAME}
ENV DB_USER=${DB_USER}
ENV DB_PASSWORD=${DB_PASSWORD}
ENV DB_HOST=${DB_HOST}
ENV DB_PORT=${DB_PORT}

# Apply model to database
RUN python manage.py migrate

# Expose Django port
EXPOSE 80

# Run command in the final image (choose either backend or frontend)
CMD ["python", "manage.py", "runserver", "0.0.0.0:80"]
