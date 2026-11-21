export type LeadStatus = "New Lead" | "Research Completed" | "Ready to Contact" | "Connection Request Sent" | "Connected" | "Invitation Sent" | "Interested" | "Registered" | "Follow-up Required" | "Not Interested" | "No Response";
export type Lead = {
  id: string; name: string; title: string; company: string; country: string; city: string;
  linkedin: string; email: string; expertise: string; experience: string; score: number;
  priority: "High" | "Medium" | "Low"; status: LeadStatus; source: string; notes: string;
  addedAt: string; lastContacted: string; nextFollowUp: string; doNotContact: boolean;
};
export type Campaign = { id: string; title: string; topic: string; date: string; expert: string; country: string; registration: string; status: string; };
