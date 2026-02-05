# Browser Extension Risk Assessment: Harpa AI
> **Generated on:** Mon Feb  2 16:51:44 2026
> **Owner/Developer:** Yaroslav Danilov 
> **Extension Last Updated:** Last Updated: February 4, 2026

## Disclaimer
- **Statement:** `This assessment analyzes permissions and configuration to identify potential security and privacy risks based on capability alone. It does not assert malicious intent or confirmed exploitation.`

### Overview
`Bring all AI models into one sidebar. Make AI aware of the web page you're on. Automate search, summarize videos & PDFs, monitor prices, and extract data. Trusted by over 400.000 users and companies.`

## Permission Analysis
| Type | Permission | Risk | Details & Notes |
| :--- | :--- | :---: | :--- |
| Permission | `alarms` | **LOW** | Scheduling; low risk |
| Permission | `background` | **MED** | Persistent execution; amplifies other risks |
| Permission | `browsingData` | **HIGH** | It allows extensions to delete browsing history, cookies and ceched data across all websites |
| Permission | `cookies` | **HIGH** | Session hijacking, tracking |
| Permission | `declarativeNetRequest` | **MED** | Rule-based blocking; limited inspection capability |
| Permission | `notifications` | **LOW** | Minimal security impact |
| Permission | `tabs` | **MED** | URLs and titles only; less sensitive than full host access |
| Permission | `storage` | **LOW** | Local extension storage; minimal risk |
| Permission | `offscreen` | **HIGH** | Allows hidden background execution, enabling stealthy activity without user awareness |
| Permission | `scripting` | **HIGH** | DOM/JS injection → credential scraping, actions |
| Permission | `contextMenus` | **LOW** | UI only |
| Permission | `sidePanel` | **MED** | Persistent window into browsing, could be used for tracking. Could be used to steal data like AI data stealing malware. |
| Host | `*://*/*` | **CRITICAL** | Equivalent to <all_urls>; global host access |
| Optional | `downloads` | **MED** | File manipulation |

### Background Configuration
- **Service Worker:** `/bg.js`

