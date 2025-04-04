# AI Project Idea Generator 💡

A real-time AI-powered project idea generator built with Phoenix LiveView and Elixir. Get instant creative suggestions for your next tech project!

## ✨ Features

- **AI-Powered Ideas**  
  Generates unique project concepts using DeepSeek/OpenRouter APIs
- **Cyberpunk UI**  
  Futuristic design with animated gradients and neon effects
- **Real-Time Updates**  
  Phoenix LiveView for instant responses without JavaScript
- **Multi-API Support**  
  Switch between AI providers (DeepSeek, OpenRouter, etc.)
- **SEO Optimized**  
  Dynamic meta tags and schema.org structured data
- **Responsive Design**  
  Works flawlessly on mobile and desktop

## 🛠 Tech Stack

| Component       | Technology |
|-----------------|------------|
| Backend         | Elixir + Phoenix |
| Frontend        | LiveView + Tailwind CSS |
| AI Integration  | DeepSeek/OpenRouter APIs |
| Deployment      | Render |
| Monitoring      | Sentry/Logger |

## 🚀 Quick Start

### Prerequisites
- Elixir 1.14+
- Phoenix 1.7+
- Node.js 18+

### Installation
1. Clone the repository, then:
```bash
cd AI_Wisdom
mix deps.get
mix assets.deploy
```

### Configuration
Create `.env` file:
```bash
cp .env.example .env
# Add your API keys:
# DEEPSEEK_API_KEY=your_key_here
```

### Running
```bash
mix phx.server
```
Visit `http://localhost:4000`


## 🔧 Project Structure
```
lib/
├── ai_wisdom/           # Core business logic
├── ai_wisdom_web/       # Web layer (controllers, views)
priv/
├── static/              # Favicons, images
assets/                  # Tailwind/JS config
```

## 🤝 Contributing
1. Fork the project
2. Create your feature branch (`git checkout -b feature/amazing-idea`)
3. Commit changes (`git commit -m 'Add some amazing idea'`)
4. Push to branch (`git push origin feature/amazing-idea`)
5. Open a Pull Request

## 📄 License
MIT - See [LICENSE](LICENSE) for details.