# Browser Extension Risk Assessment: Any Doc
> **Generated on:** Sat Feb  7 18:55:04 2026
> **Extension Last Updated:** Last Updated: February 6, 2026

## Permission Analysis
| Type | Permission | Risk | Details & Notes |
| :--- | :--- | :---: | :--- |
| Permission | `contextMenus` | **LOW** | UI only |
| Permission | `storage` | **LOW** | Local extension storage; minimal risk |
| Permission | `unlimitedStorage` | **MED** | Potential for data hoarding |
| Permission | `clipboardWrite` | **MED** | Can overwrite clipboard; phishing vector possible |
| Permission | `tabs` | **MED** | URLs and titles only; less sensitive than full host access |
| Permission | `scripting` | **HIGH** | DOM/JS injection → credential scraping, actions |
| Permission | `activeTab` | **LOW** | Temporary access; user-initiated |
| Permission | `cookies` | **HIGH** | Session hijacking, tracking |
| Permission | `nativeMessaging` | **CRITICAL** | Bridge to local OS programs; high escalation potential |
| Host | `*://*/*` | **CRITICAL** | Equivalent to <all_urls>; global host access |

### Background Configuration
- **Service Worker:** `service-worker-loader.js`

## Potential Endpoint Communication
```text
https://clients2.google.com/service/update2/crx
https://account.wps.com
https://account.wps.com/translateLogin
https://ai.wps.com
https://api
https://api.wps.com/ktranslator
https://api.wps.com/utils/geo/me?_t=
https://dcapi
https://dcapi.wps.com/kstorage-api
https://ovs-shopwindow-server.wps.com
https://params.wps.com
https://permits.wps.com
https://vuejs.org/error-reference/
https://www.google-analytics.com/mp/collect
http://www.w3.org/2000/svg
https://api-edge.cognitive.microsofttranslator.com/translate?from=
https://checkout.wps.com
https://chrome.google.com/webstore/detail/aopddeflghjljihihabdclejbojaomaf/reviews
https://edge.microsoft.com/translate/auth
https://feross.org/opensource
https://form.typeform.com/to/htX09piP
https://microsoftedge.microsoft.com/addons/detail/pajdgpfjcgcdfkccnbinpalbihedpkfm
https://mths.be/he
https://translate-pa.googleapis.com/v1/translateHtml
https://translate.yandex.net/api/v1/tr.json/translate?
https://translate.yandex.net/website-widget/v1/widget.js?widgetId=ytWidget&pageLang=es&widgetTheme=light&autoMode=false
https://www.youtube.com/youtubei/v1/player
http://www.w3.org/1999/xhtml
http://www.w3.org/2000/svg
http://localhost
https://ovs-shopwindow-server-sg-test.wps.com
https://ovs-shopwindow-server.wps.com
https://www.wps.com/
https://api-edge.cognitive.microsofttranslator.com/translate?from=
https://edge.microsoft.com/translate/auth
https://translate.googleapis.com/translate_a/single?
https://translate-pa.googleapis.com/v1/translateHtml
https://translate.yandex.net/api/v1/tr.json/translate?
https://translate.yandex.net/website-widget/v1/widget.js?widgetId=ytWidget&pageLang=es&widgetTheme=light&autoMode=false
https://transmart.qq.com/api/imt

--
Source: Status URL extraction from Analysis artifacts.
Note: Presence in this list does not imply active runtime communication.
