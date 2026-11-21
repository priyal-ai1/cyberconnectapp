import type { Config } from "tailwindcss";
const config: Config = {
  content: ["./app/**/*.{js,ts,jsx,tsx,mdx}"],
  theme: { extend: { colors: { ink: "#101d35", navy: "#122746", cyan: "#20c6d7", mist: "#f4f7fb" } } },
  plugins: []
};
export default config;
