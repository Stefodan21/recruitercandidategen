import { buildAllQueries } from "./bool_query";
import type { QueryInput } from "./bool_query";

// Mock search engine call — replace with real API call
async function runSearch(query: string) {
  // Example: call Bing, Google Custom Search, SerpAPI, etc.
  const response = await fetch("https://google.com/search", {
    method: "POST",
    body: JSON.stringify({ query }),
    headers: { "Content-Type": "application/json" }
  });

  return response.json();
}

export async function runCrawler(input: QueryInput) {
  const queries = buildAllQueries(input);

  const tasks = [];
  for (const q of queries) {
    tasks.push(runSearch(q));
  }
  return Promise.all(tasks);
}