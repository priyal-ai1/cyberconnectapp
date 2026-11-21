# CyberConnect – Cybersecurity Community Outreach Hub

A Next.js starter CRM for discovering, qualifying and organizing cybersecurity professionals for expert-led webinars.

## Included features

- Lead dashboard with sample records
- Lead create, edit, delete, search and filtering
- Country, priority and outreach-status filters
- Targeted search-engine query builder for public LinkedIn profile discovery
- CSV import and export
- Webinar campaign tracking
- Personalized LinkedIn/email-style outreach draft generator
- Do-not-contact flag
- Local browser storage mode (works without credentials)
- Optional Supabase persistence

## Important limitations

- The app does **not** scrape LinkedIn, bypass login, or claim access to private profiles.
- LinkedIn search is launched as a Google search query. You review the results and add verified people yourself.
- Contact details and profile information must be entered from legitimate sources.
- Message generation is a local template feature, not an external AI integration. It never sends messages.
- Supabase credentials enable database persistence, but this starter does not include user authentication. The SQL policies are development-only and must be replaced before storing real prospect data or making the app public.

## Run locally

Requirements: Node.js 20.9+ and npm.

```bash
npm install
cp .env.example .env.local
npm run dev
```

Open http://localhost:3000.

Without Supabase credentials, the app runs in local demo mode and stores data in the current browser's local storage. This is useful for testing, but data is not shared across devices or browsers.

## Connect Supabase

1. Create a project at https://supabase.com.
2. Open SQL Editor in the Supabase dashboard.
3. Run the contents of `supabase/schema.sql`.
4. Open Project Settings → API.
5. Copy the Project URL and anon/public key.
6. Put them in `.env.local`:

```env
NEXT_PUBLIC_SUPABASE_URL=https://YOUR-PROJECT.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=YOUR_SUPABASE_ANON_KEY
```

7. Restart `npm run dev`.

**Security before production:** This starter's SQL policies are intentionally permissive for initial testing. Do not store real contact data or expose the app publicly until you add Supabase Auth and replace the development policies with authenticated-user policies. Never put a Supabase service-role key in a `NEXT_PUBLIC_` variable.

## Deploy with GitHub + Vercel

1. Extract this ZIP.
2. Create a new empty repository in GitHub.
3. Upload the contents of the extracted `cyberconnect-outreach` folder to the repository root (not the enclosing folder).
4. In Vercel, choose **Add New → Project**, import the GitHub repository and keep the detected Next.js settings.
5. Add the two Supabase environment variables in Vercel → Project Settings → Environment Variables if using cloud storage.
6. Deploy. Future pushes to the connected GitHub branch trigger deployments.

If you do not configure Supabase, Vercel still deploys the app, but localStorage data is browser-specific and is not a shared cloud database.

## Project structure

```text
app/
  globals.css
  layout.tsx
  page.tsx
lib/
  supabase.ts
  types.ts
supabase/
  schema.sql
.env.example
README.md
```

## Build check

```bash
npm run build
```

If TypeScript or dependency versions have changed since packaging, run `npm install` and review the build output.

## Suggested production hardening

- Add Supabase Auth and per-user row-level security.
- Add a consent/source verification workflow.
- Add a provider integration only after confirming its API terms, pricing and permissions.
- Add a server-side AI provider for richer message drafting; keep API keys server-side.
- Add scheduled reminders only after selecting an email/calendar provider.
