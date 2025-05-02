import express from 'express';
import cors from 'cors';
import bodyParser from 'body-parser';
import * as UserIceberg from '../user_iceberg';

/**
 * API model for the backend
 */
const app = express();
app.use(cors());
app.use(bodyParser.json());

// Example route that returns an IcebergSurface
app.get('/profile/0', (req, res) => {
    const profile: UserIceberg.IcebergSurface = {
        id: '1',
        name: 'John Doe',
        gender: 'male',
        height: 72,
        age: 25,
        sexuality: 'straight',
        location: 'New York',
        ethnicity: ['Caucasian']
    };
    res.json(profile);
});

app.get('/profile/1', (req, res) => {
    const profile: UserIceberg.IcebergWaterline = {
        id: '1',
        name: 'John Doe',
        gender: 'male',
    };
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
});



