import { Request, Response } from 'express';
import { createUser, getUserById, updateUser, getAllUsers } from '../database/firebase';
import { User } from '../types';


export const CreateUserController = async (req: Request, res: Response): Promise<void> => {
    try {
        const userData = req.body; // as Omit<User, 'id' | 'createdAt'> implement this maybe?
        const newUser = await createUser(userData);
        res.status(201).json(newUser);
    } catch (error) {
        console.error("Failed to create user:", error);
        res.status(500).json({ error: 'Failed to create user' })
    }
};

export const getUserController = async (req: Request, res: Response): Promise<void> => {
    try {
        const { id } = req.params;
        const user = await getUserById(id);

        if (!user) {
            res.status(404).json({ error: 'User not found' });
            return;
        }
        res.status(200).json(user);
    } catch (error) {
        console.error('Error fetching user', error);
        res.status(500).json({ error: 'Failed to fetch user' })
    }
};

export const updateUserController = async (req: Request, res: Response): Promise<void> => {
    try {
        const { id } = req.params;
        const userData = req.body as Partial<User>;

        await updateUser(id, userData);
        const updatedUser = await getUserById(id);

        res.status(200).json(updatedUser);

    } catch (error) {
        console.error('Error fetching user', error);
        res.status(500).json({ error: 'Failed to update user' })
    }
}

export const getAllUsersController = async (_req: Request, res: Response): Promise<void> => {
  try {
    const users = await getAllUsers();
    res.status(200).json(users);
  } catch (error) {
    console.error('Error fetching users:', error);
    res.status(500).json({ error: 'Failed to fetch users' });
  }
};
