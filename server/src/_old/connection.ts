/**
 * Create connection from the database and configures its enviroment variables.
 * NOTE: We might end up using firebase instead
 */

import { Sequelize } from 'sequelize';
import dotenv from 'dotenv';

dotenv.config()

export const sequelize = new Sequelize(
    process.env.DB_NAME || 'submerge',
    process.env.DB_USER || 'root',
    process.env.DB_PASSWORD || '',
    {
        host: process.env.DB_HOS || 'localhost',
        dialect: 'mysql',
        logging: process.env.NODE_ENV !== 'production',
        pool: {
            max: 10,
            min: 0,
            acquire: 30000,
            idle: 10000,
        }
    }
);

export const createConnection = async () => {
    try {
        await sequelize.authenticate();
        console.log("Database connection established");
        await sequelize.sync({ alter: process.env.NODE_ENV !== 'production' })
        console.log('Models synchronized')
    } catch (error) {
        console.error("Cannot connect to database:", error);
        throw error;
    }
};
