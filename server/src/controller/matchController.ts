import { Request, Response } from 'express';
import { createMatch, getMatchesByUserId, getUserById } from '../database/firebase';
import { checkAgeCompatibility } from '../services/algorithms/compatibility';

export const createMatchController = async (req: Request, res: Response): Promise<void> => {
    try {


        const { userId, matchedUserId, status } = req.body;
        
        const user = await getUserById(userId);
        const matchedUser = await getUserById(matchedUserId);


        if (!user || !matchedUser) {
            res.status(404).json({ error: 'One or both users not found' });
            return;
        }
        if (!checkAgeCompatibility(user, matchedUser)) {
            res.status(422).json({ error: "Users not age compatible" });
            return;
        }

        const match = await createMatch(userId, matchedUserId, status);
        res.status(201).json(match);
    } catch (error) {
        console.error("Error creating match:", error);
        res.status(500).json({ error: "Failed to create match" })
    }
}

export const getMatchesController = async (req: Request, res: Response): Promise<void> => {
  try {
    const { userId } = req.params;
    const matches = await getMatchesByUserId(userId);
    
    res.status(200).json(matches);
  } catch (error) {
    console.error('Error fetching matches:', error);
    res.status(500).json({ error: 'Failed to fetch matches' });
  }
};