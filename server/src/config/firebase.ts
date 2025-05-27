import * as admin from 'firebase-admin';

// import serviceAccount from '../../serviceAccountKey';

const firebaseApp = admin.initializeApp({
  credential: admin.credential.applicationDefault(),
  // If using a JSON file: credential: admin.credential.cert(serviceAccount as admin.ServiceAccount),
  // Optional: databaseURL: "https://your-project-id.firebaseio.com"
});

export const db = admin.firestore();
export const auth = admin.auth();

export default firebaseApp;