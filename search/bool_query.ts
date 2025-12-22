

interface QueryInput {
  role: string;
  skills: string[];
  location: string;
}
const sites = [ 
  "vercel.app", 
  "netlify.app", 
  "github.io", 
  "gitlab.io", 
  "s3.amazonaws.com", 
  "pages.dev", 
  "web.app", 
  "firebaseapp.com", 
  "surge.sh", 
  "onrender.com", 
  "ondigitalocean.app",
  "repl.co",
  "dev" // .dev domains 
];


export function buildQuery(input: QueryInput, site: string): string {
  const skillPart = `(${input.skills.join(" OR ")})`;

  return `site:${site} "${input.role}" ${skillPart} "${input.location}"`;
}

