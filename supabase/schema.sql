-- CyberConnect schema. Run this in Supabase SQL Editor.
create extension if not exists pgcrypto;
create table if not exists public.leads (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  title text default '',
  company text default '',
  country text default '',
  city text default '',
  linkedin_url text default '',
  email text default '',
  expertise text default '',
  experience text default '',
  score integer default 50 check (score between 0 and 100),
  priority text default 'Medium' check (priority in ('High','Medium','Low')),
  status text default 'New Lead',
  source text default '',
  notes text default '',
  added_at date default current_date,
  last_contacted date,
  next_follow_up date,
  do_not_contact boolean default false,
  created_at timestamptz default now()
);
create table if not exists public.campaigns (
  id uuid primary key default gen_random_uuid(),
  title text not null,
  topic text default '',
  webinar_date date,
  expert text default '',
  country text default '',
  registration_url text default '',
  status text default 'Planning',
  created_at timestamptz default now()
);
-- This starter app uses the Supabase anon key from the browser. Enable RLS and
-- create policies appropriate to your deployment before storing real contact data.
-- For a private single-user deployment, restrict access to authenticated users.
alter table public.leads enable row level security;
alter table public.campaigns enable row level security;
-- Development-only policies for initial setup. Replace with authenticated-user
-- policies before using real prospect data in a production environment.
create policy "starter leads access" on public.leads for all using (true) with check (true);
create policy "starter campaigns access" on public.campaigns for all using (true) with check (true);
