/**
 * The user iceberg model
 * 
 * Level 0: Visible to everyone
 * - Name
 * - Gender
 * - Age
 * - Height
 * - Location
 * - Ethnicity
 * 
 * Level 1: Visible to users after matching
 * - Job
 * - Education
 * - Religion
 * - Politics
 * - Interests
 * 
 * Level 2: Visible to users after chatting:
 * - Goals
 * - Expectations
 * 
 * 
 * Level 3: Visible to server side AI
 * - Personality
 * - Type in partner
 * -
 * 
 */

export type Gender = 'male' | 'female' | 'other';
export type Sexuality = 'straight' | 'homosexual' | 'bisexual';
export type Ethnicity = 'Caucasian' | 'East Asian' | 'Southeast Asian' | 'South Asian' | 'African' | 'Latino' | 'Middle Eastern' | 'Native American' | 'Pacific Islander';



export interface IcebergSurface {
    id: string;
    name: string;
    gender: Gender;
    height: number; // in inches
    age: number;
    sexuality: Sexuality;
    location: string;
    ethnicity: Ethnicity[];
};


/**
 * Slightly into the iceberg. Contains information about the user's general lifestyle and interests. Available after matching.
 */
export interface IcebergWaterline {
    
};


/**
 * The deeper layers of the iceberg information model. Contains insights into the user's character. Available after chatting.
 */
export interface IcebergDeep {

};

/**
 * The  lowest of the iceberg information model. Contains the user's most private yet effective information. Available to the server side AI and algorithms
 */
export interface IcebergBottom {

}


interface User {
    level0 : IcebergSurface;
    level1 : IcebergWaterline;
    level2 : IcebergDeep;
    level3 : IcebergBottom;
}


function display_height(user: User): string {
    return `${user.level0.height / 12}'${user.level0.height % 12}ft"`;
}


