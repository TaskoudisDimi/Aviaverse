<template>
  <LegalLayout title="Cookie Policy" last-updated="October 26, 2026">
    <p>
      Short version: VJet Academy doesn't use cookies to track you, show you ads, or run analytics.
      Here's exactly what we do use.
    </p>

    <h2>1. How we keep you signed in</h2>
    <p>
      When you log in, we store a session token in your browser's <strong>local storage</strong> —
      not a cookie. It's only sent to our own servers to keep you signed in, and it's removed when
      you log out.
    </p>

    <h2>2. Strictly necessary cookies (from Cloudflare)</h2>
    <p>
      We use Cloudflare in front of our servers for security and performance (protecting the site
      from bots and denial-of-service attacks). Cloudflare may set a small number of strictly
      necessary cookies to do this. These don't identify you personally, aren't used for tracking or
      advertising, and are exempt from consent requirements under EU ePrivacy rules because the
      Service can't function securely without them.
    </p>

    <h2>3. Payments</h2>
    <p>
      When you subscribe to a paid plan, you're redirected to Stripe's own secure checkout page to
      enter your payment details — this never touches our servers. Stripe may set its own cookies
      on their checkout page under their own policy; see
      <a href="https://stripe.com/cookies-policy/legal" target="_blank" rel="noopener">Stripe's Cookie Policy</a>.
    </p>

    <h2>4. What we don't use</h2>
    <p>
      No Google Analytics, no advertising pixels, no third-party trackers. If that ever changes,
      we'll update this page and ask for your consent where required.
    </p>

    <h2>5. Questions</h2>
    <p>
      Email <a href="mailto:vjetacademy@gmail.com">vjetacademy@gmail.com</a> if you have any
      questions about this policy.
    </p>
  </LegalLayout>
</template>

<script setup lang="ts">
import LegalLayout from '@/components/LegalLayout.vue'
</script>
