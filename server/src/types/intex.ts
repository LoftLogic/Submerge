export type Gender = 'male' | 'female' | 'other';
export type Sexuality = 'straight' | 'homosexual' | 'bisexual';
export type Ethnicity = 'Caucasian' | 'East Asian' | 'Southeast Asian' | 'South Asian' | 'African' | 'Latino' | 'Middle Eastern' | 'Native American' | 'Pacific Islander';

export interface User {
    id: string;
    name: string;
    gender: Gender;
    height: number; // in inches
    age: number;
    birthdate: Date;
    sexuality: Sexuality;
    location: string;
    ethnicity: Ethnicity[];
    images: string[];
    createdAt: Date;
};

export interface Match {
    id: string,
    userId: string;
    matchedUserId: string;
    status: 'liked' | 'matched' | 'rejected';
    createdAt: Date;
}