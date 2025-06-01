import express from 'express';
import cors from 'cors';

import { config } from 'dotenv';

import { db, auth } from './config/firebase';

import { connectDatabase } from './database/firebase';

config();

const app = express();

app.use(express.json());
app.use(express.urlencoded({ extended: true }));


// app.use('/api', routes);

const PORT = process.env.PORT || 3000;

const start = async () => {
    try {
        await connectDatabase();
        app.listen(PORT, () => {
            console.log(`Server running on port ${PORT}`);
        })
    } catch (err) {
        console.error("Failed to start server:", err);
        process.exit(1);
    }
}

start();