# Browser Extension Risk Review

**A CLI tool to assess the security risk of Chrome browser extensions**

This project analyzes Chrome extension manifests and permissions and gives a risk profile based on known dangerous behaviors and over-permissioning. It helps security professionals, blue teams, researchers, and enthusiasts quickly understand potential risks of an extension before trusting it.  

> ⚠️ Browser extensions are a significant attack surface — they can access webpage data, intercept requests, and run with elevated privileges, so careful review is key. :contentReference[oaicite:0]{index=0}

---

## 🚀 Features

- 📦 Analyze a Chrome extension `.crx` or unpacked extension
- 📊 Score and report risk based on permissions and manifest contents
- 📜 Built-in permission risk reference
- 🛠️ Extensible scripts for deeper assessments
- 🧠 Ideal for automation or integration with larger security workflows

---

## 🛠️ Installation

1. **Clone the repo**

   ```bash
   git clone https://github.com/ceaz-sec/browser-ext-risk-review.git
   cd browser-ext-risk-review

2. **Setup a Python Environment**
   ```python3 -m venv .venv
   source .venv/bin/activate #macOS/Linux
   .venv\Scripts\activate #Windows OS

3. **Install Dependencies**
   ```pip install -r requirements.txt

## 💡Usage
- python crx_browser_risk_review.py

## Risk References
- https://cheatsheetseries.owasp.org/cheatsheets/Browser_Extension_Vulnerabilities_Cheat_Sheet.html
- https://developer.chrome.com/docs/extensions/reference/api
