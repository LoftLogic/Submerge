import express from 'express';
import cors from 'cors';
import dotenv from 'dotenv';
import { createPool } from 'mysql2/promise';

dotenv.config();

const app = express();
const port = process.env.PORT || 3001;

// Middleware
app.use(cors());
app.use(express.json());

// Database connection
const pool = createPool({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME,
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0
});

// Create users table if it doesn't exist
async function initializeDatabase() {
  try {
    const connection = await pool.getConnection();
    await connection.query(`
      CREATE TABLE IF NOT EXISTS users (
        id INT AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(255) NOT NULL,
        gender ENUM('male', 'female', 'other') NOT NULL,
        age INT NOT NULL,
        sexuality ENUM('straight', 'homosexual', 'bisexual') NOT NULL,
        location VARCHAR(255) NOT NULL,
        ethnicity JSON NOT NULL,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
      )
    `);
    connection.release();
    console.log('Database initialized successfully');
  } catch (error) {
    console.error('Error initializing database:', error);
  }
}

// Routes
app.get('/users', async (req, res) => {
  try {
    const [rows] = await pool.query('SELECT * FROM users');
    res.json(rows);
  } catch (error) {
    res.status(500).json({ error: 'Error fetching users' });
  }
});

app.post('/users', async (req, res) => {
  const { name, gender, age, sexuality, location, ethnicity } = req.body;
  
  if (!name || !gender || !age || !sexuality || !location || !ethnicity) {
    return res.status(400).json({ error: 'All fields are required' });
  }

  // Validate ethnicity array
  const validEthnicities = [
    'Caucasian', 'East Asian', 'Southeast Asian', 'South Asian',
    'African', 'Latino', 'Middle Eastern', 'Native American',
    'Pacific Islander'
  ];
  
  if (!Array.isArray(ethnicity) || !ethnicity.every(e => validEthnicities.includes(e))) {
    return res.status(400).json({ error: 'Invalid ethnicity values' });
  }

  try {
    const [result] = await pool.query(
      'INSERT INTO users (name, gender, age, sexuality, location, ethnicity) VALUES (?, ?, ?, ?, ?, ?)',
      [name, gender, age, sexuality, location, JSON.stringify(ethnicity)]
    );
    res.status(201).json({ message: 'User created successfully', result });
  } catch (error) {
    res.status(500).json({ error: 'Error creating user' });
  }
});

// Initialize database and start server
initializeDatabase().then(() => {
  app.listen(port, () => {
    console.log(`Server is running on port ${port}`);
  });
}); 