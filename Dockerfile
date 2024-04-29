# Define base image for backend (Python)
FROM python:3.12-slim AS backend

# Set working directory
WORKDIR /app/backend

# Copy requirements file and install dependencies
COPY requirements.txt ./
RUN pip install -r requirements.txt

# Copy backend project code
COPY . .

# Expose Django port
EXPOSE 8000

# Define base image for frontend (Node.js and Yarn)
FROM node:lts-alpine AS frontend

# Set working directory
WORKDIR /app/frontend

# Copy package.json and install dependencies
COPY students-fe/package.json students-fe/yarn.lock ./
RUN yarn install

# Copy frontend project code
COPY . .

# Expose React development port (usually 3000)
EXPOSE 3000

# Run command in the final image (choose either backend or frontend)
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
# Uncomment the line below to run the React app in development mode
CMD ["yarn", "start"]
