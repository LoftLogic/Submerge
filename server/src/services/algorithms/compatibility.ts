import { User } from '../../types';

export const checkAgeCompatibility = (user1: User, user2: User): boolean => {
    const age1 = user1.age;
    const age2 = user2.age

    const ageDifference = Math.abs(age1 - age2);

    const youngerAge = Math.min(age1, age2);

    const acceptableGap = youngerAge / 2 + 5;

    return ageDifference <= acceptableGap;
}
