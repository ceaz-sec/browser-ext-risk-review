# Browser Extension Risk Assessment: Affirm: Buy Now, Pay Later
> **Generated on:** Fri Feb  6 13:06 2026
> **Owner/Developer:** Affirm
> **User Count:** 400,000 users
> **Extension Last Updated:** Last Updated: February 6, 2026

## Disclaimer
- **Statement:** `This assessment analyzes permissions and configuration to identify potential security and privacy risks based on capability alone. It does not assert malicious intent or confirmed exploitation.`

## Overview
- `Shop millions of stores and pay with Affirm, right from your browser. This extension does use PII, CHD and SAD. Affirm does have a privacy policy that governs the handling of this data. Primary Control complicance is PCI DSS.`

## Permission Analysis
| Type | Permission | Risk | Details & Notes |
| :--- | :--- | :---: | :--- |
| Permission | `storage` | **LOW** | Local extension storage; minimal risk |
| Permission | `activeTab` | **LOW** | Temporary access; user-initiated |
| Permission | `cookies` | **HIGH** | Session hijacking, tracking |
| Permission | `webNavigation` | **UNKNOWN** | Permission not found in reference |
| Permission | `declarativeNetRequest` | **MED** | Rule-based blocking; limited inspection capability |
| Permission | `alarms` | **LOW** | Scheduling; low risk |
| Permission | `tabs` | **MED** | URLs and titles only; less sensitive than full host access |
| Permission | `offscreen` | **HIGH** | Allows hidden background execution, enabling stealthy activity without user awareness |
| Permission | `scripting` | **HIGH** | DOM/JS injection → credential scraping, actions |
| Host | `*://*.affirm.com/` | **UNKNOWN** | Permission not found in reference |
| Host | `<all_urls>` | **CRITICAL** | Full read/write access to all websites; credential theft, injection, scraping |

### Background Configuration
- **Service Worker:** `background.js`

## Potential Endpoint Communications
```text
https://affirm.com/api
https://affirm-stage.com/api
https://be228ae3f1d08c9baae06143b8e2e7e4
https://browser-extension.affirm.com/
https://www.affirm.com
https://www.affirm.com/api/chrono/v3/collect
https://www.affirm.com/api/superapp/killswitch/check_status
https://www.affirm.com/browser-extension
https://www.affirm.com/browser-extension/install
https://www.affirm.com/products/checkout
https://www.affirm.com/shopping/browser-extension/new
https://www.affirm.com/u/browser-extension/shops/
https://www.affirm-stage.com
https://www.affirm-stage.com/api/chrono/v3/collect
https://www.affirm-stage.com/api/superapp/killswitch/check_status
http://www.example.com

--
Source: Status URL extraction from Analysis artifacts.
Note: Presence in this list does not imply active runtime communication.
