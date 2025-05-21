interface SwipeCardProps {
  profile: {
    name: string;
    age: number;
    location: string;
    images: string[];
  };
  isActive: boolean;
}

const SwipeCard = ({ profile, isActive }: SwipeCardProps) => {
  return (
    <div
      className={`absolute w-[320px] h-[480px] bg-white rounded-2xl shadow-lg overflow-hidden
        ${isActive ? 'z-10' : 'z-0'}`}
    >
      <img
        src={profile.images[0]}
        alt={profile.name}
        className="w-full h-full object-cover"
      />
      <div className="absolute bottom-0 left-0 right-0 p-4 bg-gradient-to-t from-black/60 to-transparent">
        <h2 className="text-white text-2xl font-semibold">
          {profile.name}, {profile.age}
        </h2>
        <p className="text-white/80">{profile.location}</p>
      </div>
    </div>
  );
};

export default SwipeCard; 