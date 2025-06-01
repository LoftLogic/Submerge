export type Gender = 'Male' | 'Female' | 'Other';
export type Sexuality = 'Straight' | 'Homosexual' | 'Bisexual' | 'Other';
export type Ethnicity = 'Caucasian' | 'East Asian' | 'Southeast Asian' | 'South Asian' | 'African' | 'Latino' | 'Middle Eastern' | 'Native American' | 'Pacific Islander';

export interface User {
    id: string;
    email: string;
    createdAt: Date;
    updatedAt: Date;
    profile: UserDisplay; // WILL BE PROFILE LATER, THIS IS JUST FOR TESTING
}

export interface UserProfile {
    "Display": UserDisplay;
    "Media": MediaSheet;
    "Hobby": HobbySheet;
    "Values": ValueSheet; 
    "Sensual": IntamacySheet;
}

export interface CreateUserDto {
    email: string;
    password: string;
}

export interface UpdateUserDto {
    email?: string;
    password?: string;
}

export interface UserDisplay {
    name: string;
    gender: Gender;
    height: number; 
    age: number;
    birthdate: Date;
    sexuality: Sexuality;
    location: string;
    ethnicity: Ethnicity[];
    images: string[];
}

export interface MediaSheet {

}

export interface HobbySheet {

}

export interface ValueSheet {

}

export interface IntamacySheet {

}

export interface Match {
    id: string,
    userId: string;
    matchedUserId: string;
    status: 'liked' | 'matched' | 'rejected';
    createdAt: Date;
}