package main

import (
	"encoding/json"
	"log"
	"os"
	"path/filepath"
	"strings"
)

const workspaceDir = "workspace"

type ProfileFile struct {
	URL      string `json:"url"`
	FilePath string `json:"file_path"`
	Type     string `json:"type"`
}

type Manifest struct {
	Profiles []ProfileFile `json:"profiles"`
}

func isProfileFile(path string) (string, bool) {
	lower := strings.ToLower(path)

	// Direct file matches
	if strings.HasSuffix(lower, "resume.pdf") {
		return "resume_pdf", true
	}
	if strings.HasSuffix(lower, "resume.docx") {
		return "resume_docx", true
	}
	if strings.HasSuffix(lower, "readme.md") {
		return "readme", true
	}

	// Directory matches
	if strings.Contains(lower, "/public/") {
		return "public_dir", true
	}
	if strings.Contains(lower, "/docs/") {
		return "docs_dir", true
	}
	if strings.Contains(lower, "/about/") {
		return "about_dir", true
	}
	if strings.Contains(lower, "/cv/") {
		return "cv_dir", true
	}

	return "", false
}

func main() {
	var manifest Manifest

	// Walk workspace directory
	filepath.Walk(workspaceDir, func(path string, info os.FileInfo, err error) error {
		if err != nil {
			log.Printf("error walking %s: %v", path, err)
			return nil
		}

		// Skip directories except for matching folder names
		if info.IsDir() {
			fileType, ok := isProfileFile(path + "/")
			if ok {
				manifest.Profiles = append(manifest.Profiles, ProfileFile{
					URL:      extractURLFromPath(path),
					FilePath: path,
					Type:     fileType,
				})
			}
			return nil
		}

		// Check files
		fileType, ok := isProfileFile(path)
		if ok {
			manifest.Profiles = append(manifest.Profiles, ProfileFile{
				URL:      extractURLFromPath(path),
				FilePath: path,
				Type:     fileType,
			})
		}

		return nil
	})

	// Output JSON manifest
	json.NewEncoder(os.Stdout).Encode(manifest)
}

// Extract original URL from folder name
// fetch_code.go uses folder names like: johndoe.dev or portfolio.vercel.app
func extractURLFromPath(path string) string {
	parts := strings.Split(path, string(filepath.Separator))
	if len(parts) < 2 {
		return ""
	}

	folder := parts[1]
	folder = strings.ReplaceAll(folder, "_", "/")
	return "https://" + folder
}
