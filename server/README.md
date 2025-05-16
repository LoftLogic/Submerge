# Submerge Server

A TypeScript Express backend with MySQL for the Submerge dating app.

## Setup

1. Install dependencies:
```bash
npm install
```

2. Create a `.env` file in the root directory with the following variables:
```
DB_HOST=localhost
DB_USER=your_mysql_username
DB_PASSWORD=your_mysql_password
DB_NAME=submerge_db
PORT=3001
```

3. Create the database:
```sql
CREATE DATABASE submerge_db;
```

4. Start the development server:
```bash
npm run dev
```

## API Endpoints

- `GET /users` - Get all users
- `POST /users` - Create a new user
  - Body: `{ "name": "string", "location": "string" }`

## Development

- `npm run dev` - Start development server with hot reload
- `npm run build` - Build the TypeScript code
- `npm start` - Start the production server 

## Code Structure
The code structure appears as follows:
/src
|--> /api: HTTP calls
|  |--> /routes: Express route definitions, mapped to controller functions
|  |--> /middelware: Intercepts requests before they hit the controllers (e.g. user auth)
|--> /services: buisness Logic
|  |--> /algorithms: compatibility or feed algorithms
|  |--> /machine-learning: all AI implementations will go here (for now)
|--> /controllers: bridge route and buisness logic (Lucia Nuenez will be proud)
|--> /types: store interfaces and other types
|--> /models: ORM and schema definitions
|--> /database: data access
index.ts 