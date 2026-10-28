<template>
  <LegalLayout title="Privacy Policy" last-updated="October 26, 2026">
    <p>
      This Privacy Policy explains what personal data VJet Academy collects, why, and what rights
      you have over it under the EU General Data Protection Regulation (GDPR).
    </p>

    <h2>1. Who we are</h2>
    <p>
      VJet Academy is operated by Vyron Charalampidis, a sole proprietorship registered in Greece.
      For the purposes of GDPR, Vyron Charalampidis is the data controller for personal data
      processed through this Service. You can reach us at
      <a href="mailto:vjetacademy@gmail.com">vjetacademy@gmail.com</a>.
    </p>

    <h2>2. What we collect</h2>
    <h3>Account data</h3>
    <p>Full name, email address, password (stored as a salted hash, never in plain text), and your licence category.</p>
    <h3>Payment data</h3>
    <p>
      We don't store your card details. Payments are processed by Stripe; we keep a record of each
      transaction (amount, currency, plan, date) for billing and accounting purposes.
    </p>
    <h3>Study activity</h3>
    <p>Exam attempts and scores, module progress, and your AI Instructor conversation history, so you can track progress and resume conversations.</p>
    <h3>Technical data</h3>
    <p>Standard server and security logs (IP address, browser type, request timestamps), collected automatically for security and troubleshooting.</p>

    <h2>3. Why we process it, and on what legal basis</h2>
    <ul>
      <li><strong>To provide the Service</strong> (account creation, study content, exam simulator, billing) — necessary to perform our contract with you.</li>
      <li><strong>To secure the Service</strong> (fraud prevention, abuse detection) — our legitimate interest.</li>
      <li><strong>To keep accounting records</strong> of payments — a legal obligation under Greek tax law.</li>
      <li><strong>To respond to support requests</strong> you send us — necessary to perform our contract, or your consent.</li>
    </ul>
    <p>We don't use your data for advertising, and we don't sell personal data to third parties.</p>

    <h2>4. Who we share data with</h2>
    <p>We use a small number of service providers ("processors") to run VJet Academy:</p>
    <ul>
      <li><strong>Stripe</strong> — payment processing. See <a href="https://stripe.com/privacy" target="_blank" rel="noopener">Stripe's Privacy Policy</a>.</li>
      <li><strong>Google (Gemini API)</strong> — powers the AI Instructor; your messages are sent to Google for processing a response.</li>
      <li><strong>Resend</strong> — sends transactional emails (e.g. password reset).</li>
      <li><strong>Hetzner</strong> — hosts our servers (EU-based, Germany).</li>
      <li><strong>Cloudflare</strong> — content delivery and security (DDoS/bot protection) in front of our servers.</li>
    </ul>
    <p>
      These providers only process data on our instructions and are bound by their own data
      protection commitments. Some may process data outside the EU/EEA, in which case they rely on
      mechanisms such as the EU Standard Contractual Clauses to safeguard your data.
    </p>

    <h2>5. How long we keep your data</h2>
    <p>
      We keep your account data for as long as your account is active. If you delete your account,
      your study progress, exam history, and AI Instructor conversations are deleted immediately.
      Payment transaction records are kept for the period required by Greek accounting and tax law
      (currently five years), even after account deletion, as we're legally obliged to retain them.
    </p>

    <h2>6. Your rights</h2>
    <p>Under GDPR, you have the right to:</p>
    <ul>
      <li><strong>Access</strong> the personal data we hold about you;</li>
      <li><strong>Correct</strong> inaccurate data (you can update your name and licence type in Settings);</li>
      <li><strong>Erase</strong> your data (delete your account in Settings, or ask us to);</li>
      <li><strong>Restrict or object</strong> to certain processing;</li>
      <li><strong>Receive a copy</strong> of your data in a portable format;</li>
      <li><strong>Lodge a complaint</strong> with the Hellenic Data Protection Authority (<a href="https://www.dpa.gr" target="_blank" rel="noopener">www.dpa.gr</a>) or your local supervisory authority.</li>
    </ul>
    <p>
      To exercise any of these rights, email <a href="mailto:vjetacademy@gmail.com">vjetacademy@gmail.com</a>.
      We'll respond within one month, as required by GDPR.
    </p>

    <h2>7. Security</h2>
    <p>
      We use industry-standard measures to protect your data: passwords are hashed, traffic between
      your browser and our servers is encrypted (HTTPS/TLS), and access to production systems is
      restricted. No system is 100% secure, but we take reasonable steps to protect your information.
    </p>

    <h2>8. Children</h2>
    <p>VJet Academy is intended for users aged 16 and over, consistent with our Terms of Service.</p>

    <h2>9. Changes to this policy</h2>
    <p>
      We may update this Privacy Policy from time to time. We'll update the "Last updated" date
      above, and for material changes, notify you by email.
    </p>

    <h2>10. Contact</h2>
    <p>
      Questions about this policy or your data? Email
      <a href="mailto:vjetacademy@gmail.com">vjetacademy@gmail.com</a>.
    </p>
  </LegalLayout>
</template>

<script setup lang="ts">
import LegalLayout from '@/components/LegalLayout.vue'
</script>
