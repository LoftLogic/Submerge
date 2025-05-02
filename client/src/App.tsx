import React, { useState, useEffect } from 'react';
import './App.css';
import userPhoto from './assets/download.jpg';

function BuddyPage() {
  const [messages, setMessages] = useState([
    { text: "Hi! I'm your Submerge buddy. How are you feeling today?", isBot: true }
  ]);
  const [inputText, setInputText] = useState('');

  const handleSendMessage = (e: React.FormEvent) => {
    e.preventDefault();
    if (!inputText.trim()) return;

    // Add user message
    setMessages(prev => [...prev, { text: inputText, isBot: false }]);

    // Simulate bot response (replace with actual chatbot logic later)
    setTimeout(() => {
      setMessages(prev => [...prev, { 
        text: "Thanks for sharing! I'm here to chat and help you navigate your journey.", 
        isBot: true 
      }]);
    }, 1000);

    setInputText('');
  };

  return (
    <div className="buddy-page">
      <div className="chat-container">
        <div className="messages-container">
          {messages.map((message, index) => (
            <div 
              key={index} 
              className={`message ${message.isBot ? 'bot-message' : 'user-message'}`}
            >
              {message.isBot && (
                <div className="bot-avatar">🧊</div>
              )}
              <div className="message-bubble">
                {message.text}
              </div>
            </div>
          ))}
        </div>
        <form onSubmit={handleSendMessage} className="message-input-container">
          <input
            type="text"
            value={inputText}
            onChange={(e) => setInputText(e.target.value)}
            placeholder="Type your message..."
            className="message-input"
          />
          <button type="submit" className="send-button">
            Send
          </button>
        </form>
      </div>
    </div>
  );
}

function ProfilePage() {
  return (
    <div className="profile-page">
      <div className="profile-header">
        <div className="profile-picture-container">
          <img 
            src={userPhoto}
            alt="Profile" 
            className="profile-picture"
          />
          <button className="edit-button">✏️</button>
        </div>
        <h1 className="name">Sarah Williams</h1>
        <p className="location">📍 New York City</p>
      </div>

      <div className="profile-section">
        <h2 className="section-title">About Me</h2>
        <p className="bio-section">
          Passionate artist and coffee enthusiast. Love exploring new places and capturing moments through my lens. Looking for someone to share adventures with! 🎨 ✈️ 📸
        </p>
      </div>

      <div className="profile-section">
        <h2 className="section-title">Interests</h2>
        <div className="tags-container">
          <span className="tag">Artist</span>
          <span className="tag">Travel</span>
          <span className="tag">Coffee</span>
          <span className="tag">Photography</span>
          <span className="tag">Music</span>
        </div>
      </div>

      <button className="edit-profile-button">
        Edit Profile
      </button>
    </div>
  );
}

function SettingsPage() {
  const [notifications, setNotifications] = useState(true);
  const [darkMode, setDarkMode] = useState(false);
  const [distance, setDistance] = useState(10);
  const [language, setLanguage] = useState('english');

  return (
    <div className="settings-page">
      <div className="settings-section">
        <h2 className="section-title">Account Settings</h2>
        <div className="setting-item">
          <div className="setting-label">Email</div>
          <button className="setting-button">Change Email</button>
        </div>
        <div className="setting-item">
          <div className="setting-label">Password</div>
          <button className="setting-button">Change Password</button>
        </div>
      </div>

      <div className="settings-section">
        <h2 className="section-title">Preferences</h2>
        <div className="setting-item">
          <div className="setting-label">Notifications</div>
          <label className="toggle">
            <input
              type="checkbox"
              checked={notifications}
              onChange={() => setNotifications(!notifications)}
            />
            <span className="toggle-slider"></span>
          </label>
        </div>
        <div className="setting-item">
          <div className="setting-label">Dark Mode</div>
          <label className="toggle">
            <input
              type="checkbox"
              checked={darkMode}
              onChange={() => setDarkMode(!darkMode)}
            />
            <span className="toggle-slider"></span>
          </label>
        </div>
        <div className="setting-item">
          <div className="setting-label">Maximum Distance</div>
          <div className="range-container">
            <input
              type="range"
              min="1"
              max="100"
              value={distance}
              onChange={(e) => setDistance(Number(e.target.value))}
              className="range-slider"
            />
            <span className="range-value">{distance} mi</span>
          </div>
        </div>
        <div className="setting-item">
          <div className="setting-label">Language</div>
          <select 
            value={language} 
            onChange={(e) => setLanguage(e.target.value)}
            className="select-input"
          >
            <option value="english">English</option>
            <option value="spanish">Spanish</option>
            <option value="french">French</option>
            <option value="german">German</option>
          </select>
        </div>
      </div>

      <div className="settings-section">
        <h2 className="section-title">Privacy</h2>
        <div className="setting-item">
          <div className="setting-label">Profile Visibility</div>
          <select className="select-input">
            <option value="everyone">Everyone</option>
            <option value="matches">Matches Only</option>
            <option value="nobody">Nobody</option>
          </select>
        </div>
      </div>

      <div className="settings-section">
        <h2 className="section-title">Support</h2>
        <button className="support-button">Contact Support</button>
        <button className="support-button">FAQ</button>
        <button className="support-button danger">Delete Account</button>
      </div>
    </div>
  );
}

