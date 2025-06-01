import { Router } from "express";
import { body } from 'express-validator';
import { validate } from "../middleware/validate";
// IMPORT VALIDATE STUFF

// import * as userController from "../controllers/users.controller" implement later

// Nested in /user
export const userRouter: Router = Router();

userRouter.post("/register",
    validate([
        body('email').isEmail().normalizeEmail(),
        body('password').isLength({ min: 8 }),
        body('profile.name').trim().isLength({ min: 2, max: 100 }),
        body('profile.gender').isIn(['Male', 'Female', 'Other']),
        body('profile.birthdate').isISO8601().toDate(),
        body('profile.height').isInt({ min: 100, max: 250 }),
        body('profile.sexuality').isIn(['Straight', 'Homosexual', 'Bisexual', 'Other']),
        body('profile.location').trim().notEmpty(),
        body('profile.ethnicity').isArray({ min: 1 }),
        body('profile.ethnicity.*').isIn(['Caucasian', 'East Asian', 'Southeast Asian', 'South Asian', 'African', 'Latino', 'Middle Eastern', 'Native American', 'Pacific Islander'])
    ]),
    // userController.register
);