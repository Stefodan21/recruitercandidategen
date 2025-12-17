title Automated Candidate Data Pipeline Flow
direction right

// Groups and nodes
Start Retrieval [shape: oval, color: lightblue, icon: play]

// Parallel Retrieval
Parallel Retrieval [color: purple, icon: globe] {
  Query LinkedIn [icon: globe, color: purple]
  Query GitHub Pages [icon: github, color: purple]
  Query Vercel [icon: vercel, color: purple]
  Query Netlify [icon: netlify, color: purple]
  Query AWS S3 [icon: aws-s3, color: purple]
  Query Portfolio Sites [icon: file-text, color: purple]
  Proxy Rotation [icon: shuffle, color: orange]
  Headless Browsers [icon: monitor, color: orange]
  Raw Files Output [icon: file, color: gray]
}

// Parsing Content
Parsing Content [color: blue, icon: file-text] {
  Extract HTML Text [icon: code, color: blue]
  Extract PDF Text [icon: file-text, color: blue]
  Extract DOCX Markdown Text [icon: file-text, color: blue]
  Extract Entities [icon: user, color: teal]
  Regex Extraction [icon: search, color: teal]
  NLP Extraction [icon: cpu, color: teal]
  Combine Resume and Portfolio [icon: layers, color: teal]
  Parsed Candidate Profiles [icon: users, color: blue]
}

// Data Structuring & Normalization
Data Structuring and Normalization [color: green, icon: database] {
  Canonical Fields Mapping [icon: list, color: green]
  Normalize Skills [icon: check-square, color: green]
  Normalize Locations [icon: map-pin, color: green]
  Normalize Titles [icon: briefcase, color: green]
  Store in Database [icon: database, color: green]
  Skill Hash Map [icon: hash, color: green]
  Structured Candidate Records [icon: user-check, color: green]
}

// Deduplication & Identity Resolution
Deduplication and Identity Resolution [color: orange, icon: refresh-ccw] {
  Identify by Email [icon: mail, color: orange]
  Identify by LinkedIn [icon: linkedin, color: orange]
  Identify by GitHub [icon: github, color: orange]
  Identify by Portfolio [icon: file-text, color: orange]
  Hash File Comparison [icon: hash, color: orange]
  Fuzzy Matching [icon: shuffle, color: orange]
  Graph Traversal Merge [icon: share-2, color: orange]
  Deduplicated Candidates [icon: user-check, color: orange]
}

// Candidate Ranking

// Pipeline Integration
Pipeline Integration [color: lightblue, icon: send] {
  Export CSV [icon: file, color: lightblue]
  Export to Airtable CRM [icon: send, color: lightblue]
  Scheduled Scraping [icon: clock, color: lightblue]
  Error Handling Logging [icon: alert-triangle, color: red]
  Final Candidate Database [icon: database, color: lightblue]
  End [shape: oval, color: lightgreen, icon: check]
}

// Relationships
Start Retrieval > Parallel Retrieval
Proxy Rotation > Query LinkedIn
Proxy Rotation > Query GitHub Pages
Proxy Rotation > Query Vercel
Proxy Rotation > Query Netlify
Proxy Rotation > Query AWS S3
Proxy Rotation > Query Portfolio Sites
Headless Browsers > Query LinkedIn
Headless Browsers > Query GitHub Pages
Headless Browsers > Query Vercel
Headless Browsers > Query Netlify
Headless Browsers > Query AWS S3
Headless Browsers > Query Portfolio Sites
Query LinkedIn > Raw Files Output
Query GitHub Pages > Raw Files Output
Query Vercel > Raw Files Output
Query Netlify > Raw Files Output
Query AWS S3 > Raw Files Output
Query Portfolio Sites > Raw Files Output
Raw Files Output > Parsing Content

Extract HTML Text > Extract Entities
Extract PDF Text > Extract Entities
Extract DOCX Markdown Text > Extract Entities
Extract Entities > Regex Extraction
Extract Entities > NLP Extraction
Regex Extraction > Combine Resume and Portfolio
NLP Extraction > Combine Resume and Portfolio
Combine Resume and Portfolio > Parsed Candidate Profiles
Parsed Candidate Profiles > Data Structuring and Normalization

Canonical Fields Mapping > Normalize Skills
Canonical Fields Mapping > Normalize Locations
Canonical Fields Mapping > Normalize Titles
Normalize Skills > Store in Database
Normalize Locations > Store in Database
Normalize Titles > Store in Database
Store in Database > Skill Hash Map
Skill Hash Map > Structured Candidate Records
Structured Candidate Records > Deduplication and Identity Resolution

Identify by Email > Hash File Comparison
Identify by LinkedIn > Hash File Comparison
Identify by GitHub > Hash File Comparison
Identify by Portfolio > Hash File Comparison
Hash File Comparison > Fuzzy Matching
Fuzzy Matching > Graph Traversal Merge
Graph Traversal Merge > Deduplicated Candidates


Export CSV > Final Candidate Database
Export to Airtable CRM > Final Candidate Database
Scheduled Scraping > Final Candidate Database
Error Handling Logging > Final Candidate Database
Final Candidate Database > End