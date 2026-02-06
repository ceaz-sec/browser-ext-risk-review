# Browser Extension Risk Assessment: Capital One Shopping: Save Now
> **Generated on:** Fri Feb  6 12:06PM
> **Owner/Developer:** Capital One
> **User Count:** 400,000 users
> **Extension Last Updated:** Last Updated: February 6, 2026

## Disclaimer
- **Statement:** `This assessment analyzes permissions and configuration to identify potential security and privacy risks based on capability alone. It does not assert malicious intent or confirmed exploitation.`

- **Overview:** `A simple and free way to help you save online
Available codes are instantly applied to a users cart during checkout.

Capital One scoures the web to search for better deals from online stores like Amazon, Target, Nike and over 100,000 others. Capital One does the shopping for its users.`



## Permission Analysis
| Type | Permission | Risk | Details & Notes |
| :--- | :--- | :---: | :--- |
| Permission | `alarms` | **LOW** | Scheduling; low risk |
| Permission | `tabs` | **MED** | URLs and titles only; less sensitive than full host access |
| Permission | `contextMenus` | **LOW** | UI only |
| Permission | `storage` | **LOW** | Local extension storage; minimal risk |
| Permission | `cookies` | **HIGH** | Session hijacking, tracking |
| Permission | `webRequest` | **HIGH** | Can observe/modify network requests |
| Permission | `scripting` | **HIGH** | DOM/JS injection → credential scraping, actions |
| Permission | `offscreen` | **HIGH** | Allows hidden background execution, enabling stealthy activity without user awareness |
| Host | `*://*/*` | **CRITICAL** | Equivalent to <all_urls>; global host access |

### Background Configuration
- **Service Worker:** `bg.js`

## Potential Endpoint Communications
```text
http://custom.transaction
http://feedback.ebay.com/ws/eBayISAPI.dll
http://iv-labs.service.dev.iv
http://my.ebay.com/ws/eBayISAPI.dll?MyEbay&gbh=1
https://capitalone.com
https://capitaloneshopping.com
https://ct.pinterest.com/v3/?tid=2618775727002&event=
https://github.com/facebook/regenerator/blob/main/LICENSE
https://github.com/newrelic/newrelic-browser-agent/blob/main/docs/warning-codes.md
https://ivf-stage.com
https://libertymutualinsurance
https://partner-api.groupon.com/deals.json?tsToken=US_AFF_0_206976_212556_0&lat=
https://www.amazon.com/dp/B00DBYBNEE
https://www.amazon.com/gp/cart/view.html
https://www.amazon.com/gp/history/ref=nav_timeline_view_history
https://www.amazon.com/returns/cart/
https://www.npmjs.com/package/buffer
http://www.amazon.com/dp/
http://www.apache.org/licenses/LICENSE-2.0
http://www.ebay.com/itm/
http://www.ebay.com/myb/PurchaseHistoryOrdersContainer?ipp=25&Period=1&Filter=1
http://www.ebay.com/myb/PurchaseHistoryReturnsContainer?ipp=25&Period=1&Filter=1
http://www.ebay.com/sch/

--
Source: Status URL extraction from Analysis artifacts.
Note: Presence in this list does not imply active runtime communication.
