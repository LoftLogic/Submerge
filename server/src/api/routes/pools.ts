import { Router } from "express";

// Nested in /user
export const poolRouter: Router = Router();

poolRouter.get("/", (req, res) => {
    res.send("Pool")
});

