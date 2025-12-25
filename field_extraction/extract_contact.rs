use std::io::{self, Read};
use std::collections::HashMap;
use regex::Regex;
use serde_json::{Value, json};

fn main() {
    // Read entire stdin (raw_profiles.json)
    let mut input = String::new();
    io::stdin().read_to_string(&mut input).unwrap();

    // Parse JSON array
    let profiles: Vec<Value> = serde_json::from_str(&input).unwrap();

    // Precompile regexes
    let re_email = Regex::new(r"[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}").unwrap();
    let re_phone = Regex::new(r"(\+?\d[\d\-\(\) ]{7,}\d)").unwrap();
    let re_linkedin = Regex::new(r"(https?://)?(www\.)?linkedin\.com/[A-Za-z0-9/_\-]+").unwrap();
    let re_github = Regex::new(r"(https?://)?(www\.)?github\.com/[A-Za-z0-9_\-]+").unwrap();

    let mut results = Vec::new();

    for profile in profiles {
        let text = profile["text"].as_str().unwrap_or("");

        let name = extract_name(text);
        let email = re_email.find(text).map(|m| m.as_str().to_string());
        let phone = re_phone.find(text).map(|m| m.as_str().to_string());
        let linkedin = re_linkedin.find(text).map(|m| m.as_str().to_string());
        let github = re_github.find(text).map(|m| m.as_str().to_string());

        let mut out = HashMap::new();
        out.insert("name", name);
        out.insert("email", email);
        out.insert("phone", phone);
        out.insert("linkedin", linkedin);
        out.insert("github", github);

        results.push(json!(out));
    }

    // Output structured JSON to stdout
    println!("{}", serde_json::to_string_pretty(&results).unwrap());
}

// ------------------------------------------------------------
// Name Extraction Heuristic
// ------------------------------------------------------------
//
// Rules:
// 1. Take the first non-empty line.
// 2. Skip lines containing contact info.
// 3. Skip section headers.
// 4. Skip long lines (names are short).
// ------------------------------------------------------------

fn extract_name(text: &str) -> Option<String> {
    for line in text.lines() {
        let l = line.trim();
        if l.is_empty() {
            continue;
        }

        let lower = l.to_lowercase();

        // Skip contact info
        if lower.contains('@')
            || lower.contains("linkedin.com")
            || lower.contains("github.com")
            || lower.contains("phone")
            || lower.contains("email")
        {
            continue;
        }

        // Skip section headers
        if lower.starts_with("summary")
            || lower.starts_with("experience")
            || lower.starts_with("education")
            || lower.starts_with("skills")
            || lower.starts_with("projects")
            || lower.starts_with("about")
        {
            continue;
        }

        // Skip long lines (names are short)
        let wc = l.split_whitespace().count();
        if wc == 0 || wc > 6 {
            continue;
        }

        return Some(l.to_string());
    }

    None
}
