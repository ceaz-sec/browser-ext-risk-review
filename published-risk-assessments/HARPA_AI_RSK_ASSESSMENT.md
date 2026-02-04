# Browser Extension Risk Assessment: Harpa AI
> **Generated on:** Mon Feb  2 16:51:44 2026
> **Extension Last Updated:** Last Updated: January 27, 2026

## Permission Analysis
| Type | Permission | Risk | Details & Notes |
| :--- | :--- | :---: | :--- |
| Permission | `alarms` | **LOW** | Scheduling; low risk |
| Permission | `background` | **MED** | Persistent execution; amplifies other risks |
| Permission | `browsingData` | **LOW** | Permission not found in reference |
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
