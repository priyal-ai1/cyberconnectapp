import type { Metadata } from "next";
import "./globals.css";
export const metadata: Metadata = { title: "CyberConnect | Outreach Hub", description: "Cybersecurity community discovery and outreach CRM" };
export default function RootLayout({ children }: Readonly<{ children: React.ReactNode }>) {
  return <html lang="en"><body>{children}</body></html>;
}
