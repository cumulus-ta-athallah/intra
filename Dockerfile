# Define base image for backend (Python)
FROM python:3.12-slim AS backend

# Set working directory
WORKDIR /app

# Copy requirements file and install dependencies
COPY requirements.txt ./
RUN pip install -r requirements.txt

# Copy backend project code
COPY . .

# Expose Django port
EXPOSE 80

# Run start script
CMD ["sh", "runserver.sh"]
