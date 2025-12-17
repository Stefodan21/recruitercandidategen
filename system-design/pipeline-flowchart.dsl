title Recruiter Lead Generation Pipeline (Detailed)

// Main pipeline groups
Search [color: blue, icon: search] {
  Start Search [shape: oval, color: lightblue, icon: play]
  Build Boolean Query [icon: filter]
  Execute Search Queries [icon: globe]
  Aggregate Profile Links [icon: link]
  Profile Links JSON [shape: oval, color: lightblue, icon: file-text]
}

Ingestion [color: orange, icon: download] {
  Start Ingestion [shape: oval, color: lightorange, icon: play]
  Fetch Codebase or Bundles [icon: download]
  Discover Candidate Profiles [icon: users]
  Extract Content [icon: file-text]
  Raw Profiles JSON [shape: oval, color: lightorange, icon: file-text]
  Deduplicate Profiles [icon: copy]
  Unique Profiles JSON [shape: oval, color: lightorange, icon: file-text]
}

Field Extraction [color: green, icon: database] {
  Start Field Extraction [shape: oval, color: lightgreen, icon: play]
  Extract Contact Information [icon: mail]
  Map Fields to Database [icon: database]
  Structured Profiles JSON [shape: oval, color: lightgreen, icon: file-text]
}

Export [color: purple, icon: upload] {
  Start Export [shape: oval, color: lavender, icon: play]
  Export to CSV [icon: file-text]
  Export to Database [icon: database]
  Export to Airtable [icon: table]
  Recruiter Ready CSV [shape: oval, color: lavender, icon: file-text]
  Database Entries [shape: oval, color: lavender, icon: database]
  Airtable Updates [shape: oval, color: lavender, icon: table]
}

// Common utilities (shared across stages)
Common Utilities [color: gray, icon: tool] {
  Caching [icon: database]
  Hashing [icon: lock]
  Logging [icon: log-in]
  IO Helpers [icon: file]
  Models [icon: code]
  Airtable Client [icon: api]
  Seen Profiles Table [icon: database]
}

// CI/CD orchestration (manages pipeline)
CI/CD Orchestration [color: black, icon: gear] {
  Pipeline Workflow [icon: code]
}

// Data flow relationships (artifact hand-off)
Start Search > Build Boolean Query
Build Boolean Query > Execute Search Queries
Execute Search Queries > Aggregate Profile Links
Aggregate Profile Links > Profile Links JSON

Profile Links JSON > Start Ingestion
Start Ingestion > Fetch Codebase or Bundles
Fetch Codebase or Bundles > Discover Candidate Profiles
Discover Candidate Profiles > Extract Content
Extract Content > Raw Profiles JSON
Raw Profiles JSON > Deduplicate Profiles
Deduplicate Profiles > Unique Profiles JSON

Unique Profiles JSON > Start Field Extraction
Start Field Extraction > Extract Contact Information
Extract Contact Information > Map Fields to Database
Map Fields to Database > Structured Profiles JSON

Structured Profiles JSON > Start Export
Start Export > Export to CSV
Start Export > Export to Database
Start Export > Export to Airtable

Export to CSV > Recruiter Ready CSV
Export to Database > Database Entries
Export to Airtable > Airtable Updates