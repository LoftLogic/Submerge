import * as admin from 'firebase-admin';
import { User, Match } from '../types/user';

// You can import service account from a JSON file
// import serviceAccount from './serviceAccountKey.json';

const firebaseApp = admin.initializeApp({
  credential: admin.credential.applicationDefault(),
  // If using a JSON file: credential: admin.credential.cert(serviceAccount as admin.ServiceAccount),
  // Optional: databaseURL: "https://your-project-id.firebaseio.com"
});

export const db = admin.firestore();
export const auth = admin.auth();

export default firebaseApp;

export const createUser = (user: User): boolean => {
    return false;
}

export const getUserById = async (id: string): Promise<User | null> => {
    return null;
}

export const updateUser = async (id: string, userData: Partial<User>): Promise<void> => {
    return;
}

export const getAllUsers = async (): Promise<User[]> => {
    return [];
}

export const createMatch = async  (userId: string, matchedUserId: string, status: Match['status']): Promise<Match> => {
	return {
	id: "",
	userId: "",
	matchedUserId: "",
	status: 'liked',
	createdAt: new Date()
	}
}

export const getMatchesByUserId = async (userId: string): Promise<Match[]> => {
    return [
        {
            id: "",
            userId: "",
            matchedUserId: "",
            status: 'liked',
            createdAt: new Date()
        }
    ]
};



