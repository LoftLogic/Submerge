interface ActionButtonsProps {
  onSwipe: (direction: 'left' | 'right') => void;
}

const ActionButtons = ({ onSwipe }: ActionButtonsProps) => {
  return (
    <div className="flex justify-center gap-8 p-4">
      <button
        onClick={() => onSwipe('left')}
        className="w-16 h-16 rounded-full bg-red-500 text-white flex items-center justify-center shadow-lg hover:bg-red-600 transition-colors"
      >
        ✕
      </button>
      <button
        onClick={() => onSwipe('right')}
        className="w-16 h-16 rounded-full bg-green-500 text-white flex items-center justify-center shadow-lg hover:bg-green-600 transition-colors"
      >
        ♥
      </button>
    </div>
  );
};

export default ActionButtons; 