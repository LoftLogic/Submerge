import { Router } from 'express';
import { userRouter } from './users';
import { poolRouter } from './pools';
// import authRoutes from './auth.routes';
// import userRoutes from './user.routes';

const router = Router();

router.use('/users', userRouter);
router.use('/profiles', poolRouter);

router.get('/health', (req, res) => {
    res.json({ status: 'ok', timestamp: new Date().toISOString() });
});

export default router;