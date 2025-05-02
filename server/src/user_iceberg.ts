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

type Gender = 'male' | 'female' | 'other';
type Sexuality = 'straight' | 'homosexual' | 'bisexual';
type Ethnicity = 'Caucasian' | 'East Asian' | 'Southeast Asian' | 'South Asian' | 'African' | 'Latino' | 'Middle Eastern' | 'Native American' | 'Pacific Islander';

interface User {
    id: string;
    name: string;
    gender: Gender;
    height: number; // in inches
    age: number;
    sexuality: Sexuality;
    location: string;
    ethnicity: Ethnicity[];
}

function display_height(user: User): string {
    return `${user.height / 12}'${user.height % 12}ft"`;
}


