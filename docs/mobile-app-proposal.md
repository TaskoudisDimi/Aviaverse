# Mobile App — Draft Proposal

*2026-11-19*

Short answer: you're most of the way there already. The app is built as a
PWA, so it installs on a phone today with zero extra work. A real app-store
listing on top of that is a few days of wrapping, not a rewrite — unless we
want deep native features, which this course app probably doesn't need.

## The quick answer

VJet-Academy is already built as a PWA (Progressive Web App) — this was set
up from the start using the VitePWA plugin. That means:

- A student can open vjet-academy.academy on their phone and tap "Add to
  Home Screen" (Android/Chrome) or "Add to Home Screen" from the Share menu
  (iOS/Safari).
- It then behaves like a real app: its own icon, full-screen (no browser
  bar), works offline for pages already visited, loads fast on repeat
  visits.
- This already works today. No store listing, no review process, no extra
  cost.

What it does **not** give you: a listing in the App Store / Google Play,
push notifications on iOS (Android PWA push works), or the "legitimacy"
signal some users associate with a store download.

## Three paths, compared

| Path | What it is | Code reuse | Store presence | Rough cost | Rough timeline |
| --- | --- | --- | --- | --- | --- |
| PWA (have it now) | Install from the browser, no store | 100% | None | €0 | Already live |
| **Capacitor wrap (recommended)** | Same Vue app, wrapped in a real iOS/Android app shell | ~95% | Apple App Store + Google Play | ~€99/yr (Apple) + €25 one-time (Google) + dev time | 1–2 weeks |
| Full native rewrite | Separate iOS (Swift) and/or Android (Kotlin) apps built from scratch | ~0% | Apple App Store + Google Play | Dev time only, but far more of it | 2–4 months |

## Recommended: wrap it with Capacitor

[Capacitor](https://capacitorjs.com) is a tool from the Ionic team that
takes an existing web app — exactly what we have — and wraps it in a thin
native shell. The shell is a real iOS/Android app; inside it, the app runs
the same Vue code already built and deployed all session.

Why it fits here:

- **No rewrite.** The entire frontend (Vue components, routing, API calls,
  the AI chat, exam simulator, everything) stays as-is.
- **Native extras are opt-in.** If we want push notifications, camera
  access, biometric login, etc. later, Capacitor has plugins for those —
  added incrementally, not required up front.
- **One codebase, two stores.** We build once, ship to both Apple and
  Google.

The tradeoff: it's not a hand-built native UI, so it won't feel quite as
"native-native" as a from-scratch Swift/Kotlin app. For a course content +
exam app, that difference is minor — most users won't notice.

## What this actually involves

1. **New Capacitor project** — wraps the existing `frontend/` build output.
   Lives alongside the current repo, doesn't touch the web app's code.
2. **App icons & splash screens** — a set of sizes for iOS and Android,
   generated from the existing logo.
3. **Native permission prompts** — only needed for features we actually use
   (e.g. none, if we keep it as just the web content wrapped).
4. **Push notifications (optional)** — would reuse the upgrade-nudge email
   infrastructure's pattern, but needs a native push service (Firebase
   Cloud Messaging for both platforms). Separate small project if wanted.
5. **Code signing** — Apple requires a signing certificate (via the Apple
   Developer account); Google requires signing the Android package.
   One-time setup.
6. **Store listings** — screenshots, description, privacy policy link
   (already have one), age rating questionnaire, submit for review.
7. **App review** — Apple: usually 1–3 days. Google: usually a few hours to
   1 day.

## Cost & timeline estimate

| Item | Cost | Paid by | Frequency |
| --- | --- | --- | --- |
| Apple Developer Program | $99 | Whoever owns the Apple ID used for the listing | Yearly |
| Google Play Developer account | $25 | Same, for the Google account | One-time |
| Dev time (Capacitor wrap, both stores) | — | — | ~1–2 weeks |
| Push notifications (optional add-on) | — | — | Few extra days if wanted |
| App store review | Free | — | 1–3 days (Apple), hours–1 day (Google) |

No new backend cost — it's the same API, same server, same database
already running.

## Open decisions for us to make together

- [ ] Both iOS and Android at once, or start with one (Android is usually
      faster/cheaper to launch first)?
- [ ] Do we want push notifications in v1, or add them later?
- [ ] Who creates and owns the Apple Developer / Google Play accounts —
      you, or the client (Vyron)?
- [ ] Any branding changes for the app icon/splash screen, or reuse what's
      already live?
- [ ] Is this worth doing now, or does it wait until the web app's feature
      set settles down a bit more?
