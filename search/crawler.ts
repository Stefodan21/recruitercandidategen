import { buildAllQueries } from "./bool_query";
import type { QueryInput } from "./bool_query";

async function runSearch(query: string) {
  const apiKey = process.env.GOOGLE_KEY;
  const cx = process.env.CX_ID;

  if (!apiKey || !cx) {
    throw new Error("Missing GOOGLE_KEY or CX_ID in environment variables");
  }

  const url =
    `https://www.googleapis.com/customsearch/v1` +
    `?key=${apiKey}` +
    `&cx=${cx}` +
    `&q=${encodeURIComponent(query)}`;

  const res = await fetch(url);
  const text = await res.text();

  try {
    return JSON.parse(text);
  } catch {
    console.error("❌ Google returned non‑JSON response for query:", query);
    console.error(text.slice(0, 200));
    throw new Error("Google Custom Search returned HTML instead of JSON");
  }
}

export async function runCrawler(input: QueryInput) {
  const queries = buildAllQueries(input);

  const tasks = queries.map(q => runSearch(q));
  return Promise.all(tasks);
}
