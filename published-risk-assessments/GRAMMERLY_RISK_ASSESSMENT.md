# Browser Extension Risk Assessment: Grammarly: AI Writing Assistant and Grammar Checker App
> **Generated on:** Fri Feb  6 14:07:20 2026
> **Owner/Developer:** Grammarly
> **User Count:** 43,000,000 users
> **Extension Last Updated:** Last Updated: February 5, 2026

## Disclaimer
- **Statement:** `This assessment analyzes permissions and configuration to identify potential security and privacy risks based on capability alone. It does not assert malicious intent or confirmed exploitation.`

## Overview
-`Grammarly for Chrome is your always-on AI partner for clearer, more compelling communication. From brainstorming ideas to final edits, Grammarly’s advanced AI helps you write faster and with more confidence. It works across everything you write, whether it’s an email, a school paper, or a business proposal.Grammarly integrates directly into your browser, offering real-time suggestions as you type in Gmail, Google Docs, LinkedIn, and across 500,000+ other sites.`

## Permission Analysis
| Type | Permission | Risk | Details & Notes |
| :--- | :--- | :---: | :--- |
| Permission | `scripting` | **HIGH** | DOM/JS injection → credential scraping, actions |
| Permission | `sidePanel` | **MED** | Persistent window into browsing, could be used for tracking. |
| Permission | `tabs` | **MED** | URLs and titles only; less sensitive than full host access |
| Permission | `notifications` | **LOW** | Minimal security impact |
| Permission | `cookies` | **HIGH** | Session hijacking, tracking |
| Permission | `identity` | **HIGH** | OAuth tokens / account identity exposure |
| Permission | `storage` | **LOW** | Local extension storage; minimal risk |
| Host | `http://*/*` | **CRITICAL** |  Equivalent to <all_urls>; global host access  |
| Host | `https://*/*` | **CRITICAL** |  Equivalent to <all_urls>; global host access |
| Optional | `nativeMessaging` | **CRITICAL** | Bridge to local OS programs; high escalation potential |
| Optional | `clipboardRead` | **HIGH** | Can read sensitive clipboard data |

### Background Configuration
- **Service Worker:** `sw.js`