function App() {
  const [isMenuOpen, setIsMenuOpen] = useState(false);
  const [currentPage, setCurrentPage] = useState('home');
  const [isPulsing, setIsPulsing] = useState(false);

  const toggleMenu = () => {
    setIsMenuOpen(!isMenuOpen);
    pulseBackground();
  };

  const pulseBackground = () => {
    setIsPulsing(true);
    setTimeout(() => setIsPulsing(false), 1000);
  };

  const navigateTo = (page: string) => {
    pulseBackground();
    setCurrentPage(page);
    setIsMenuOpen(false);
  };

  const handleClickOutside = (e: React.MouseEvent) => {
    if (isMenuOpen) {
      const target = e.target as HTMLElement;
      if (!target.closest('.menu-button')) {
        setIsMenuOpen(false);
      }
    }
  };

  return (
    <div onClick={handleClickOutside} className={isPulsing ? 'gradient-pulse' : ''}>
      <header className="header">
        <div className="header-content">
          <div style={{ position: 'relative' }}>
            <button className="menu-button" onClick={toggleMenu}>
              Menu
            </button>
            {isMenuOpen && (
              <div className="menu-dropdown">
                <div className="menu-item" onClick={() => navigateTo('home')}>
                  <span>🏠</span>
                  <span>Home</span>
                </div>
                <div className="menu-item" onClick={() => navigateTo('buddy')}>
                  <span>👥</span>
                  <span>Buddy</span>
                </div>
                <div className="menu-item" onClick={() => navigateTo('profile')}>
                  <span>👤</span>
                  <span>Profile</span>
                </div>
                <div className="menu-item" onClick={() => navigateTo('settings')}>
                  <span>⚙️</span>
                  <span>Settings</span>
                </div>
              </div>
            )}
          </div>
          <span 
            className="app-title" 
            onClick={() => navigateTo('home')} 
            style={{ cursor: 'pointer' }}
          >
            🧊
          </span>
          <button 
            className="profile-button" 
            onClick={() => navigateTo('profile')}
          >
            Profile
          </button>
        </div>
      </header>

      {currentPage === 'home' ? (
        <div className="app-container">
          <div className="info-module">
            <img 
              src={userPhoto}
              alt="Profile" 
              className="profile-image"
            />
            <div className="name-location">
              <span className="name">Sarah, 25</span>
              <span className="distance-badge">3 mi away</span>
            </div>
            <div className="location">
              📍 New York City
            </div>
          </div>

          <div className="info-module">
            <h3>Interests</h3>
            <div className="tags-container">
              <span className="tag">Artist</span>
              <span className="tag">Travel</span>
              <span className="tag">Coffee</span>
              <span className="tag">Photography</span>
              <span className="tag">Music</span>
            </div>
          </div>

          <div className="info-module">
            <h3>About</h3>
            <div className="bio-section">
              Passionate artist and coffee enthusiast. Love exploring new places and capturing moments through my lens. Looking for someone to share adventures with! 🎨 ✈️ 📸
            </div>
          </div>

          <div className="action-buttons">
            <button className="action-button">✕ Pass</button>
            <button className="action-button">♥ Like</button>
          </div>
        </div>
      ) : currentPage === 'profile' ? (
        <ProfilePage />
      ) : currentPage === 'buddy' ? (
        <BuddyPage />
      ) : currentPage === 'settings' ? (
        <SettingsPage />
      ) : (
        <div className="app-container">
          <div className="info-module">
            <h2>Coming Soon!</h2>
            <p>This feature is under development.</p>
          </div>
        </div>
      )}
    </div>
  );
}

export default App;
