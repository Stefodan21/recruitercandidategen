use std::io::{self, Read};
use serde_json::{Value, json};

fn main() {
    // Read entire stdin (contact_fields.json)
    let mut input = String::new();
    io::stdin().read_to_string(&mut input).unwrap();

    // Parse JSON array
    let contacts: Vec<Value> = serde_json::from_str(&input).unwrap();

    let mut results = Vec::new();

    for c in contacts {
        let name = c.get("name").cloned().unwrap_or(Value::Null);
        let email = c.get("email").cloned().unwrap_or(Value::Null);
        let phone = c.get("phone").cloned().unwrap_or(Value::Null);
        let linkedin = c.get("linkedin").cloned().unwrap_or(Value::Null);
        let github = c.get("github").cloned().unwrap_or(Value::Null);

        let mapped = json!({
            "name": name,
            "email": email,
            "phone": phone,
            "linkedin_url": linkedin,
            "github_url": github
        });

        results.push(mapped);
    }

    // Output final mapped JSON
    println!("{}", serde_json::to_string_pretty(&results).unwrap());
}