## Potential Endpoint Communications
```text
http://localhost
https://127.0.0.1
https://accounts.google.com
https://addons.mozilla.org/en-US/firefox/addon/grammarly-1/privacy/
https://api.iterable.com
https://appleid.apple.com/auth
https://assets.extension.grammarly.com/
https://assets.grammarly.com/icons/v1/ai-studio-icon-lg.svg
https://auth.grammarly.com/auth/v4/api/userinfo
https://auth.grammarly.com/tokens/v4/api/oauth2/authorize
https://auth.grammarly.com/tokens/v4/api/oauth2/exchange
https://auth.grammarly.com/tokens/v4/api/oauth2/token
https://auth.grammarly.com/tokens/v4/api/revoke-by-refresh-token
https://authorship.grammarly.com/reports/
https://auth.ppgr.io/auth/v4/api/userinfo
https://auth.ppgr.io/tokens/v4/api/oauth2/authorize
https://auth.ppgr.io/tokens/v4/api/oauth2/exchange
https://auth.ppgr.io/tokens/v4/api/oauth2/token
https://auth.ppgr.io/tokens/v4/api/revoke-by-refresh-token
https://auth.qagr.io/auth/v4/api/userinfo
https://auth.qagr.io/tokens/v4/api/oauth2/authorize
https://auth.qagr.io/tokens/v4/api/oauth2/exchange
https://auth.qagr.io/tokens/v4/api/oauth2/token
https://auth.qagr.io/tokens/v4/api/revoke-by-refresh-token
https://coda.grammarly.com
https://coda.grammarly.com/apis/v1
https://codahosted.io/packs/1003/unversioned/assets/EXAMPLE/d84eea83a4969de601c3cb20e6448c828bd54631b1cd11a9bd0dcf8f02e8f2b687ecaa381c7467285519c3edddc1bfc2e645e00d33eeb419854f856547029b61cd01d871b0b634305e30e640ab233e14726beec1aa26fde1fcb73fdfd9b4488f08305da4
https://codahosted.io/packs/1003/unversioned/assets/LOGO/af822f02808fc0f3440b8ac2a2b9735829dd8ffd24bae1cef7c3fb0afecd22a944202ab9288d94678e053df4c007aa4f3bc8b4860877ddab79fe248b4cfe0a5b1e4ab62dc7cf12967b6b60ee69541951b61b9381271f3c3736dc13c5822cfc8281d229af
https://codahosted.io/packs/1010/unversioned/assets/LOGO/f31b161b2a200180175ef564231c04c35f85f28c30fe2f08dca5adee2181f55c64e31fa5d839f5d6ab29543a2146fcd8d76401c442dcb231cbbc42442ccfd7f962ec8a60917ece91fe90f774294f79d9c423c4fbc8ab60721ae427ff5bccab15939c2777
https://codahosted.io/packs/1013/unversioned/assets/LOGO/c096a0cf4a2b4428c7f0129e783f2272c30ff12ae3800cccdc6401072aa0b62b92f321ce83a1a40ec0dd54dd89156f487f21f275bab69cc27d3a5a7135a4703574082b7df6469a3ae95c128049676ce2353f3cd8fd3dbf3b0b6e699172a7b12c6f558c74
https://codahosted.io/packs/1018/unversioned/assets/LOGO/d1fc08ea8e362430fafbc44461a525d9a2a1ee93463dfe25442a6d04f39386402f8fbc09ab1cc6447cd5f9fad449adce42923f6110e7c94021f4afe08858378b3cb0d61c5693fe9f4109e8b331b69a12b857ba44d4fc363ec27f3230d2c4511e9346f03d
https://codahosted.io/packs/1052/unversioned/assets/LOGO/b1b1ba834f26e6e1269d17cb503f657979abadd9377e022efb95508266bac9627aa8ae3ffd9221ba03fab3f367938a75d1e281393667ac1b97bda4fd99dd8c3b296c429a356c843a1c06d832dbe5e31c5bd6ded5acd4decd8fb1273a3d0bd200d5bab51d
https://codahosted.io/packs/1063/unversioned/assets/LOGO/5fbff85c069f05a25fbd192cb4ef64daaaaa14a2459357f5c2a5ff166f6aaddaaebc2bcafdad1fc49c065ff000f01cbed4b0e87f77aa15d403f6f6ca03e9e946421c6ed7f0a1da12616e4ccdc321dee92484078a15e1da66e8dea052f657f8b2faf3d218
https://codahosted.io/packs/31459/unversioned/assets/LOGO/9940314f2c7e2194b8088615a083eaa127c6c8e574024a4f7b318ffe3dc7eb7d21934ab8dafd02042b6bc256101a30b6911bfa2c38e9318942d110df2375ce1af0023ea45a7eab468d4decd0defe6cb8b9411c2d95f21e5f7579e69f22a49b4c7ef5cd27
https://codahosted.io/packs/33623/unversioned/assets/LOGO/6f13a625d61b79e79dd04dfb6bdcf1e3956c0dcd02face790ede7e21b79c2c435020e3039dc24cffd73c1bdfd11ac6f9ffa9d4f068a93a03c901bd346b00d7247cd20bda34bee90d4c57283e9f9422a2f237dfb0af5e01531f8a8742cd8777ab54bc07dc
https://codahosted.io/packs/33739/unversioned/assets/LOGO/098ae4e4dd1fde3a1772737b39b9df86a6e34416b054bbcee6a9d4681d19a5c9ead852ac707659ea13daa1032d802da28df57ad59803c4d5d4366c436a59bf83d9d51f679c979eff7d4e80f6cf3443c5db24a4aa9eaa9155f5deec0ae7ad9f96c6670537
https://coda.io
https://coda.io/favicon.ico
https://coda-local.ppgr.io
https://coda.ppgr.io
https://coda.qagr.io
https://config.extension.grammarly.com/browserplugin/config.json
https://config.extension.grammarly.com/dynamicConfig.json
https://dev.coda.io
https://docs.google.com/document
https://doi.org/
https://example.com/icon.svg
https://example.com/metadata/googlecalendar
https://example.com/metadata/slack
https://extension.femetrics.grammarly.io/batch/import
https://femetrics.ppgr.io/batch/import
https://femetrics.qagr.io/batch/import
https://f-log-extension.grammarly.io
https://f-log-inkwell.grammarly.io/batch/log
https://gateway.grammarly.com
https://gateway.grammarly.com/authorship/v1/
https://gateway.ppgr.io
https://gateway.qagr.io
https://github.com/uuidjs/uuid
https://github.com/zloirock/core-js
https://github.com/zloirock/core-js/blob/v3.38.0/LICENSE
https://github.com/zloirock/core-js/blob/v3.45.1/LICENSE
https://head.coda.io
https://in-product.report.grammarly.io/v1/report
https://rwsgfy.grammarly.com/stand-with-ukraine
https://staging.coda.io
https://www.example.com/privacy
https://www.example.com/tos
https://www.facebook.com/login
https://www.grammarly.com/plans
https://www.grammarly.com/safariWebExt/auth/callback
http://www.w3.org/1998/Math/MathML
http://www.w3.org/1999/xhtml
http://www.w3.org/2000/svg

__

Source: Status URL extraction from Analysis artifacts.
Note: Presence in this list does not imply active runtime communication.
