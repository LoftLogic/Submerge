import { useState } from 'react';
import SwipeCard from '../components/SwipeCard';
import ActionButtons from '../components/ActionButtons';

interface Profile {
  id: string;
  name: string;
  age: number;
  location: string;
  images: string[];
}

const HomePage = () => {
  const [currentIndex, setCurrentIndex] = useState(0);
  
  // Dummy data - replace with actual API calls later
  const profiles: Profile[] = [
    {
      id: '1',
      name: 'Sarah',
      age: 28,
      location: 'New York',
      images: ['https://placeholder.com/400x600']
    },
    // Add more dummy profiles
  ];

  const handleSwipe = (direction: 'left' | 'right') => {
    setCurrentIndex(prev => prev + 1);
    // Add swipe logic here
  };

  return (
    <div className="flex flex-col h-screen bg-gray-100">
      <div className="flex-1 flex items-center justify-center p-4">
        {profiles.map((profile, index) => (
          <SwipeCard
            key={profile.id}
            profile={profile}
            isActive={index === currentIndex}
          />
        ))}
      </div>
      <ActionButtons onSwipe={handleSwipe} />
    </div>
  );
}

export default HomePage; 