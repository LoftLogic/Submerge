export type Gender = 'Male' | 'Female' | 'Other';
export type Sexuality = 'Straight' | 'Homosexual' | 'Bisexual';
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
    profile: UserProfile;
}

export interface UserProfile {
    "Media": MediaInterests;
    "Personal": PersonalInterests;
    "Sensual": SensualInterests
    "Preferences": PreferenceSheet
}



export interface PreferenceSheet {

}

export interface MediaInterests {

}

export interface PersonalInterests {

}

export interface SensualInterests {

}

export interface Match {
    id: string,
    userId: string;
    matchedUserId: string;
    status: 'liked' | 'matched' | 'rejected';
    createdAt: Date;
}