import 'dotenv/config';

export const env = {
  port: Number(process.env.PORT) || 4000,
  dbUrl: process.env.DATABASE_URL as string,
  jwtSecret: process.env.JWT_SECRET as string,
};