### Potential URL Communications
```text
http://localhost
http://quickchart.io.
https://accounts.google.com/
https://a.co/d/hwfEQjP
https://api.anthropic.com
https://api.harpa.ai/api/v1
https://api.mixpanel.com/track?ip=1
https://api.openai.com
https://app.harpa.ai
https://app.harpa.ai/
https://app.harpa.ai/?t=
https://chatgpt.com
https://chatgpt.com/
https://chatgpt.com/backend-api/conversation
https://chatgpt.com/backend-api/sentinel/arkose/dx
https://chatgpt.com/backend-api/sentinel/chat-requirements
https://chatgpt.com/c/
https://chatgpt.com/?model=gpt-4
https://chromewebstore.google.com/detail/harpa-ai-automation-agent/eanggfilgoajaocelnaflolkadkeghjp/reviews
https://claude.ai
https://claude.ai/
https://claude.ai/api/organizations
https://cn.bing.com/search
https://discord.com/invite/BsbjAXpqgC
https://discord.gg/B9Evx82m4K
https://duckduckgo.com/
https://finance.yahoo.com/lookup?s=
https://gemini.google.com
https://github.com/nodeca/pako/blob/main/LICENSE
https://gun.harpa.ai
https://harpa.ai
https://harpa.ai/
https://harpa.ai/account/
https://harpa.ai/app
https://harpa.ai/automation
https://harpa.ai/backup
https://harpa.ai/blank
https://harpa.ai/guides
https://harpa.ai/guides/ai-answers-alongside-google-search
https://harpa.ai/guides/billing-issues
https://harpa.ai/guides/chatgpt-web-session
https://harpa.ai/guides/cloud-gpt-connection
https://harpa.ai/guides/custom-page-aware-chatgpt-commands
https://harpa.ai/guides/editing-pre-defined-commands
https://harpa.ai/guides/finish-writing-from-your-draft-with-ai
https://harpa.ai/guides/getting-started
https://harpa.ai/guides/harpa-is-not-working
https://harpa.ai/guides/helpful-bug-reports
https://harpa.ai/guides/how-to-get-an-openai-api-key
https://harpa.ai/guides/monitor-price-drops
https://harpa.ai/guides/page-aware-chatgpt-prompts
https://harpa.ai/guides/quick-access-bar
https://harpa.ai/guides/schedule-ai-commands
https://harpa.ai/guides/summarize-pages-and-youtube-videos-to-text
https://harpa.ai/guides/team-spaces
https://harpa.ai/guides/write-text-on-websites-with-ai
https://harpa.ai/guides/writing-styles
https://harpa.ai/guide/writing-styles
https://harpa.ai/img/tarot/
https://harpa.ai/img/updates/video-guide-7.0.png
https://harpa.ai/img/updates/video-guide-7.1.png
https://harpa.ai/img/updates/video-guide-7.2.png?x=10
https://harpa.ai/img/updates/video-guide-7.3.png
https://harpa.ai/img/updates/video-guide-8.1.png?x=1
https://harpa.ai/img/updates/video-guide-8.3.png?x=1
https://harpa.ai/img/updates/video-guide-8.5.png
https://harpa.ai/img/updates/video-guide-8.8.png
https://harpa.ai/img/updates/video-guide-8.9.png
https://harpa.ai/img/updates/video-guide-8.png?x=1
https://harpa.ai/img/updates/video-guide-9.5.png
https://harpa.ai/oi
https://harpa.ai/pricing
https://harpa.ai/welcome
https://hook.eu1.make.com/...
https://img.youtube.com/vi/
https://kagi.com/search
https://mail.google.com/
https://mail.google.com/mail/u/0/
https://openrouter.ai/
https://openrouter.ai/api
https://quickchart.io/chart?bkg=white&c=
https://quickchart.io/chart?c=
https://raw.github.com/Stuk/jszip/main/LICENSE.markdown.
https://search.brave.com/search
https://search.naver.com/search
https://stuk.github.io/jszip/documentation/howto/read_zip.html
https://tcr9i.chat.openai.com
https://tcr9i.chat.openai.com/
http://stuartk.com/jszip
https://webhook.site/...
https://whatismyipaddress.com/
https://www.baidu.com/
https://www.bing.com/search
https://www.ebay.com/itm/235451538845
https://www.ecosia.org/search
https://www.google.com/
https://www.google.com/search?q=
https://www.make.com/en/hq/app-invitation/c98499c16cfa22f1051f64346ef91aaa
https://www.youtube.com
https://www.youtube.com/
https://www.youtube.com/watch
https://www.youtube.com/watch?
https://www.youtube.com/watch?v=
https://www.youtube.com/watch?v=0GvHvf6Pzlc
https://www.youtube.com/watch?v=2uJT9AsmI0w
https://www.youtube.com/watch?v=3Qg1IgWnXFs
https://www.youtube.com/watch?v=6x2GUlfEbNM
https://www.youtube.com/watch?v=dzdvyeyxDUA
https://www.youtube.com/watch?v=fBms-vN38rk
https://www.youtube.com/watch?v=jPFkLep9LlM
https://www.youtube.com/watch?v=K4fWgell0Bk
https://www.youtube.com/watch?v=oqAQOjoWkuQ
https://www.youtube.com/watch?v=OVNSvvQ5x0U
https://www.youtube.com/watch?v=pB6RpKGyczg
https://www.youtube.com/watch?v=zIhGLt7MxlU
https://youtube.com/
https://youtube.com/Mde2q7GFCrw?t=949s
https://youtube.com/watch?v=

---
Source: Static URL extraction from analysis artifacts.  
Note: Presence in this list does not imply active runtime communication.

